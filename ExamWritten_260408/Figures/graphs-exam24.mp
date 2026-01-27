%%%
%%% GRAPHS FOR IDMA '24 EXAM
%%%
% Code for drawing directed and undirected graphs
%
% Used in this file for the graphs for the written exam for IDMA '24
%
%    Compile by doing "mpost graphs-exam24.mp"
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

vardef produce_given_number_as_label(expr index, vlabel) =  
  "label (btex $"&decimal index&"$ etex, z["&decimal vlabel&"]);"
enddef;


%%%
%%% MACROS FOR DEFINING CONCRETE GRAPH
%%%====================================
%%%



%%%
%%% GRAPH ON CIRCLE
%%%

%
% Define graph-on-cicrle nodes 
%
def definegraphoncirclenodes =
  circleradius := 12.5 mm;
  
  % Define points and nodes
  for angle := 0 upto 4:
    z[angle + 1] = origin + circleradius * dir (angle * 360 / 5);
    c[angle + 1] = fullcircle scaled csize shifted z[angle + 1];
  endfor
enddef;

%
% Draw graph nodes 
%
def drawgraphoncirclenodes =
  for i := 1 upto 5:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;



%
% Draw graph edges
%
def drawcircleedge (expr startpt, startangle, endpt, endangle) =
%     draw z[startpt]--z[endpt] cutbefore c[startpt] cutafter c[endpt];
  draw z[startpt]{dir(startangle + 90)}..{dir(endangle + 90)}z[endpt]
    cutbefore c[startpt] cutafter c[endpt];
enddef;


def drawgraphoncircleedges =
  drawcircleedge (1, 0 * 360 / 5, 2, 1 * 360 / 5);
  drawcircleedge (2, 1 * 360 / 5, 3, 2 * 360 / 5);
  drawcircleedge (4, 3 * 360 / 5, 5, 4 * 360 / 5);
  drawcircleedge (5, 4 * 360 / 5, 1, 0 * 360 / 5);

  draw z[2]--z[5] cutbefore c[2] cutafter c[5];  
enddef;


%%%
%%% SECOND GRAPH ON CIRCLE
%%%

%
% Define second graph-on-cicrle nodes 
%
def definesecondgraphoncirclenodes =
  circleradius := 12.5 mm;
  
  % Define points and nodes
  for angle := 0 upto 4:
    z[angle + 1] = origin + circleradius * dir (90 + angle * 360 / 5);
    c[angle + 1] = fullcircle scaled csize shifted z[angle + 1];
  endfor
enddef;

%
% Draw graph nodes 
%
def drawsecondgraphoncirclenodes =
  for i := 1 upto 5:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


%
% Draw graph edges
%
def drawsecondgraphoncircleedges =

  for i := 2 upto 5:
    draw z[1]--z[i] cutbefore c[1] cutafter c[i];  
  endfor
  
  draw z[3]--z[4] cutbefore c[3] cutafter c[4];  
enddef;


%%%
%%% ENVELOPE GRAPH ON CIRCLE
%%%

%
% Define second graph-on-cicrle nodes 
%
def defineenvelopegraphnodes =
  circleradius := 15.0 mm;
  
  % Define points and nodes
  for angle := 0 upto 3:
    z[angle + 1] = origin + circleradius * dir (45 + angle * 360 / 4);
    c[angle + 1] = fullcircle scaled csize shifted z[angle + 1];
  endfor

  z[5] = origin;
  c[5] = fullcircle scaled csize shifted z[5];

enddef;

%
% Draw graph nodes 
%
def drawenvelopegraphnodes =
  for i := 1 upto 5:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


%
% Draw graph edges
%
def drawenvelopegraphedges =
  for i := 1 upto 3:
    draw z[i]--z[i+1] cutbefore c[i] cutafter c[i+1];  
  endfor
  
  draw z[4]--z[1] cutbefore c[4] cutafter c[1];  
  draw z[1]--z[5] cutbefore c[1] cutafter c[5];  
  draw z[2]--z[5] cutbefore c[2] cutafter c[5];  
