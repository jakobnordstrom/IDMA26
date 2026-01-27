% Binary tree illustrating recursive call for merge sort of list
%
%  A = [5, 6, 4, 7, 3, 8, 2, 9, 1, 10]
%  NOT A = [5, 2, 19, 7, 6, 12, 10, 17, 13, 14]  NOT
%
%
% Also contains some code for generating complete binary trees in general.
%
% Compile the figures by doing:
%
%    mpost merge-sort-recursion-tree.mp
%


color gray;
pair  lblshift;

gray     :=  0.80 white;
%   height   :=  3;              % height of binary tree
height   :=  4;              % height of binary tree


%   hscaletree := 16.00 mm;      % scale factor for width of tree / figure
hscaletree :=  7.50 mm;      % scale factor for width of tree / figure
vscale     := 15.00 mm;      % scale factor for height of tree / figure
%   csize    :=   5.0 mm;    % size of tree nodes
csize      := 16.0 mm;       % size of tree nodes
boxheight  :=  7 mm;
boxwidth   := 20 mm;

% macro for building binary tree
def bintreestructure =  
  % Define leaf row;  
  z[2**height] = origin;  
  
  for j = (2**height + 1) upto (2**(height+1) - 1):  
    y[j] = y[j - 1];  
    x[j] = x[j - 1] + hscaletree;  
  endfor  
    
  % Define rows above   
  for i = (height - 1) downto 0:  
    y[2**i] = y[2**(i+1)] + vscale;  
    x[2**i] = (x[2**(i+1)] + x[2**(i+1) + 1]) / 2;   
    for j = (2**i + 1) upto (2**(i+1) - 1):  
      y[j] = y[j - 1];  
      x[j] = (x[2*j] + x[2*j + 1]) / 2;   
    endfor  
  endfor  
    
  % Define tree vertices  
  for j = 1 upto (2**(height + 1) - 1):  
    c[j] = fullcircle scaled csize shifted z[j];  
  endfor  

  % Define tree boxes
  for j = 1 upto (2**(height + 1) - 1):  
    box[j] =
      (z[j] + (boxwidth/2, boxheight/2))--
      (z[j] + (boxwidth/2, -boxheight/2))--
      (z[j] + (-boxwidth/2, -boxheight/2))--
      (z[j] + (-boxwidth/2, boxheight/2))--
      cycle;
  endfor  
enddef;  
    
def drawallvertices =  
  % Draw gray vertices
  for j = 1 upto (2**(height+1) - 1):    
    fill c[j]  withcolor gray;
    draw c[j];
  endfor
enddef;  

def drawallboxes =
  for j = 1 upto (2**(height+1) - 1):    
    draw box[j];
  endfor
enddef;  

def drawalledgesdown = 
  for i = height-1 downto 0:  
    for j = (2**i) upto (2**(i+1) - 1):  
      drawarrow z[j]--z[2*j] cutbefore c[j] cutafter c[2*j];  
      drawarrow z[j]--z[2*j + 1] cutbefore c[j] cutafter c[2*j + 1];  
    endfor  
  endfor  
enddef;  

def drawalledgesup = 
  for i = height-1 downto 0:  
    for j = (2**i) upto (2**(i+1) - 1):  
      drawarrow z[2*j]--z[j] cutbefore c[2*j] cutafter c[j];  
      drawarrow z[2*j + 1]--z[j] cutbefore c[2*j + 1] cutafter c[j];  
    endfor  
  endfor  
enddef;  

def drawmergetreeedgesdown =
  % Use boxes rather than circled notes for cutting the edges
  for i = 2 downto 0:  
    for j = (2**i) upto (2**(i+1) - 1):  
      drawarrow z[j]--z[2*j] cutbefore box[j] cutafter box[2*j];  
      drawarrow z[j]--z[2*j + 1] cutbefore box[j] cutafter box[2*j + 1];  
    endfor  
  endfor  
  for j = 8, 12:  
    drawarrow z[j]--z[2*j] cutbefore box[j] cutafter box[2*j];  
    drawarrow z[j]--z[2*j + 1] cutbefore box[j] cutafter box[2*j + 1];  
  endfor  
