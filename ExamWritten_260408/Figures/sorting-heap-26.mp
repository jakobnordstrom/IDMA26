%
% Heap configurations for heap sort
%
%    Compile by doing "mpost sorting-heap-26.mp"
%

color gray;
pair  lblshift;

gray         :=  0.80 white;
csize        :=  6.0 mm; 
%   xcsize       := 11.0 mm; 
%   ycsize       :=  7.0 mm; 
xcsize       :=  8.0 mm; 
ycsize       :=  5.0 mm; 
%   voffset      := 12.0 mm;
%   hoffset      := 13.0 mm;
voffset      :=  8.0 mm;
hoffset      :=  9.5 mm;
edgeoffset   :=  2.25 mm;
edgebendval  :=  5.0 mm;

%
% Define nodes and draw them
%
def drawheap (expr height, lastnode) =
  i := 0;

  % Define points
  z[1] = origin;
  
  for j := 2**height + 1 upto 2**(height + 1) - 1:
    x[j] = x[j-1] + hoffset;
    y[j] = y[j-1];
  endfor

  for i := height - 1 downto 0:
    for j := 2**i  upto 2**(i+1) - 1:
      y[j] = y[2 * j] + voffset;
      x[j] = (x[2 * j]  + x[2 * j + 1]) / 2;
    endfor
  endfor
  
  % Define nodes
  for i := 1 upto 2**(height + 1) - 1:
    c[i] = fullcircle xscaled xcsize yscaled ycsize shifted z[i];
%       draw c[i];
  endfor

  % Make sure to fix size of picture (low-tech; by drawing white nodes)
  draw c[1] withcolor white;
  draw c[2**height] withcolor white;
  draw c[2**(height + 1) - 1] withcolor white;

  % Draw nodes
  for i := 1 upto lastnode:
    draw c[i];
    if (i > 1):
      drawarrow z[i]--z[floor (i / 2)] cutbefore c[i] cutafter c[floor (i / 2)];
    fi   
  endfor
enddef;

%
% Define nodes and draw them
%
def drawheapminusonelevel (expr height, lastnode) =
  i := 0;

  % Define points
  z[1] = origin;
  
  for j := 2**height + 1 upto 2**(height + 1) - 1:
    x[j] = x[j-1] + hoffset;
    y[j] = y[j-1];
  endfor

  for i := height - 1 downto 0:
    for j := 2**i  upto 2**(i+1) - 1:
      y[j] = y[2 * j] + voffset;
      x[j] = (x[2 * j]  + x[2 * j + 1]) / 2;
    endfor
  endfor
  
  % Define nodes
  for i := 1 upto 2**(height + 1) - 1:
    c[i] = fullcircle xscaled xcsize yscaled ycsize shifted z[i];
%       draw c[i];
  endfor

  % Make sure to fix size of picture (low-tech; by drawing white nodes)
  draw c[1] withcolor white;
%     draw c[2**height] withcolor white;
%     draw c[2**(height + 1) - 1] withcolor white;
  draw c[2**(height - 1)] withcolor white;
  draw c[2**(height) - 1] withcolor white;

  % Draw nodes
  for i := 1 upto lastnode:
    draw c[i];
    if (i > 1):
      drawarrow z[i]--z[floor (i / 2)] cutbefore c[i] cutafter c[floor (i / 2)];
    fi   
  endfor
enddef;

%
% Draw vertex labels
%

def drawedge (expr startpt, midpt, endpt, lbl, lblpos) =
  drawarrow z[startpt]..midpt..z[endpt] cutbefore c[startpt] cutafter c[endpt];
  label(lbl, lblpos);
enddef;



% Input array
beginfig(1);
  path c[];

  drawheap (3, 8);

  label(btex  $11$ etex , z[1]);
  label(btex  $3$ etex , z[2]);
  label(btex  $19$ etex , z[3]);
  label(btex  $5$ etex , z[4]);
  label(btex  $17$ etex , z[5]);
  label(btex  $2$ etex , z[6]);
  label(btex  $13$ etex , z[7]);
  label(btex  $7$ etex , z[8]);
endfig;

% After max-heapify on 4th node
beginfig(2);
  path c[];

  drawheap (3, 8);

  label(btex  $11$ etex , z[1]);
  label(btex  $3$ etex , z[2]);
  label(btex  $19$ etex , z[3]);
  label(btex  $7$ etex , z[4]);
  label(btex  $17$ etex , z[5]);
  label(btex  $2$ etex , z[6]);
  label(btex  $13$ etex , z[7]);
  label(btex  $5$ etex , z[8]);
endfig;

% After max-heapify on 2nd node
beginfig(3);
  path c[];

  drawheap (3, 8);

  label(btex  $11$ etex , z[1]);
  label(btex  $17$ etex , z[2]);
  label(btex  $19$ etex , z[3]);
  label(btex  $7$ etex , z[4]);
  label(btex  $3$ etex , z[5]);
  label(btex  $2$ etex , z[6]);
  label(btex  $13$ etex , z[7]);
  label(btex  $5$ etex , z[8]);
endfig;

% After max-heapify on root node
beginfig(4);
  path c[];

  drawheap (3, 8);

  label(btex  $19$ etex , z[1]);
  label(btex  $17$ etex , z[2]);
  label(btex  $13$ etex , z[3]);
  label(btex  $7$ etex , z[4]);
  label(btex  $3$ etex , z[5]);
  label(btex  $2$ etex , z[6]);
  label(btex  $11$ etex , z[7]);
  label(btex  $5$ etex , z[8]);
endfig;

% Right after removing largest element 19
beginfig(5);
  path c[];

  drawheapminusonelevel (3, 7);

  label(btex  $5$ etex , z[1]);
  label(btex  $17$ etex , z[2]);
  label(btex  $13$ etex , z[3]);
  label(btex  $7$ etex , z[4]);
  label(btex  $3$ etex , z[5]);
  label(btex  $2$ etex , z[6]);
  label(btex  $11$ etex , z[7]);
endfig;

% After max-heapify on root again
beginfig(6);
  path c[];

  drawheapminusonelevel (3, 7);

  label(btex  $17$ etex , z[1]);
  label(btex  $7$ etex , z[2]);
  label(btex  $13$ etex , z[3]);
  label(btex  $5$ etex , z[4]);
  label(btex  $3$ etex , z[5]);
  label(btex  $2$ etex , z[6]);
  label(btex  $11$ etex , z[7]);
endfig;

% Right after removing next-to-largest element 17
beginfig(7);
  path c[];

  drawheapminusonelevel (3, 6);

  label(btex  $11$ etex , z[1]);
  label(btex  $7$ etex , z[2]);
  label(btex  $13$ etex , z[3]);
  label(btex  $5$ etex , z[4]);
  label(btex  $3$ etex , z[5]);
  label(btex  $2$ etex , z[6]);
endfig;


% After max-heapify on root again
beginfig(8);
  path c[];

  drawheapminusonelevel (3, 6);

  label(btex  $13$ etex , z[1]);
  label(btex  $7$ etex , z[2]);
  label(btex  $11$ etex , z[3]);
  label(btex  $5$ etex , z[4]);
  label(btex  $3$ etex , z[5]);
  label(btex  $2$ etex , z[6]);
endfig;



end
