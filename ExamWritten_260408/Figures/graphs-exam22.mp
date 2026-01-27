%
% Code for drawing directed and undirected graphs
%
% Used in this file for the graphs for the written exam for DMFS '22
%
%    Compile by doing "mpost graphs-exam22.mp"
%

color gray;
pen   fatedgepen;
 
fatedgepen = pencircle scaled 2.0;

gray          :=  0.80 white;
csize         :=  6.0 mm;        % diameter of nodes
csize         :=  5.9 mm;        
vdist         := 40.0 mm;
stdedgeoffset :=  5.0 mm;
stdedgeoffset :=  5.0 mm;
stdlbloffset  :=  3.0 mm;
%   timelbloffset :=  5.0 mm;
timelbloffset :=  5.2;

largecsize :=  7.5 mm;        
largecrad  := largecsize / 2;



%%%
%%% MACROS FOR DEFINING CONCRETE GRAPH
%%%

%
% Draw graph vertex labels
%
def labelgraphvertices (expr nvert) = 
  label(btex $a$ etex , z[1]);
  label(btex $b$ etex , z[2]);
  label(btex $c$ etex , z[3]);
  label(btex $d$ etex , z[4]);
  label(btex $e$ etex , z[5]);
  label(btex $f$ etex , z[6]);

  if (nvert >= 7):
    label(btex $g$ etex , z[7]);
  fi;
  
  if (nvert >= 8):
    label(btex $h$ etex , z[8]);
  fi;
enddef;


%%%
%%% TOPOLOGICAL ORDERING
%%%

%
% Define topological ordering graph nodes 
%
def definetopolnodes =
  i := 0;

  % Define points
  for col := 1 upto 3:
    for row := 1 upto 2:
      i := i + 1;
      z[i] = origin + ((col -1) * vdist, -(row - 1) * vdist);
    endfor
  endfor

  % Define nodes 
  for j := 1 upto i:
    c[j] = fullcircle scaled csize shifted z[j];
  endfor
enddef;


%
% Draw topological ordering graph nodes 
%
def drawtopolnodes =
  for i := 1 upto 6:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


%
% Draw topological ordering graph edges
%
def drawtopoledges =

  % Edges from vertex a
  drawstraightdiredge (1, 2,
      false, false, false, false);
  drawcurveddiredge (1, 4, 1,
      false, false, false, false);
  
  % Edges from vertex b
  drawstraightdiredge (2, 4,
      false, false, false, false);
  
  % Edges from vertex c
  drawstraightdiredge (3, 1,
      false, false, false, false);
  drawcurveddiredge (3, 2, 1,
      false, false, false, false);
  drawstraightdiredge (3, 5,
      false, false, false, false);

  % Edges from vertex d
  
  % Edges from vertex e
  drawstraightdiredge (5, 4,
      false, false, false, false);
  drawstraightdiredge (5, 6,
      false, false, false, false);

  % Edges from vertex f
  drawstraightdiredge (6, 4,
      false, false, false, false);  
enddef;
 
 
%%%
%%% STRONGLY CONNECTED COMPONENTS
%%%

%
% Define strongly connected components graph nodes 
%
def definesscnodes =
  i := 0;

  % Define points
  for col := 1 upto 3:
    for row := 1 upto 2:
      i := i + 1;
      z[i] = origin + ((col -1) * vdist, -(row - 1) * vdist);
    endfor
  endfor

  % Define nodes 
  for j := 1 upto i:
    c[j] = fullcircle scaled csize shifted z[j];
  endfor
enddef;


%
% Draw strongly connected components graph nodes 
%
def drawsscnodes =
  for i := 1 upto 6:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


%
% Draw strongly connected components graph edges
%
def drawsscedges =

  % Edges from vertex a
  drawstraightdiredge (1, 2,
      false, false, false, false);
  
  % Edges from vertex b
  drawstraightdiredge (2, 4,
      false, false, false, false);
  
  % Edges from vertex c
  drawstraightdiredge (3, 1,
      false, false, false, false);
  drawcurveddiredge (3, 2, 1,
      false, false, false, false);
  drawstraightdiredge (3, 5,
      false, false, false, false);

  % Edges from vertex d
  drawcurveddiredge (4, 1, 1,
      false, false, false, false);
  
  % Edges from vertex e
  drawstraightdiredge (5, 4,
      false, false, false, false);
  drawcurveddiredge (5, 6, 1,
      false, false, false, false);

  % Edges from vertex f
  drawstraightdiredge (6, 4,
      false, false, false, false);
  drawcurveddiredge (6, 5, 1,
      false, false, false, false); 
