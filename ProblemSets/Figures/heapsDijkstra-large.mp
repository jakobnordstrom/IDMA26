%
% Heap configurations for priority queue for Dijkstra, 8 vertex graph
%
%    Compile by doing "mpost heapsDijkstra-large.mp"
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



% After dequeueing a
beginfig(1);
  path c[];

  drawheap (2, 7);

  label(btex $h : \infty$ etex , z[1]);
  label(btex $b : \infty$ etex , z[2]);
  label(btex $c : \infty$ etex , z[3]);
  label(btex $d : \infty$ etex , z[4]);
  label(btex $e : \infty$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
  label(btex $g : \infty$ etex , z[7]);
endfig;

% After relaxing (a,b)
beginfig(2);
  path c[];

  drawheap (2, 7);

  label(btex $b : 1$ etex , z[1]);
  label(btex $h : \infty$ etex , z[2]);
  label(btex $c : \infty$ etex , z[3]);
  label(btex $d : \infty$ etex , z[4]);
  label(btex $e : \infty$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
  label(btex $g : \infty$ etex , z[7]);
endfig;

% After relaxing (a,d)
beginfig(3);
  path c[];

  drawheap (2, 7);

  label(btex $b : 1$ etex , z[1]);
  label(btex $d : 5$ etex , z[2]);
  label(btex $c : \infty$ etex , z[3]);
  label(btex $h : \infty$ etex , z[4]);
  label(btex $e : \infty$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
  label(btex $g : \infty$ etex , z[7]);
endfig;

% After relaxing (a,e) 
beginfig(4);
  path c[];

  drawheap (2, 7);

  label(btex $b : 1$ etex , z[1]);
  label(btex $d : 5$ etex , z[2]);
  label(btex $c : \infty$ etex , z[3]);
  label(btex $h : \infty$ etex , z[4]);
  label(btex $e : 6$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
  label(btex $g : \infty$ etex , z[7]);
endfig;

% After relaxing (a,g)
beginfig(5);
  path c[];

  drawheap (2, 7);

  label(btex $b : 1$ etex , z[1]);
  label(btex $d : 5$ etex , z[2]);
  label(btex $g : 9$ etex , z[3]);
  label(btex $h : \infty$ etex , z[4]);
  label(btex $e : 6$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
  label(btex $c : \infty$ etex , z[7]);
endfig;

% After dequeueing b
beginfig(6);
  path c[];

  drawheap (2, 6);

  label(btex $d : 5$ etex , z[1]);
  label(btex $e : 6$ etex , z[2]);
  label(btex $g : 9$ etex , z[3]);
  label(btex $h : \infty$ etex , z[4]);
  label(btex $c : \infty$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
endfig;

% After relaxing (b,c)
beginfig(7);
  path c[];

  drawheap (2, 6);

  label(btex $c : 2$ etex , z[1]);
  label(btex $d : 5$ etex , z[2]);
  label(btex $g : 9$ etex , z[3]);
  label(btex $h : \infty$ etex , z[4]);
  label(btex $e : 6$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
endfig;

% After relaxing (b,e)
beginfig(8);
  path c[];

  drawheap (2, 6);

  label(btex $c : 2$ etex , z[1]);
  label(btex $e : 3$ etex , z[2]);
  label(btex $g : 9$ etex , z[3]);
  label(btex $h : \infty$ etex , z[4]);
  label(btex $d : 5$ etex , z[5]);
  label(btex $f : \infty$ etex , z[6]);
endfig;

% After relaxing (b,e)
beginfig(9);
  path c[];

  drawheap (2, 6);

  label(btex $c : 2$ etex , z[1]);
  label(btex $e : 3$ etex , z[2]);
  label(btex $g : 9$ etex , z[3]);
  label(btex $h : \infty$ etex , z[4]);
  label(btex $d : 5$ etex , z[5]);
  label(btex $f : 10$ etex , z[6]);
endfig;


end
