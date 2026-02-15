%
% Code for drawing directed and undirected graphs
%
% Used in this file to draw undirected graphs for shortest path problem
% to get from Kastrup to DIKU
%
%    Compile by doing "mpost public-transport-graph-25.mp"
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


%%%
%%% MACROS FOR DEFINING CONCRETE GRAPH
%%%

%
% Define graph nodes for 2 x 3 grid
%
def definegraphnodes =
  i := 0;

  % Define points
  for col := 1 upto 3:
    for row := 1 upto 2:
      i := i + 1;
      z[i] = origin + ((col -1) * vdist, -(row - 1) * vdist);
    endfor
  endfor

  % Define nodes and draw them
  for i := 1 upto 6:
    c[i] = fullcircle scaled csize shifted z[i];
  endfor
enddef;


%
% Draw graph nodes  for 2 x 3 grid
%
def drawgraphnodes =
  for i := 1 upto 6:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


%
% Draw vertex labels
%
def labelgraphvertices = 
  label(btex $A$ etex , z[1]);
  label(btex $K$ etex , z[2]);
  label(btex $H$ etex , z[3]);
  label(btex $V$ etex , z[4]);
  label(btex $N$ etex , z[5]);
  label(btex $U$ etex , z[6]);
enddef;

%
% Draw edges
%

def drawgraphedges =
  airport    := 1;
  nytorv     := 2;
  hovedb     := 3;
  vibendshus := 4;
  norreport  := 5;
  diku       := 6;
  
  % Edges from vertex 1 / A
  drawstraightundiredge (airport, nytorv,
      true, btex $13$ etex, -1, 0.5);

  drawstraightundiredge (airport, hovedb,
      true, btex $20$ etex, 1, 0.5);

  % Edges from vertex 2 / K
  drawstraightundiredge (nytorv, vibendshus,
      true, btex $10$ etex, -1, 0.5);

  drawstraightundiredge (nytorv, hovedb,
      true, btex $4$ etex, -1, 0.5);

  % Edges from vertex 3 / H
  drawstraightundiredge (hovedb, norreport,
      true, btex $3$ etex, 1, 0.5);

  % Edges from vertex 4 / V
  drawstraightundiredge (vibendshus, diku,
      true, btex $9$ etex, -1, 0.5);

  % Edges from vertex 5 / N
  drawstraightundiredge (norreport, diku,
      true, btex $8$ etex, 1, 0.5);

enddef;
 

%
% Draw edges and shortest path tree
%

def drawgraphedgesplustree =
  pair midpt;

  airport    := 1;
  nytorv     := 2;
  hovedb     := 3;
  vibendshus := 4;
  norreport  := 5;
  diku       := 6;
  
  % Edges from vertex 1 / A
  drawstraightdiredgefat (airport, nytorv,
      true, btex $13$ etex, -1, 0.5);

  drawstraightundiredge (airport, hovedb,
      true, btex $20$ etex, 1, 0.5);

  % Edges from vertex 2 / K
  drawstraightdiredgefat (nytorv, vibendshus,
      true, btex $10$ etex, -1, 0.5);

  drawstraightdiredgefat (nytorv, hovedb,
      true, btex $4$ etex, -1, 0.5);

  % Edges from vertex 3 / H
  drawstraightdiredgefat (hovedb, norreport,
      true, btex $3$ etex, 1, 0.5);

  % Edges from vertex 4 / V
  drawstraightundiredge (vibendshus, diku,
      true, btex $9$ etex, -1, 0.5);

  % Edges from vertex 5 / N
  drawstraightdiredgefat (norreport, diku,
      true, btex $8$ etex, 1, 0.5);

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
%%% Start and finishing times
%%%

vardef produce_label_start_stop(expr index, start, finish, labelup) =
%     s := "label (btex $"&decimal start&"/"&decimal finish&"$ etex,";
%     s&" z["&decimal index&"]);"
%
  offsetsigned :=
    if labelup: timelbloffset else: -timelbloffset fi;
  
  "label (btex $"&decimal start&"/"&decimal finish&"$ etex, z["&decimal index&"] + (0, "&decimal offsetsigned&" mm));"
enddef;


%
% FIGURE 1: Directed graph with edges
%

beginfig(1);
  path c[];
  
  definegraphnodes;
  drawgraphnodes;
  labelgraphvertices;
  drawgraphedges;
endfig;



%
% FIGURE 2: Directed graph with DFS forest and
%


beginfig(2);
  path c[];
  
  definegraphnodes;
  drawgraphedgesplustree;
  drawgraphnodes;
  labelgraphvertices;
  
endfig;
%   


end