enddef;

%
% Draw first contracted graph and adjusted edges
%
def  drawcontractedfirst =
  path firstcloud;

  firstcloud = 
    vertexcloudsegment (z[1], z[4])
    vertexcloudsegment (z[4], z[2])
    vertexcloudsegment (z[2], z[1])
    cycle;
 
  draw firstcloud;

  % Edges from vertex a
%     drawstraightdiredge (1, 2,
%         false, false, false, false);
  
  % Edges from vertex b
%     drawstraightdiredge (2, 4,
%         false, false, false, false);
  
  % Edges from vertex c
  drawarrow  z[3]--z[2] cutbefore c[3] cutafter firstcloud;
%     
%     drawstraightdiredge (3, 1,
%         false, false, false, false);
%     drawcurveddiredge (3, 2, 1,
%         false, false, false, false);
%   
  drawstraightdiredge (3, 5,
      false, false, false, false);

  % Edges from vertex d
%     drawcurveddiredge (4, 1, 1,
%         false, false, false, false);
  
  % Edges from vertex e
%     drawstraightdiredge (5, 4,
%         false, false, false, false);
  drawarrow  z[5]--z[2] cutbefore c[5] cutafter firstcloud;
  drawcurveddiredge (5, 6, 1,
      false, false, false, false);

  % Edges from vertex f
%     drawstraightdiredge (6, 4,
%         false, false, false, false);
  drawarrow  z[6]--z[2] cutbefore c[6] cutafter firstcloud;

  drawcurveddiredge (6, 5, 1,
      false, false, false, false); 

enddef;

%
% Draw second contracted graph and adjusted edges
%
def  drawcontractedsecond =
  path secondcloud;
  pair midpt;

  midpt = 1/2[z[5], z[6]];

  secondcloud = 
    vertexcloudsegment (z[5], z[6])
    vertexcloudsegment (z[6], z[5])
    cycle;
 
  draw secondcloud;

  % Edges from vertex a
  drawstraightdiredge (1, 2,
      false, false, false, false);
  
  % Edges from vertex b
  drawstraightdiredge (2, 4,
      false, false, false, false);
  
  % Edges from vertex c
  drawstraightdiredge (3, 1,
      false, false, false, false);
  drawcurveddiredge (3, 2, 1,
      false, false, false, false);
  drawarrow  z[3]--midpt cutbefore c[3] cutafter secondcloud;
%     drawstraightdiredge (3, 5,
%         false, false, false, false);

  % Edges from vertex d
  drawcurveddiredge (4, 1, 1,
      false, false, false, false);
  
  % Edges from vertex e
%     drawstraightdiredge (5, 4,
%         false, false, false, false);
  drawarrow  midpt--z[4] cutbefore secondcloud cutafter c[4];
%     drawcurveddiredge (5, 6, 1,
%         false, false, false, false);

  % Edges from vertex f
%     drawstraightdiredge (6, 4,
%         false, false, false, false);
%%% No second copy of this edge needed!
%   
%     drawcurveddiredge (6, 5, 1,
%         false, false, false, false); 
enddef;

%
% Draw fully contracted graph in modified SSC algorithm
%


def  drawfullycontracted =
  path firstcloud;
  path secondcloud;
  pair midpt;

  midpt = 1/2[z[5], z[6]];

  firstcloud = 
    vertexcloudsegment (z[1], z[4])
    vertexcloudsegment (z[4], z[2])
    vertexcloudsegment (z[2], z[1])
    cycle;
  
  secondcloud = 
    vertexcloudsegment (z[5], z[6])
    vertexcloudsegment (z[6], z[5])
    cycle;
 
  draw firstcloud;
  draw secondcloud; 

  % Edges from vertex a
%     drawstraightdiredge (1, 2,
%         false, false, false, false);
  
  % Edges from vertex b
%     drawstraightdiredge (2, 4,
%         false, false, false, false);
  
  % Edges from vertex c
  drawarrow  z[3]--z[2] cutbefore c[3] cutafter firstcloud;
  drawarrow  z[3]--midpt cutbefore c[3] cutafter secondcloud;