enddef;



%%%
%%% GRAPH ON STRAIGHT LINE
%%%

%
% Define straight-line graph nodes 
%
def definestraightlinegraphnodes =
  relnodedist := 12.4 mm;
  row         := 1;
  i           := 0;
  
  % Define points
  for col := 1 upto 5:
    i := i + 1;
    z[i] = origin + ((col -1) * relnodedist, -(row - 1) * relnodedist);
  endfor

  % Define nodes 
  for j := 1 upto i:
    c[j] = fullcircle scaled csize shifted z[j];
  endfor
enddef;


%
% Draw graph nodes 
%
def drawstraightlinegraphnodes =
  for i := 1 upto 5:
    draw c[i];
    fill c[i] withcolor white;
  endfor
enddef;


def drawstraightlinegraphedge (expr starti, endi, isabove) =
  damp     := 0.15;
  addconst := 0.30;
  dist := endi - starti;
  
  if (isabove):
    fac := 1;
  else:
    fac := -1;
  fi;
  
  drawcurvedundiredge (starti, endi, fac * (damp + addconst) * dist,
      false, false, false, false);
enddef;

%
% Draw graph edges
%
def drawstraightlinegraphedges =
  drawstraightlinegraphedge (1, 5, true);
  drawstraightlinegraphedge (1, 2, false);
  drawstraightlinegraphedge (2, 3, true);
  drawstraightlinegraphedge (2, 5, false);
  
%     drawstraightlinegraphedge (4, 5, true);
  draw z[4]--z[5] cutbefore c[4] cutafter c[5];  
enddef;
 

%   def drawstraightundiredge (expr startpt, endpt, uselbl, lbl, lbloffsetfac, lblfrac) =
%     drawundiredge (startpt, 1/2[z[startpt], z[endpt]], endpt,
%         uselbl, lbl, lbloffsetfac, lblfrac, currentpen);
%   enddef;





%
% FIGURE 1: Graph on circle
%

beginfig(1);
  path c[];

  definegraphoncirclenodes;
  drawgraphoncirclenodes;
  drawgraphoncircleedges;
  
  for i := 1 upto 5:
%       write produce_number_as_label (i) to "DynamicTeXLabels.tmp";
    write produce_given_number_as_label (i, 6 - i) to "DynamicTeXLabels.tmp";
  endfor;
  write EOF to "DynamicTeXLabels.tmp";       % Close file        
  input DynamicTeXLabels.tmp;                % input file (effects execution)

endfig;



%
% FIGURE 2: Second graph on circle
%

beginfig(2);
  path c[];

  definesecondgraphoncirclenodes;
  drawsecondgraphoncirclenodes;
  drawsecondgraphoncircleedges;
  
  for i := 1 upto 5:
    write produce_number_as_label (i) to "DynamicTeXLabels.tmp";
  endfor;
  write EOF to "DynamicTeXLabels.tmp";       % Close file        
  input DynamicTeXLabels.tmp;                % input file (effects execution)

endfig;



%
% FIGURE 3: Graph on straight line
%

beginfig(3);
  path c[];

  definestraightlinegraphnodes;
  drawstraightlinegraphnodes;
  drawstraightlinegraphedges;

  for i := 1 upto 5:
    write produce_number_as_label (i) to "DynamicTeXLabels.tmp";
  endfor;
  write EOF to "DynamicTeXLabels.tmp";       % Close file        
  input DynamicTeXLabels.tmp;                % input file (effects execution)

endfig;


%
% FIGURE 4: Envelope graph
%

beginfig(4);
  path c[];

  defineenvelopegraphnodes;
  drawenvelopegraphnodes;
  drawenvelopegraphedges;
  
  for i := 1 upto 5:
    write produce_number_as_label (i) to "DynamicTeXLabels.tmp";
  endfor;
  write EOF to "DynamicTeXLabels.tmp";       % Close file        
  input DynamicTeXLabels.tmp;                % input file (effects execution)

endfig;







end
   
