%
% Directed graph for Dijkstra
%
% *** This graph drawing code is obsolete compared to other DMFS figures ***
%
%    Compile by doing "mpost directedgraph.mp"
%

color gray;
pair  lblshift;

pen fatedgepen;

fatedgepen = pencircle scaled 2.0;

gray        :=  0.80 white;
csize       :=  6.0 mm;        % diameter of nodes
csize       :=  5.9 mm;      
offset      := 40.0 mm;
edgeoffset  :=  2.25 mm;
edgebendval :=  5.0 mm;
%edgebendval :=  4.5 mm;

%
% Define nodes and draw them
%
def definenodes =
  i := 0;

  % Define points
  for col := 1 upto 3:
    for row := 1 upto 3:
      i := i + 1;
      z[i] = origin + ((col -1) * offset, -(row - 1) * offset);
    endfor
  endfor

  % Define nodes 
  for i := 1 upto 8:
    c[i] = fullcircle scaled csize shifted z[i];
  endfor
enddef;

%
% Draw nodes 
%
def drawnodes =
  for i := 1 upto 8:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;

%
% Draw vertex labels
%
def labelvertices = 
  label(btex $a$ etex , z[1]);
  label(btex $b$ etex , z[2]);
  label(btex $c$ etex , z[3]);
  label(btex $d$ etex , z[4]);
  label(btex $e$ etex , z[5]);
  label(btex $f$ etex , z[6]);
  label(btex $g$ etex , z[7]);
  label(btex $h$ etex , z[8]);
enddef;

def drawedge (expr startpt, midpt, endpt, lbl, lblpos) =
  drawarrow z[startpt]..midpt..z[endpt] cutbefore c[startpt] cutafter c[endpt];
  label(lbl, lblpos);
enddef;

def drawedgefat (expr startpt, midpt, endpt, lbl, lblpos) =
  drawarrow z[startpt]..midpt..z[endpt] cutbefore c[startpt] cutafter c[endpt]
    withpen fatedgepen;
  label(lbl, lblpos);
enddef;

def drawedges =
  pair midpt;

  % Edges from vertex a
  
  drawedge (1, 1/2[z[1], z[2]], 2,
      btex $1$ etex , 
      1/2[z[1], z[2]] - (edgeoffset, 0) );
  
  drawedge (1, 1/2[z[1], z[4]], 4,
      btex $5$ etex , 
      1/2[z[1], z[4]] - (0, edgeoffset));
  
  drawedge (1, 1/2[z[1], z[5]], 5,
      btex $6$ etex , 
      1/2[z[1], z[5]] - (edgeoffset, edgeoffset));
  
  midpt := 1/2[z[1], z[7]] + (0, 2 * edgebendval);
  
  drawedge (1, midpt,  7,
      btex $9$ etex , 
      midpt + (0, edgeoffset));

  % Edges from vertex b
  
  drawedge (2, 1/2[z[2], z[3]], 3,
      btex $1$ etex , 
      1/2[z[2], z[3]] - (edgeoffset, 0) );

  midpt := 1/2[z[2], z[6]] + (-edgebendval, -edgebendval);
  
  drawedge (2, midpt, 6,
      btex $9$ etex , 
      midpt - (edgeoffset, edgeoffset) );

  midpt := 1/2[z[2], z[5]];
  
  drawedge (2, midpt, 5,
      btex $2$ etex,
      midpt + (0, edgeoffset) );

  % Edges from vertex c
  
  drawedge (3, 1/2[z[3], z[6]], 6,
      btex $7$ etex , 
      1/2[z[3], z[6]] - (0, edgeoffset) );

  midpt := 1/2[z[3], z[5]] + (-edgebendval, edgebendval);
  
  drawedge (3, midpt, 5,
      btex $4$ etex,
      midpt + (-edgeoffset, edgeoffset) );

  % Edges from vertex d

  midpt := 1/2[z[4], z[8]];
  
  drawedge (4, midpt, 8,
      btex $2$ etex,
      midpt + (edgeoffset, edgeoffset) );

  midpt := 1/2[z[4], z[5]] + (edgebendval, 0);
  
  drawedge (4, midpt, 5,
      btex $6$ etex,
      midpt + (edgeoffset, 0) );

  midpt := 1/2[z[4], z[7]];
  
  drawedge (4, midpt, 7,
      btex $5$ etex,
      midpt - (0, edgeoffset) );
  % Edges from vertex e

  midpt := 1/2[z[5], z[4]] - (edgebendval, 0);
  
  drawedge (5, midpt, 4,
      btex $1$ etex,
      midpt - (edgeoffset, 0) );

  midpt := 1/2[z[5], z[6]] + (edgebendval, 0);
  
  drawedge (5, midpt, 6,
      btex $5$ etex,
      midpt + (edgeoffset, 0) );

  midpt := 1/2[z[5], z[8]];
  
  drawedge (5, midpt, 8,
      btex $4$ etex,
      midpt + (0, edgeoffset) );

  % Edges from vertex f

  midpt := 1/2[z[6], z[5]] - (edgebendval, 0);
  
  drawedge (6, midpt, 5,
      btex $3$ etex,
      midpt - (edgeoffset, 0) );

  % Edges from vertex g
  % NONE

  % Edges from vertex h

  midpt := 1/2[z[8], z[7]];
  
  drawedge (8, midpt, 7,
      btex $2$ etex,
      midpt + (edgeoffset, 0) );

  midpt := 1/2[z[8], z[6]];
  
  drawedge (8, midpt, 6,
      btex $1$ etex,
      midpt + (edgeoffset, -edgeoffset) );

