% Selecting boxes in a row
%
% Compile the figures by doing:
%
%    mpost selecting-boxes.mp
%

color gray;
color darkgray;
pen gridpen;
pen tilepen;

gray     := 0.9 * white;
darkgray := 0.7 * white;
gridpen  := pencircle scaled 1 pt;
tilepen  := pencircle scaled 3 pt;

ncells   := 8;
cellsize := 7 mm;
offset   := 1.25 mm;

def definegrid (expr gridsize) =
  definerectanglegrid (gridsize, gridsize);  
enddef;

% The origin is the bottom left corner

def definerectanglegrid (expr nrows, ncols) =
  gridpoints[0][0] = origin;
  
  for j := 1 upto ncols:
    gridpoints[0][j] = gridpoints[0][j-1] + (cellsize, 0);
  endfor;
  
  for i := 1 upto nrows:
    gridpoints[i][0] = gridpoints[i-1][0] + (0, cellsize);
    for j := 1 upto ncols:
      gridpoints[i][j] = gridpoints[i][j-1] + (cellsize, 0);
    endfor;
  endfor;
enddef;

def drawgriddots (expr gridsize) =
  drawrectanglegriddots (gridsize, gridsize);
enddef;

def drawrectanglegriddots (expr nrows, ncols) =
  for i := 0 upto nrows:
    for j := 0 upto ncols:
      draw gridpoints[i][j] withpen tilepen;
    endfor;
  endfor;
enddef;

def drawgridlines (expr gridsize) =
  drawrectanglegridlines (gridsize, gridsize);
enddef;

def drawrectanglegridlines (expr nrows, ncols) =
  for i := 0 upto nrows:
    draw gridpoints[i][0]--gridpoints[i][ncols] withpen gridpen;
  endfor;

  for j := 0 upto ncols:
    draw gridpoints[0][j]--gridpoints[nrows][j] withpen gridpen;
  endfor;
enddef;

def fillcell (expr i, j) =
  path tmptile;

  tmptile :=
    gridpoints[i-1][j-1]--
    gridpoints[i][j-1]--
    gridpoints[i][j]--
    gridpoints[i-1][j]--
    cycle;
  
%     fill tmptile withcolor black;
  fill tmptile withcolor darkgray;
enddef;

def printnumbers (expr ncols) =
  for j := 1 upto ncols:
    label (decimal(j),
	1/2[gridpoints[0][j], gridpoints[1][j-1]]);
  endfor;
enddef;



% FIG 1: Selected set S
beginfig(1);
  pair gridpoints[][];

  nrows := 1; 
  ncols := 10; 
  
  definerectanglegrid (nrows, ncols);

  fillcell (1, 3);
  fillcell (1, 5);
  fillcell (1, 6);
  fillcell (1, 7);

  drawrectanglegridlines (nrows, ncols);
  printnumbers (ncols);
endfig;
 
 

end
