%
% Heap configurations for Dijkstra's algorithm from Kastrup to DIKU
%
%    Compile by doing "mpost public-transport-heaps-25.mp"
%

color gray;
pair  lblshift;

gray         :=  0.80 white;
csize        :=  6.0 mm; 
xcsize       := 12.0 mm; 
ycsize       :=  7.0 mm; 
voffset      := 12.0 mm;
hoffset      := 14.5 mm;
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



% Before dequeueing A
beginfig(1);
  path c[];

  drawheap (2, 6);

  label(btex $A : 0$ etex , z[1]);
  label(btex $H : \infty$ etex , z[2]);
  label(btex $K : \infty$ etex , z[3]);
  label(btex $N : \infty$ etex , z[4]);
  label(btex $U : \infty$ etex , z[5]);
  label(btex $V : \infty$ etex , z[6]);
endfig;

% After dequeueing A
beginfig(2);
  path c[];

  drawheap (2, 5);

  label(btex $V : \infty$ etex , z[1]);
  label(btex $H : \infty$ etex , z[2]);
  label(btex $K : \infty$ etex , z[3]);
  label(btex $N : \infty$ etex , z[4]);
  label(btex $U : \infty$ etex , z[5]);
endfig;

% After relaxing (A,H)
beginfig(3);
  path c[];

  drawheap (2, 5);

  label(btex $H : 20$ etex     , z[1]);
  label(btex $V : \infty$ etex , z[2]);
  label(btex $K : \infty$ etex , z[3]);
  label(btex $N : \infty$ etex , z[4]);
  label(btex $U : \infty$ etex , z[5]);
endfig;

% After relaxing (A,K)
beginfig(4);
  path c[];

  drawheap (2, 5);

  label(btex $K : 13$ etex     , z[1]);
  label(btex $V : \infty$ etex , z[2]);
  label(btex $H : 20$ etex     , z[3]);
  label(btex $N : \infty$ etex , z[4]);
  label(btex $U : \infty$ etex , z[5]);
endfig;

% After dequeueing K
beginfig(5);
  path c[];

  drawheap (2, 4);

  label(btex $H : 20$ etex     , z[1]);
  label(btex $V : \infty$ etex , z[2]);
  label(btex $U : \infty$ etex , z[3]);
  label(btex $N : \infty$ etex , z[4]);
endfig;

% After relaxing (K,H)
beginfig(6);
  path c[];

  drawheap (2, 4);

  label(btex $H : 17$ etex     , z[1]);
  label(btex $V : \infty$ etex , z[2]);
  label(btex $U : \infty$ etex , z[3]);
  label(btex $N : \infty$ etex , z[4]);
endfig;

% After relaxing (K,V)
beginfig(7);
  path c[];

  drawheap (2, 4);

  label(btex $H : 17$ etex     , z[1]);
  label(btex $V : 23$ etex     , z[2]);
  label(btex $U : \infty$ etex , z[3]);
  label(btex $N : \infty$ etex , z[4]);
endfig;

% Blank picture
beginfig(8);
  path c[];

  drawheap (2, 0);

endfig;


end
