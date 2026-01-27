%
% Heap configurations for priority queue for Prim
%
%    Compile by doing "mpost prim-heap.mp"
%

color gray;
pair  lblshift;

gray         :=  0.80 white;
csize        :=  6.0 mm; 
xcsize       := 11.0 mm; 
ycsize       :=  7.0 mm; 
voffset      := 12.0 mm;
hoffset      := 13.0 mm;
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
% Draw vertex labels
%

def drawedge (expr startpt, midpt, endpt, lbl, lblpos) =
  drawarrow z[startpt]..midpt..z[endpt] cutbefore c[startpt] cutafter c[endpt];
  label(lbl, lblpos);
enddef;



% Before dequeueing a
beginfig(1);
  path c[];

  drawheap (2, 6);

  label(btex $a : 0$ etex , z[1]);
  label(btex $b : \infty$ etex , z[2]);
  label(btex $c : \infty$ etex , z[3]);
  label(btex $d : \infty$ etex , z[4]);
  label(btex $e : \infty$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
endfig;

% After dequeueing a
beginfig(2);
  path c[];

  drawheap (2, 5);

  label(btex $f : \infty$ etex , z[1]);
  label(btex $b : \infty$ etex , z[2]);
  label(btex $c : \infty$ etex , z[3]);
  label(btex $d : \infty$ etex , z[4]);
  label(btex $e : \infty$ etex , z[5]);
endfig;

% After relaxing (a,b)
beginfig(3);
  path c[];

  drawheap (2, 5);

  label(btex $b : 4$ etex , z[1]);
  label(btex $f : \infty$ etex , z[2]);
  label(btex $c : \infty$ etex , z[3]);
  label(btex $d : \infty$ etex , z[4]);
  label(btex $e : \infty$ etex , z[5]);
endfig;

% After relaxing (a,c) 
beginfig(4);
  path c[];

  drawheap (2, 5);

  label(btex $c : 1$ etex , z[1]);
  label(btex $f : \infty$ etex , z[2]);
  label(btex $b : 4$ etex , z[3]);
  label(btex $d : \infty$ etex , z[4]);
  label(btex $e : \infty$ etex , z[5]);
endfig;

% After relaxing (a,cd 
beginfig(5);
  path c[];

  drawheap (2, 5);

  label(btex $c : 1$ etex , z[1]);
  label(btex $d : 5$ etex , z[2]);
  label(btex $b : 4$ etex , z[3]);
  label(btex $f : \infty$ etex , z[4]);
  label(btex $e : \infty$ etex , z[5]);
endfig;

% After dequeueing c
beginfig(6);
  path c[];

  drawheap (2, 4);

  label(btex $b : 4$ etex , z[1]);
  label(btex $d : 5$ etex , z[2]);
  label(btex $e : \infty$ etex , z[3]);
  label(btex $f : \infty$ etex , z[4]);
endfig;

% After relaxing (c,b)
beginfig(7);
  path c[];

  drawheap (2, 4);

  label(btex $b : 2$ etex , z[1]);
  label(btex $d : 5$ etex , z[2]);
  label(btex $e : \infty$ etex , z[3]);
  label(btex $f : \infty$ etex , z[4]);
endfig;

% After relaxing (c,e)
beginfig(8);
  path c[];

  drawheap (2, 4);

  label(btex $b : 2$ etex , z[1]);
  label(btex $d : 5$ etex , z[2]);
  label(btex $e : 4$ etex , z[3]);
  label(btex $f : \infty$ etex , z[4]);
endfig;

% Empty heap
beginfig(10);
  path c[];

  drawheap (2, 0);

endfig;


end