%     
%     drawstraightdiredge (3, 1,
%         false, false, false, false);
%     drawcurveddiredge (3, 2, 1,
%         false, false, false, false);
%     drawstraightdiredge (3, 5,
%         false, false, false, false);

  % Edges from vertex d
%     drawcurveddiredge (4, 1, 1,
%         false, false, false, false);
  
  % Edges from vertex e
%     drawstraightdiredge (5, 4,
%         false, false, false, false);
%     drawcurveddiredge (5, 6, 1,
%         false, false, false, false);
  drawarrow  midpt--z[2] cutbefore secondcloud cutafter firstcloud;
  
  % Edges from vertex f
%     drawstraightdiredge (6, 4,
%         false, false, false, false);
%%% No second copy of this edge needed!
%   
%     drawcurveddiredge (6, 5, 1,
%         false, false, false, false); 
enddef;



%%%
%%% DIJKSTRA, LARGE EXAMPLE
%%%

%
% Define Dijkstra graph nodes 
%
def definedijkstralargernodes =
  i := 0;

  % Define points
  for row := 1 upto 3:
    i := i + 1;
    z[i] = origin + (0, -(row - 1) * vdist);
  endfor

  % Define points
  for col := 2 upto 3:
    for row := 1 upto 2:
      i := i + 1;
      z[i] = origin + ((col -1) * vdist, -(row - 1) * vdist);
    endfor
  endfor

  % Define nodes 
  for j := 1 upto i:
    c[j] = fullcircle scaled csize shifted z[j];
  endfor
enddef;


%
% Draw Dijkstra graph nodes 
%
def drawdijkstralargernodes =
  for i := 1 upto 7:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


%
% Draw Dijkstra graph edges
%
def drawdijkstralargeredges =

  % Edges from vertex a
  drawstraightdiredge (1, 2,
      true, btex $4$ etex, -1, 0.5);  
  drawstraightdiredge (1, 4,
      true, btex $1$ etex, 1, 0.5);
  
  % Edges from vertex b
  drawstraightdiredge (2, 3,
      true, btex $7$ etex, 1, 0.5);
  drawstraightdiredge (2, 5,
      true, btex $3$ etex, 1, 0.5);
  
  % Edges from vertex c
  drawcurveddiredge (3, 5, 1,
      true, btex $1$ etex, 1, 0.5);

  % Edges from vertex d
  drawstraightdiredge (4, 2,
      true, btex $2$ etex, -1, 0.55);  
  drawcurveddiredge (4, 5, 1,
      true, btex $6$ etex, 1, 0.5);  
  drawcurveddiredge (4, 6, -1,
      true, btex $4$ etex, -1, 0.5);
  drawstraightdiredge (4, 7, 
      true, btex $8$ etex, -1, 0.45);  
  
  % Edges from vertex e
  drawcurveddiredge (5, 3, 1,
      true, btex $2$ etex, 1, 0.5);
  drawcurveddiredge (5, 4, 1,
      true, btex $1$ etex, 1, 0.5);
  drawstraightdiredge (5, 7,
      true, btex $1$ etex, -1, 0.5);

  % Edges from vertex f
  drawcurveddiredge (6, 4, -1,
      true, btex $5$ etex, -1, 0.5);
  drawcurveddiredge (6, 5, 1,
      true, btex $5$ etex, 1, 0.36);
  drawstraightdiredge (6, 7,
      true, btex $3$ etex, 1, 0.5);
enddef;
 
 
%%%
%%% DIJKSTRA, SMALLER EXAMPLE
%%%

%
% Define Dijkstra graph nodes 
%
def definedijkstrasmallernodes =
  i := 0;

  % Define points
  for col := 1 upto 3:
    for row := 1 upto 2:
      i := i + 1;
      z[i] = origin + ((col -1) * vdist, -(row - 1) * vdist);
    endfor
  endfor

  % Define nodes 
  for j := 1 upto i:
    c[j] = fullcircle scaled csize shifted z[j];
  endfor
enddef;


%
% Draw Dijkstra graph nodes 
%
def drawdijkstrasmallernodes =
  for i := 1 upto 6:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