enddef;  

def drawmergetreeedgesup = 
  % Use boxes rather than circled notes for cutting the edges
  for i = 2 downto 0:  
    for j = (2**i) upto (2**(i+1) - 1):  
      drawarrow z[2*j]--z[j] cutbefore box[2*j] cutafter box[j];  
      drawarrow z[2*j + 1]--z[j] cutbefore box[2*j + 1] cutafter box[j];  
    endfor  
  endfor  
  for j = 8, 12:  
    drawarrow z[2*j]--z[j] cutbefore box[2*j] cutafter box[j];  
    drawarrow z[2*j + 1]--z[j] cutbefore box[2*j + 1] cutafter box[j];  
  endfor  
enddef;  

def labelssplitting =
% Recursive calls splitting list to be merge sorted
%  A = [5, 6, 4, 7, 3, 8, 2, 9, 1, 10]
%  NOT A = [8, 4, 2, 9 , 3, 1, 5, 10, 7, 6] NOT

  label(btex $
      [5, 6, 4, 7, 3, 8, 2, 9, 1, 10]
      $ etex , z[1]);
  
  label(btex $
      [5, 6, 4, 7, 3] 
      $ etex  , z[2]);  
  label(btex $
      [8, 2, 9, 1, 10]
      $ etex , z[3]);
  
  label(btex $
      [5, 6, 4]
      $ etex , z[4]);  
  label(btex $
      [7, 3] 
      $ etex   , z[5]);  
  label(btex $
      [8, 2, 9] 
      $ etex , z[6]);  
  label(btex $
      [1, 10]
      $ etex  , z[7]);

  label(btex $[5,6]$ etex , z[8]);  
  label(btex $[4]$ etex   , z[9]);  
  label(btex $[7]$ etex   , z[10]);  
  label(btex $[3]$ etex   , z[11]);  
  label(btex $[8,2]$ etex , z[12]);  
  label(btex $[9]$ etex   , z[13]);  
  label(btex $[1]$ etex   , z[14]);  
  label(btex $[10]$ etex   , z[15]);  

  label(btex $[5]$ etex , z[16]);  
  label(btex $[6]$ etex , z[17]);  

  label(btex $[8]$ etex , z[24]);  
  label(btex $[2]$ etex , z[25]);  
enddef;

def labelsbottomup =
% Sorted lists bottom up
%  A = [5, 6, 4, 7, 3, 8, 2, 9, 1, 10]
%  NOT A = [8, 4, 2, 9 , 3, 1, 5, 10, 7, 6] NOT

  label(btex $
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      $ etex , z[1]);
  
  label(btex $
      [3, 4, 5, 6, 7] 
      $ etex  , z[2]);  
  label(btex $
      [1, 2, 8, 9, 10]  
      $ etex , z[3]);
  
  label(btex $
      [4, 5, 6] 
      $ etex , z[4]);  
  label(btex $
      [3, 7]
      $ etex   , z[5]);  
  label(btex $
      [2, 8, 9]
      $ etex , z[6]);  
  label(btex $
      [1, 10]  
      $ etex  , z[7]);

  label(btex $[5,6]$ etex , z[8]);  
  label(btex $[4]$ etex   , z[9]);  
  label(btex $[7]$ etex   , z[10]);  
  label(btex $[3]$ etex   , z[11]);  
  label(btex $[2,8]$ etex , z[12]);  
  label(btex $[9]$ etex   , z[13]);  
  label(btex $[1]$ etex   , z[14]);  
  label(btex $[10]$ etex   , z[15]);  

  label(btex $[5]$ etex , z[16]);  
  label(btex $[6]$ etex , z[17]);  

  label(btex $[8]$ etex , z[24]);  
  label(btex $[2]$ etex , z[25]);  
enddef;


%
% Merge sort trees 
%

beginfig(1);
  path c[];
  path box[];

  bintreestructure;
%     drawallvertices;
%     drawallboxes;
  drawmergetreeedgesdown;
  labelssplitting;
endfig;
 
beginfig(2);
  path c[];
  path box[];

  bintreestructure;
  drawmergetreeedgesup;
  labelsbottomup;
endfig;
 
 
end
