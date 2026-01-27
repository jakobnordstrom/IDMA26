%
% Code for drawing directed and undirected graphs
%
% Used in this file to draw directed graphs for SSC computation
%
%    Compile by doing "mpost ssc-graph.mp"
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
% Define graph nodes 
%
def definegraphnodes =
  i := 0;

  % Define points
  for col := 1 upto 4:
    for row := 1 upto 2:
      i := i + 1;
      z[i] = origin + ((col -1) * vdist, -(row - 1) * vdist);
    endfor
  endfor

  % Define nodes and draw them
  for i := 1 upto 8:
    c[i] = fullcircle scaled csize shifted z[i];
  endfor
enddef;


%
% Draw graph nodes 
%
def drawgraphnodes =
  for i := 1 upto 8:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


%
% Draw vertex labels
%
def labelgraphvertices = 
  label(btex $a$ etex , z[1]);
  label(btex $b$ etex , z[2]);
  label(btex $c$ etex , z[3]);
  label(btex $d$ etex , z[4]);
  label(btex $e$ etex , z[5]);
  label(btex $f$ etex , z[6]);
  label(btex $g$ etex , z[7]);
  label(btex $h$ etex , z[8]);
enddef;

%
% Draw edges
%

def drawgraphedges =
  pair midpt;

  % Edges from vertex a
  
  drawcurveddiredge (1, 2, 1, 
      false, false, false, false);

  drawstraightdiredge (1, 4,
      false, false, false, false);

  drawcurveddiredge (1, 5, 1.5, 
      false, false, false, false);
  
  % Edges from vertex b

  drawcurveddiredge (2, 1, 1,
      false, false, false, false);
  
  drawstraightdiredge (2, 3,
      false, false, false, false);
  
  drawstraightdiredge (2, 4,
      false, false, false, false);
  
  % Edges from vertex c

  drawstraightdiredge (3, 1,
      false, false, false, false);
  
  drawstraightdiredge (3, 5,
      false, false, false, false);
  
  drawstraightdiredge (3, 6,
      false, false, false, false);
  
  % Edges from vertex d

  drawcurveddiredge (4, 5, 1,
      false, false, false, false);
  
  drawstraightdiredge (4, 6,
      false, false, false, false);
  
  % Edges from vertex e

  drawcurveddiredge (5, 4, 1,
      false, false, false, false);
  
  drawstraightdiredge (5, 6,
      false, false, false, false);
  
  drawstraightdiredge (5, 8,
      false, false, false, false);
  
  % Edges from vertex f

    drawstraightdiredge (6, 7,
      false, false, false, false);
  
  % Edges from vertex g

  drawstraightdiredge (7, 8,
      false, false, false, false);
  
  % Edges from vertex h

  drawstraightdiredge (8, 6,
      false, false, false, false);
enddef;
 

%
% Draw edges and DFS tree
%

def drawgraphedgesDFS =
  pair midpt;

  % Edges from vertex a
  
  drawcurveddiredgefat (1, 2, 1, 
      false, false, false, false);

  drawstraightdiredge (1, 4,
      false, false, false, false);

  drawcurveddiredge (1, 5, 1.5, 
      false, false, false, false);
  
  % Edges from vertex b

  drawcurveddiredge (2, 1, 1,
      false, false, false, false);
  
  drawstraightdiredgefat (2, 3,
      false, false, false, false);
  
  drawstraightdiredge (2, 4,
      false, false, false, false);
  
  % Edges from vertex c

  drawstraightdiredge (3, 1,
      false, false, false, false);
  
  drawstraightdiredgefat (3, 5,
      false, false, false, false);
  
  drawstraightdiredge (3, 6,
      false, false, false, false);
  
  % Edges from vertex d

  drawcurveddiredge (4, 5, 1,
      false, false, false, false);
  
  drawstraightdiredgefat (4, 6,
      false, false, false, false);
  
  % Edges from vertex e

  drawcurveddiredgefat (5, 4, 1,
      false, false, false, false);
  
  drawstraightdiredge (5, 6,
      false, false, false, false);
  
  drawstraightdiredge (5, 8,
      false, false, false, false);
  
  % Edges from vertex f

    drawstraightdiredgefat (6, 7,
      false, false, false, false);
  
  % Edges from vertex g

  drawstraightdiredgefat (7, 8,
      false, false, false, false);
  
  % Edges from vertex h

  drawstraightdiredge (8, 6,
      false, false, false, false);
enddef;
 

%
% Draw inverted edges
%