%
% Draw Dijkstra graph edges (if true, draw tree edges fat)
%
def drawdijkstrasmalleredges (expr drawtreeedges) =

  % Edges from vertex a
  drawstraightdiredge (1, 2,
      true, btex $4$ etex, -1, 0.5);
  if drawtreeedges:
    drawstraightdiredgefat (1, 3,
	true, btex $1$ etex, 1, 0.5);
  else:
    drawstraightdiredge (1, 3,
	true, btex $1$ etex, 1, 0.5);
  fi;
  
  % Edges from vertex b
  if drawtreeedges:
    drawcurveddiredgefat (2, 4, 1,
	true, btex $3$ etex, 1, 0.5);  
  else:
    drawcurveddiredge (2, 4, 1,
	true, btex $3$ etex, 1, 0.5);  
  fi;
  
  % Edges from vertex c
%     drawcurveddiredge (3, 5, 1,
%         true, btex $1$ etex, 1, 0.5);

  % Edges from vertex c (former d)
%     drawstraightdiredge (3, 2,
%         true, btex $2$ etex, -1, 0.55);
  if drawtreeedges:
    drawcurveddiredgefat (3, 2, -1,
	true, btex $2$ etex, -1, 0.64);
  else:
    drawcurveddiredge (3, 2, -1,
	true, btex $2$ etex, -1, 0.64);
  fi;
  drawcurveddiredge (3, 4, 1,
      true, btex $6$ etex, 1, 0.5);  
  if drawtreeedges:
    drawcurveddiredgefat (3, 5, -1,
	true, btex $4$ etex, -1, 0.5);
  else:
    drawcurveddiredge (3, 5, -1,
	true, btex $4$ etex, -1, 0.5);
  fi;
  drawstraightdiredge (3, 6, 
      true, btex $8$ etex, -1, 0.45);  
  
  % Edges from vertex d (former e)
%     drawcurveddiredge (4, 3, 1,
%         true, btex $2$ etex, 1, 0.5);
  drawcurveddiredge (4, 2, 1,
      true, btex $7$ etex, 1, 0.5);  
  drawcurveddiredge (4, 3, 1,
      true, btex $1$ etex, 1, 0.5);
  if drawtreeedges:
    drawstraightdiredgefat (4, 6,
	true, btex $1$ etex, -1, 0.5);
  else:
    drawstraightdiredge (4, 6,
	true, btex $1$ etex, -1, 0.5);
  fi;
  
  % Edges from vertex e (former f)
  drawcurveddiredge (5, 3, -1,
      true, btex $5$ etex, -1, 0.5);
  drawcurveddiredge (5, 4, 1,
      true, btex $5$ etex, 1, 0.37);
  drawstraightdiredge (5, 6,
      true, btex $3$ etex, 1, 0.5);
enddef;
 

%%%
%%% RELATION
%%%

%
% Define relation graph nodes 
%
def definerelationnodes =
  relnodedist := 17.0 mm;
  row         := 1;
  i           := 0;
  
  % Define points
  for col := 1 upto 10:
    i := i + 1;
    z[i] = origin + ((col -1) * relnodedist, -(row - 1) * relnodedist);
  endfor

  % Define nodes 
  for j := 1 upto i:
    c[j] = fullcircle scaled csize shifted z[j];
  endfor
enddef;


%
% Draw relation graph nodes 
%
def drawrelationnodes =
  for i := 1 upto 10:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


def drawrelationedge (expr starti, endi, isabove) =
  damp     := 0.15;
  addconst := 0.30;
  dist := endi - starti;
  
  if (isabove):
    fac := 1;
  else:
    fac := -1;
  fi;
  
  drawcurveddiredge (starti, endi, fac * (damp + addconst) * dist,
      false, false, false, false);
enddef;



%
% Draw relation graph edges
%
def drawrelationedges =
  drawrelationedge (1, 2, true);
  drawrelationedge (1, 3, true);
  drawrelationedge (1, 5, true);
  drawrelationedge (1, 7, true);

  drawrelationedge (2, 4, false);
  drawrelationedge (2, 6, false);
  drawrelationedge (2, 10, false);
  
  drawrelationedge (3, 6, true);
  drawrelationedge (3, 9, true);

  drawrelationedge (4, 8, false);

  drawrelationedge (5, 10, true);
enddef;
 

%%%
%%% GENERIC CODE FOR DRAWING DIRECTED EDGES
%%%