enddef;
 
def drawedgessomefat =
  pair midpt;

  % Edges from vertex a
  
  drawedgefat (1, 1/2[z[1], z[2]], 2,
      btex $1$ etex , 
      1/2[z[1], z[2]] - (edgeoffset, 0) );
  
  drawedge (1, 1/2[z[1], z[4]], 4,
      btex $5$ etex , 
      1/2[z[1], z[4]] - (0, edgeoffset));
  
  drawedge (1, 1/2[z[1], z[5]], 5,
      btex $6$ etex , 
      1/2[z[1], z[5]] - (edgeoffset, edgeoffset));
  
  midpt := 1/2[z[1], z[7]] + (0, 2 * edgebendval);
  
  drawedge (1, midpt,  7,
      btex $9$ etex , 
      midpt + (0, edgeoffset));

  % Edges from vertex b
  
  drawedgefat (2, 1/2[z[2], z[3]], 3,
      btex $1$ etex , 
      1/2[z[2], z[3]] - (edgeoffset, 0) );

  midpt := 1/2[z[2], z[6]] + (-edgebendval, -edgebendval);
  
  drawedge (2, midpt, 6,
      btex $9$ etex , 
      midpt - (edgeoffset, edgeoffset) );

  midpt := 1/2[z[2], z[5]];
  
  drawedgefat (2, midpt, 5,
      btex $2$ etex,
      midpt + (0, edgeoffset) );

  % Edges from vertex c
  
  drawedge (3, 1/2[z[3], z[6]], 6,
      btex $7$ etex , 
      1/2[z[3], z[6]] - (0, edgeoffset) );

  midpt := 1/2[z[3], z[5]] + (-edgebendval, edgebendval);
  
  drawedge (3, midpt, 5,
      btex $4$ etex,
      midpt + (-edgeoffset, edgeoffset) );

  % Edges from vertex d

  midpt := 1/2[z[4], z[8]];
  
  drawedgefat (4, midpt, 8,
      btex $2$ etex,
      midpt + (edgeoffset, edgeoffset) );

  midpt := 1/2[z[4], z[5]] + (edgebendval, 0);
  
  drawedge (4, midpt, 5,
      btex $6$ etex,
      midpt + (edgeoffset, 0) );

  midpt := 1/2[z[4], z[7]];
  
  drawedge (4, midpt, 7,
      btex $5$ etex,
      midpt - (0, edgeoffset) );

  % Edges from vertex e

  midpt := 1/2[z[5], z[4]] - (edgebendval, 0);
  
  drawedgefat (5, midpt, 4,
      btex $1$ etex,
      midpt - (edgeoffset, 0) );

  midpt := 1/2[z[5], z[6]] + (edgebendval, 0);
  
  drawedge (5, midpt, 6,
      btex $5$ etex,
      midpt + (edgeoffset, 0) );

  midpt := 1/2[z[5], z[8]];
  
  drawedge (5, midpt, 8,
      btex $4$ etex,
      midpt + (0, edgeoffset) );

  % Edges from vertex f

  midpt := 1/2[z[6], z[5]] - (edgebendval, 0);
  
  drawedge (6, midpt, 5,
      btex $3$ etex,
      midpt - (edgeoffset, 0) );

  % Edges from vertex g
  % NONE

  % Edges from vertex h

  midpt := 1/2[z[8], z[7]];
  
  drawedgefat (8, midpt, 7,
      btex $2$ etex,
      midpt + (edgeoffset, 0) );

  midpt := 1/2[z[8], z[6]];
  
  drawedgefat (8, midpt, 6,
      btex $1$ etex,
      midpt + (edgeoffset, -edgeoffset) );

enddef;

%
% FIGURE 1: Directed graph with edge weights
%
beginfig(1);
  path c[];
  
  definenodes;
  drawedges;
  drawnodes;
  labelvertices;

endfig;


%
% FIGURE 2: Directed graph shortest paths tree
%
beginfig(2);
  path c[];
  
  definenodes;
  drawedgessomefat;
  drawnodes;
  labelvertices;

endfig;


end