def drawgraphedgesinv =
  pair midpt;

  % Edges from vertex a
  
  drawcurveddiredgeinv (1, 2, 1, 
      false, false, false, false);

  drawstraightdiredgeinv (1, 4,
      false, false, false, false);

  drawcurveddiredgeinv (1, 5, 1.5, 
      false, false, false, false);
  
  % Edges from vertex b

  drawcurveddiredgeinv (2, 1, 1,
      false, false, false, false);
  
  drawstraightdiredgeinv (2, 3,
      false, false, false, false);
  
  drawstraightdiredgeinv (2, 4,
      false, false, false, false);
  
  % Edges from vertex c

  drawstraightdiredgeinv (3, 1,
      false, false, false, false);
  
  drawstraightdiredgeinv (3, 5,
      false, false, false, false);
  
  drawstraightdiredgeinv (3, 6,
      false, false, false, false);
  
  % Edges from vertex d

  drawcurveddiredgeinv (4, 5, 1,
      false, false, false, false);
  
  drawstraightdiredgeinv (4, 6,
      false, false, false, false);
  
  % Edges from vertex e

  drawcurveddiredgeinv (5, 4, 1,
      false, false, false, false);
  
  drawstraightdiredgeinv (5, 6,
      false, false, false, false);
  
  drawstraightdiredgeinv (5, 8,
      false, false, false, false);
  
  % Edges from vertex f

    drawstraightdiredgeinv (6, 7,
      false, false, false, false);
  
  % Edges from vertex g

  drawstraightdiredgeinv (7, 8,
      false, false, false, false);
  
  % Edges from vertex h

  drawstraightdiredgeinv (8, 6,
      false, false, false, false);
enddef;
 

%
% Draw inverted edges and DFS tree
%

def drawgraphedgesDFSinv =
  pair midpt;

  % Edges from vertex a
  
  drawcurveddiredgeinv (1, 2, 1, 
      false, false, false, false);

  drawstraightdiredgeinv (1, 4,
      false, false, false, false);

  drawcurveddiredgeinv (1, 5, 1.5, 
      false, false, false, false);
  
  % Edges from vertex b

  drawcurveddiredgefatinv (2, 1, 1,
      false, false, false, false);
  
  drawstraightdiredgeinv (2, 3,
      false, false, false, false);
  
  drawstraightdiredgeinv (2, 4,
      false, false, false, false);
  
  % Edges from vertex c

  drawstraightdiredgefatinv (3, 1,
      false, false, false, false);
  
  drawstraightdiredgeinv (3, 5,
      false, false, false, false);
  
  drawstraightdiredgeinv (3, 6,
      false, false, false, false);
  
  % Edges from vertex d

  drawcurveddiredgefatinv (4, 5, 1,
      false, false, false, false);
  
  drawstraightdiredgeinv (4, 6,
      false, false, false, false);
  
  % Edges from vertex e

  drawcurveddiredgeinv (5, 4, 1,
      false, false, false, false);
  
  drawstraightdiredgeinv (5, 6,
      false, false, false, false);
  
  drawstraightdiredgeinv (5, 8,
      false, false, false, false);
  
  % Edges from vertex f

    drawstraightdiredgeinv (6, 7,
      false, false, false, false);
  
  % Edges from vertex g

  drawstraightdiredgefatinv (7, 8,
      false, false, false, false);
  
  % Edges from vertex h

  drawstraightdiredgefatinv (8, 6,
      false, false, false, false);
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

vardef produce_label(expr index, start, finish, labelup) =
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
% FIGURE 2: Directed graph with inverted edges
%

beginfig(2);
  path c[];
  
  definegraphnodes;
  drawgraphnodes;
  labelgraphvertices;
  drawgraphedgesinv;
endfig;


%
% FIGURE 3: Directed graph with DFS tree
%

beginfig(3);
  path c[];
  
  definegraphnodes;
  drawgraphedgesDFS;
  drawgraphnodes;
  labelgraphvertices;

  % Dynamic labels cannot be written within macros, so have to be here
  % in main figure file
  write produce_label(1, 1, 16, true)  to "DynamicTeXLabels.tmp";
  write produce_label(2, 2, 15, false) to "DynamicTeXLabels.tmp";
  write produce_label(3, 3, 14, true)  to "DynamicTeXLabels.tmp";
  write produce_label(4, 5, 12, false) to "DynamicTeXLabels.tmp";
  write produce_label(5, 4, 13, true)  to "DynamicTeXLabels.tmp";
  write produce_label(6, 6, 11, false) to "DynamicTeXLabels.tmp";
  write produce_label(7, 7, 10, true)  to "DynamicTeXLabels.tmp";
  write produce_label(8, 8, 9, false)  to "DynamicTeXLabels.tmp";
  write EOF to "DynamicTeXLabels.tmp";       % Close file        
  input DynamicTeXLabels.tmp;                % input file (effects execution)
endfig;

%
% FIGURE 4: Directed graph with inverted edges and DFS tree
%

beginfig(4);
  path c[];
  
  definegraphnodes;
  drawgraphedgesDFSinv;
  drawgraphnodes;
  labelgraphvertices;

  % Dynamic labels cannot be written within macros, so have to be here
  % in main figure file
  write produce_label(1, 1, 6, true)    to "DynamicTeXLabels.tmp";
  write produce_label(2, 2, 3, false)   to "DynamicTeXLabels.tmp";
  write produce_label(3, 4, 5, true)    to "DynamicTeXLabels.tmp";
  write produce_label(4, 8, 9, false)   to "DynamicTeXLabels.tmp";
  write produce_label(5, 7, 10, true)   to "DynamicTeXLabels.tmp";
  write produce_label(6, 11, 16, false) to "DynamicTeXLabels.tmp";
  write produce_label(7, 13, 14, true)  to "DynamicTeXLabels.tmp";
  write produce_label(8, 12, 15, false) to "DynamicTeXLabels.tmp";
  write EOF to "DynamicTeXLabels.tmp";       % Close file        
  input DynamicTeXLabels.tmp;                % input file (effects execution)
endfig;



end