% drawdiredge
%
% Most general function for drawing directed edges. Non-obvious parameters:
% - midpt is a waypoint "midway" along the edge
% - uselbl is true if the edge should be labelled
% - lbl is the label (typically btex $<label>$ etex
% - lbloffsetfac: how far away to put the label, and on which side; a number 
% - lblfrac: fractionally how far along the edge is the label?
% - edgepen: pen with which to draw edges

def drawdiredge (expr startpt, midpt, endpt,
    uselbl, lbl, lbloffsetfac, lblfrac, edgepen) =
  pair lbloffsetpt;
  path edgepath;

  edgepath := z[startpt]..midpt..z[endpt];

  drawarrow edgepath cutbefore c[startpt] cutafter c[endpt] withpen edgepen;
  
  if uselbl:
%       draw point 2* lblfrac of edgepath withpen pencircle scaled 3;

    lbloffsetpt :=
      point 2 * lblfrac of edgepath
      + lbloffsetfac * stdlbloffset *
      dir (angle (z[endpt] - z[startpt]) + 90);
    
    label(lbl, lbloffsetpt);
  fi;
  
enddef;


def drawstraightdiredge (expr startpt, endpt, uselbl, lbl, lbloffsetfac, lblfrac) =
  drawdiredge (startpt, 1/2[z[startpt], z[endpt]], endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, currentpen);
enddef;


% offsetfac determines to which side, and how much, the edge curves.
% Values 1 or -1 give standard curving

def drawcurveddiredge (expr startpt, endpt, offsetfac,
    uselbl, lbl, lbloffsetfac, lblfrac) =

  pair offsetpt;
  
  offsetpt := 1/2[z[startpt], z[endpt]]
    + offsetfac * stdedgeoffset *
    dir (angle (z[endpt] - z[startpt]) + 90);

  drawdiredge (startpt, offsetpt, endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, currentpen);
enddef;

  
def drawstraightdiredgefat (expr startpt, endpt, uselbl, lbl, lbloffsetfac, lblfrac) =
  drawdiredge (startpt, 1/2[z[startpt], z[endpt]], endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, fatedgepen);
enddef;


% offsetfac determines to which side, and how much, the edge curves.
% Values 1 or -1 give standard curving

def drawcurveddiredgefat (expr startpt, endpt, offsetfac,
    uselbl, lbl, lbloffsetfac, lblfrac) =

  pair offsetpt;
  
  offsetpt := 1/2[z[startpt], z[endpt]]
    + offsetfac * stdedgeoffset *
    dir (angle (z[endpt] - z[startpt]) + 90);

  drawdiredge (startpt, offsetpt, endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, fatedgepen);
enddef;

 
%%%
%%% GENERIC CODE FOR DRAWING DIRECTED EDGES INVERTED IN OTHER DIRECTION
%%%

% drawdiredgeinv
%
% Most general function for drawing directed edges. Non-obvious parameters:
% - midpt is a waypoint "midway" along the edge
% - uselbl is true if the edge should be labelled
% - lbl is the label (typically btex $<label>$ etex
% - lbloffsetfac: how far away to put the label, and on which side; a number 
% - lblfrac: fractionally how far along the edge is the label?
% - edgepen: pen with which to draw edges

def drawdiredgeinv (expr startpt, midpt, endpt,
    uselbl, lbl, lbloffsetfac, lblfrac, edgepen) =
  pair lbloffsetpt;
  path edgepath;

%     edgepath := z[startpt]..midpt..z[endpt];
%     drawarrow edgepath cutbefore c[startpt] cutafter c[endpt] withpen edgepen;

  edgepath := z[endpt]..midpt..z[startpt];
  drawarrow edgepath cutbefore c[endpt] cutafter c[startpt] withpen edgepen;
  
  if uselbl:
    lbloffsetpt :=
      point 2 * lblfrac of edgepath
      + lbloffsetfac * stdlbloffset *
      dir (angle (z[endpt] - z[startpt]) + 90);
    
    label(lbl, lbloffsetpt);
  fi;
  
enddef;


def drawstraightdiredgeinv (expr startpt, endpt, uselbl, lbl, lbloffsetfac, lblfrac) =
  drawdiredgeinv (startpt, 1/2[z[startpt], z[endpt]], endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, currentpen);
enddef;


% offsetfac determines to which side, and how much, the edge curves.
% Values 1 or -1 give standard curving

def drawcurveddiredgeinv (expr startpt, endpt, offsetfac,
    uselbl, lbl, lbloffsetfac, lblfrac) =

  pair offsetpt;
  
  offsetpt := 1/2[z[startpt], z[endpt]]
    + offsetfac * stdedgeoffset *
    dir (angle (z[endpt] - z[startpt]) + 90);

  drawdiredgeinv (startpt, offsetpt, endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, currentpen);
enddef;

  
def drawstraightdiredgefatinv (expr startpt, endpt, uselbl, lbl, lbloffsetfac, lblfrac) =
  drawdiredgeinv (startpt, 1/2[z[startpt], z[endpt]], endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, fatedgepen);
enddef;


% offsetfac determines to which side, and how much, the edge curves.
% Values 1 or -1 give standard curving

def drawcurveddiredgefatinv (expr startpt, endpt, offsetfac,
    uselbl, lbl, lbloffsetfac, lblfrac) =

  pair offsetpt;
  
  offsetpt := 1/2[z[startpt], z[endpt]]
    + offsetfac * stdedgeoffset *
    dir (angle (z[endpt] - z[startpt]) + 90);

  drawdiredgeinv (startpt, offsetpt, endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, fatedgepen);
enddef;

 
%%%
%%% GENERIC CODE FOR DRAWING UNDIRECTED EDGES
%%%

%
% Most general function for drawing edges. Parameters:
% - midpt is a waypoint "midway" along the edge
% - uselbl is true if the edge should be labelled
% - lbl is the label (typically btex $<label>$ etex
% - lbloffsetfac: how far away to put the label, and on which side; a number 
% - lblfrac: fractionally how far along the edge is the label?

def drawundiredge (expr startpt, midpt, endpt,
    uselbl, lbl, lbloffsetfac, lblfrac, edgepen) =
  pair lbloffsetpt;
  path edgepath;

  edgepath := z[startpt]..midpt..z[endpt];

  draw edgepath cutbefore c[startpt] cutafter c[endpt] withpen edgepen;
  
  if uselbl:
%       draw point 2* lblfrac of edgepath withpen pencircle scaled 3;

    lbloffsetpt :=
      point 2 * lblfrac of edgepath
      + lbloffsetfac * stdlbloffset *
      dir (angle (z[endpt] - z[startpt]) + 90);
    
    label(lbl, lbloffsetpt);
  fi;
  
enddef;


def drawstraightundiredge (expr startpt, endpt, uselbl, lbl, lbloffsetfac, lblfrac) =
  drawundiredge (startpt, 1/2[z[startpt], z[endpt]], endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, currentpen);
enddef;


% offsetfac determines to which side, and how much, the edge curves.
% Values 1 or -1 give standard curving

def drawcurvedundiredge (expr startpt, endpt, offsetfac,
    uselbl, lbl, lbloffsetfac, lblfrac) =

  pair offsetpt;
  
  offsetpt := 1/2[z[startpt], z[endpt]]
    + offsetfac * stdedgeoffset *
    dir (angle (z[endpt] - z[startpt]) + 90);

  drawundiredge (startpt, offsetpt, endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, currentpen);
enddef;

 
def drawstraightundiredgefat (expr startpt, endpt,
    uselbl, lbl, lbloffsetfac, lblfrac) =
  drawundiredge (startpt, 1/2[z[startpt], z[endpt]], endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, fatedgepen);
enddef;


% offsetfac determines to which side, and how much, the edge curves.
% Values 1 or -1 give standard curving

def drawcurvedundiredgefat (expr startpt, endpt, offsetfac,
    uselbl, lbl, lbloffsetfac, lblfrac) =

  pair offsetpt;
  
  offsetpt := 1/2[z[startpt], z[endpt]]
    + offsetfac * stdedgeoffset *
    dir (angle (z[endpt] - z[startpt]) + 90);

  drawundiredge (startpt, offsetpt, endpt,
      uselbl, lbl, lbloffsetfac, lblfrac, fatedgepen);
enddef;


%%%
%%% CODE FOR "CONTRACTIONS" OF VERTICES
%%%
%%% Segments of smooth curves around vertices
%%%

def vertexcloudsegment (expr startv, endv) =
%     pair wp[];
%   
%     wp[1] := startv + largecrad * dir (angle(endv - startv) + 90)
%     wp[2] := endv   + largecrad * dir (angle(endv - startv) + 90)  
%
%%% Cannot start in this way
%     {endv - startv}
%       
  (startv + largecrad * dir (angle(endv - startv) + 90))--
  (endv   + largecrad * dir (angle(endv - startv) + 90))
  {endv - startv}..
%     draw
%     wp[1]--wp[2]--
enddef;


%%%
%%% START AND FINISHING TIMES FOR DFS
%%%

vardef produce_timestamps_label(expr index, start, finish, labelup) =
%     s := "label (btex $"&decimal start&"/"&decimal finish&"$ etex,";
%     s&" z["&decimal index&"]);"
%
  offsetsigned :=
    if labelup: timelbloffset else: -timelbloffset fi;
  
  "label (btex $"&decimal start&"/"&decimal finish&"$ etex, z["&decimal index&"] + (0, "&decimal offsetsigned&" mm));"
enddef;


%%%
%%% NUMBERS AS VERTEX LABELS
%%%

vardef produce_number_as_label(expr index) =  
  "label (btex $"&decimal index&"$ etex, z["&decimal index&"]);"
enddef;


%
% FIGURE 1: Directed graph with edges for topological ordering
%

beginfig(1);
  path c[];

  definetopolnodes;
  drawtopolnodes;
  labelgraphvertices (6);
  drawtopoledges;
endfig;

%
% FIGURE 2: Directed graph with edges for strongly connected components
%

beginfig(2);
  path c[];

  definesscnodes;
  drawsscnodes;
  labelgraphvertices (6);
  drawsscedges;
endfig;


%
% FIGURE 3: Directed graph with edges for Dijkstra, smaller graph
%

beginfig(3);
  path c[];

  definedijkstrasmallernodes;
  drawdijkstrasmallernodes;
  labelgraphvertices (6);
  drawdijkstrasmalleredges (false);
endfig;


%
% FIGURE 3: Directed graph with edges for Dijkstra, larger graph
%
%   
%   beginfig(3);
%     path c[];
%   
%     definedijkstralargernodes;
%     drawdijkstralargernodes;
%     labelgraphvertices (7);
%     drawdijkstralargeredges;
%   endfig;
%   

%
% FIGURE 4: Directed graph with edges for relation
%

beginfig(4);
  path c[];

  definerelationnodes;
  drawrelationnodes;
  drawrelationedges;

  for i := 1 upto 10:
    write produce_number_as_label (i) to "DynamicTeXLabels.tmp";
  endfor;
  write EOF to "DynamicTeXLabels.tmp";       % Close file        
  input DynamicTeXLabels.tmp;                % input file (effects execution)

endfig;


%
% FIGURE 5: Directed smaller graph for Dijkstra with spanning tree
%

beginfig(5);
  path c[];

  definedijkstrasmallernodes;
  drawdijkstrasmalleredges (true);
  drawdijkstrasmallernodes;
  labelgraphvertices (6);
endfig;


%
% FIGURE 6: DFS for topological sort of DAG
%

beginfig(6);
  path c[];

  definetopolnodes;
  drawtopolnodes;
  labelgraphvertices (6);
  drawtopoledges;

    % Dynamic labels cannot be written within macros, so have to be here
  % in main figure file
  write produce_timestamps_label(1, 1, 6, true)  to "DynamicTeXLabels.tmp";
  write produce_timestamps_label(2, 2, 5, false) to "DynamicTeXLabels.tmp";
  write produce_timestamps_label(3, 7, 12, true)  to "DynamicTeXLabels.tmp";
  write produce_timestamps_label(4, 3, 4, false) to "DynamicTeXLabels.tmp";
  write produce_timestamps_label(5, 8, 11, true)  to "DynamicTeXLabels.tmp";
  write produce_timestamps_label(6, 9, 10, false) to "DynamicTeXLabels.tmp";
  write EOF to "DynamicTeXLabels.tmp";       % Close file        
  input DynamicTeXLabels.tmp;                % input file (effects execution)

endfig;


%
% FIGURE 7: First "contracted" graph
%

beginfig(7);
  path c[];

  definesscnodes;
  drawsscnodes;
  labelgraphvertices (6);
%     drawsscedges;
  drawcontractedfirst;
endfig;


%
% FIGURE 8: Second "contracted" graph
%

beginfig(8);
  path c[];

  definesscnodes;
  drawsscnodes;
  labelgraphvertices (6);
%     drawsscedges;
  drawcontractedsecond;
endfig;

%
% FIGURE 9: Third, fully "contracted", graph
%

beginfig(9);
  path c[];

  definesscnodes;
  drawsscnodes;
  labelgraphvertices (6);
%     drawsscedges;
  drawfullycontracted;
endfig;



end
   
