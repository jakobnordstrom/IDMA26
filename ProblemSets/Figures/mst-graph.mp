%
% Code for drawing directed and undirected graphs
%
% Used in this file to draw undirected graphs for MST computation
%
%    Compile by doing "mpost mst-graph.mp"
%

color gray;
pen   fatedgepen;
 
fatedgepen = pencircle scaled 2.0;


gray          :=  0.80 white;
csize         :=  6.0 mm;        % diameter of nodes
csize         :=  5.9 mm;        
vdist         := 40.0 mm;
stdedgeoffset :=  5.0 mm;
stdedgeoffset :=  5.1 mm;
stdlbloffset  :=  3.0 mm;


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

  % Define nodes
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
% Draw edges in graph
%

def drawgraphedges =
  pair midpt;

  % Edges from vertex a

  drawstraightundiredge (1, 2,
      true, btex $5$ etex, -1, 0.5);
  
  drawstraightundiredge (1, 3,
      true, btex $6$ etex, 1, 0.5);
  
%     drawcurvedundiredge (1, 4, 1,
%         true, btex $5$ etex, 1, 0.4);  
  drawstraightundiredge (1, 4,
      true, btex $4$ etex, 1, 0.35);  

  % Edges from vertex b

%     drawcurvedundiredge (2, 3, -1,
%         true, btex $1$ etex, -1, 0.4);
  drawstraightundiredge (2, 3, 
      true, btex $1$ etex, -1, 0.35);
  
  drawstraightundiredge (2, 4,
      true, btex $3$ etex, -1, 0.5);
  
%     drawstraightundiredge (2, 4,
%         true, btex $17$ etex, -1, 0.5);
  
  % Edges from vertex c

  drawstraightundiredge (3, 4,
      true, btex $2$ etex, 1, 0.5);
  
  drawstraightundiredge (3, 5,
      true, btex $7$ etex, 1, 0.5);
  
  drawstraightundiredge (3, 6,
      true, btex $8$ etex, 1, 0.35);  
  
  % Edges from vertex d

  drawstraightundiredge (4, 5, 
      true, btex $6$ etex, -1, 0.35);
  
  drawstraightundiredge (4, 6,
      true, btex $7$ etex, -1, 0.5);
  
  % Edges from vertex e

  drawstraightundiredge (5, 6,
      true, btex $4$ etex, 1, 0.5);
  
  drawstraightundiredge (5, 7,
      true, btex $8$ etex, 1, 0.5);
  
  % Edges from vertex f

    drawstraightundiredge (6, 8,
      true, btex $9$ etex, -1, 0.5);
  
  % Edges from vertex g

  drawstraightundiredge (7, 8,
      true, btex $1$ etex, 1, 0.5);
  
  % Edges from vertex h

enddef;
 

%
% Draw edges in graph with fat edges for MST
%

def drawgraphedgesandmst =
  pair midpt;

  % Edges from vertex a

  drawstraightundiredge (1, 2,
      true, btex $5$ etex, -1, 0.5);
  
  drawstraightundiredge (1, 3,
      true, btex $6$ etex, 1, 0.5);
  
  drawstraightundiredgefat (1, 4,
      true, btex $4$ etex, 1, 0.35);  

  % Edges from vertex b

  drawstraightundiredgefat (2, 3, 
      true, btex $1$ etex, -1, 0.35);
  
  drawstraightundiredge (2, 4,
      true, btex $3$ etex, -1, 0.5);
  
  % Edges from vertex c

  drawstraightundiredgefat (3, 4,
      true, btex $2$ etex, 1, 0.5);
  
  drawstraightundiredge (3, 5,
      true, btex $7$ etex, 1, 0.5);
  
  drawstraightundiredge (3, 6,
      true, btex $8$ etex, 1, 0.35);  
  
  % Edges from vertex d

  drawstraightundiredgefat (4, 5, 
      true, btex $6$ etex, -1, 0.35);
  
  drawstraightundiredge (4, 6,
      true, btex $7$ etex, -1, 0.5);
  
  % Edges from vertex e

  drawstraightundiredgefat (5, 6,
      true, btex $4$ etex, 1, 0.5);
  
  drawstraightundiredgefat (5, 7,
      true, btex $8$ etex, 1, 0.5);
  
  % Edges from vertex f

    drawstraightundiredge (6, 8,
      true, btex $9$ etex, -1, 0.5);
  
  % Edges from vertex g

  drawstraightundiredgefat (7, 8,
      true, btex $1$ etex, 1, 0.5);
  
  % Edges from vertex h

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


%
% FIGURE 1: Undirected graph with edges
%
beginfig(1);
  path c[];
  
  definegraphnodes;
  drawgraphnodes;

  labelgraphvertices;

  drawgraphedges;
endfig;

%
% FIGURE 1: Undirected graph with MST
%
beginfig(2);
  path c[];
  
  definegraphnodes;


  drawgraphedgesandmst;
  drawgraphnodes;
  labelgraphvertices;
endfig;


end
