% Tiling a 2 x n grid with domino tiles
%
% Also contains old code for tiling a 2^n x 2^n grid with L-shaped tiles
% (and with rows and columns fixed)
%
% Compile the figures by doing:
%
%    mpost tiling-2-by-n-grid.mp
%

color gray;
pen gridpen;
pen tilepen;

gray     := 0.9 * white;
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

% The coordinates i,j are where the base of the L (the 90-degree angle) is
% startdir should be 0, 90, 180, or 270
def drawltile (expr i, j, startdir) =
  pair ltilepts[];
  path ltile;

  ltilepts[1] := gridpoints[i][j]
    + dir(startdir) * offset
    + dir(startdir + 90) * offset;

  currdir := startdir;
  ltilepts[2] := ltilepts[1] + dir(currdir) * 2 * (cellsize - offset);

  currdir := currdir + 90;
  ltilepts[3] := ltilepts[2] + dir(currdir) * (cellsize - 2 * offset);

  currdir := currdir + 90;
  ltilepts[4] := ltilepts[3] + dir(currdir) * cellsize;

  currdir := currdir - 90;
  ltilepts[5] := ltilepts[4] + dir(currdir) * cellsize;

  currdir := currdir + 90;
  ltilepts[6] := ltilepts[5] + dir(currdir) * (cellsize - 2 * offset);

  ltile :=
    ltilepts[1]--
    ltilepts[2]--
    ltilepts[3]--
    ltilepts[4]--
    ltilepts[5]--
    ltilepts[6]--
    cycle;
  
  draw ltile withpen tilepen;
  fill ltile withcolor gray;
enddef;

%%% Note that the conventions below are different than for L-tiles
% The coordinates i,j identify the cell where the tile should start
% startdir should be 0, 90, 180, or 270
% The domino will then be drawn starting in direction startdir and
% making right turns (-90 degrees)
%
% (Note that the origin of the grid is the bottom left corner)

def drawdominotile (expr i, j, startdir) =
  pair dtilepts[];
  path dtile;

%%% DEBUGGING: print origin  
%     draw gridpoints[0][0] withpen pencircle scaled 5;
  
  if (startdir = 0):
    dtilepts[1] := gridpoints[i][j - 1]
      + dir(startdir) * offset
      + dir(startdir - 90) * offset;
  elseif (startdir = 90):
    dtilepts[1] := gridpoints[i - 1][j - 1]
      + dir(startdir) * offset
      + dir(startdir - 90) * offset;
  elseif (startdir = 180):
    dtilepts[1] := gridpoints[i - 1][j]
      + dir(startdir) * offset
      + dir(startdir - 90) * offset;
  elseif (startdir = 270):
    dtilepts[1] := gridpoints[i][j]
      + dir(startdir) * offset
      + dir(startdir - 90) * offset;
  fi;

  currdir := startdir;
  dtilepts[2] := dtilepts[1] + dir(currdir) * 2 * (cellsize - offset);

  currdir := currdir - 90;
  dtilepts[3] := dtilepts[2] + dir(currdir) * (cellsize - 2 * offset);

  currdir := currdir - 90;
  dtilepts[4] := dtilepts[3] + dir(currdir) * 2 * (cellsize - offset);

  dtile :=
    dtilepts[1]--
    dtilepts[2]--
    dtilepts[3]--
    dtilepts[4]--
    cycle;
  
  draw dtile withpen tilepen;
  fill dtile withcolor gray;

%%% DEBUGGING: print start point
%     draw dtilepts[1] withpen pencircle scaled 5;  
enddef;


def fillcell (expr i, j) =
  path tmptile;

  tmptile :=
    gridpoints[i-1][j-1]--
    gridpoints[i][j-1]--
    gridpoints[i][j]--
    gridpoints[i-1][j]--
    cycle;
  
  fill tmptile withcolor black;
enddef;

% FIG 1: Punctured grid
beginfig(1);
  pair gridpoints[][];
  
  definegrid (ncells);
  drawgridlines (ncells);

  fillcell (5, 6);
  
endfig;
 
 
% FIG 2: Tiled punctured grid
beginfig(2);
  pair gridpoints[][];
  
  definegrid (ncells);
  drawgridlines (ncells);

  % North-east
  fillcell (6, 5);
  drawltile (4, 6, 90);
  drawltile (7, 7, 180);
  drawltile (8, 8, 180);
  drawltile (4, 8, 90);
  drawltile (8, 4, 270);
  
  % Tile for inductive hypothesis
  drawltile (3, 3, 0);
  
  % South-west
  drawltile (0, 0, 0);
  drawltile (1, 1, 0);
  drawltile (2, 2, 0);
  drawltile (4, 0, 270);
  drawltile (0, 4, 90);

  % South-east
  drawltile (2, 6, 90);
  drawltile (1, 7, 90);
  drawltile (0, 8, 90);
  drawltile (0, 4, 0);
  drawltile (4, 8, 180);

  % North-west
  drawltile (6, 2, 270);
  drawltile (7, 1, 270);
  drawltile (8, 0, 270);
  drawltile (4, 0, 0);
  drawltile (8, 4, 180);
endfig;

% FIG 3:  Punctured grid with four subgrids
beginfig(3);
  pair gridpoints[][];

%     ncells   := 8;
%     cellsize := 7 mm;
%     offset   := 1.25 mm;
  ncells   := 16;
  cellsize := 5 mm;
  offset   := 1.25 mm;
  
  definegrid (ncells);
  drawgridlines (ncells);

  draw gridpoints[ncells/2][0]--gridpoints[ncells/2][ncells]
    withpen tilepen;  
  draw gridpoints[0][ncells/2]--gridpoints[ncells][ncells/2]
    withpen tilepen;
  
  fillcell (5, 6);

  drawltile (9, 9, 180);
  
endfig;
 

% FIG 4: Empty 2 by 10 grid
beginfig(4);
  pair gridpoints[][];

  nrows := 2; 
  ncols := 20; 

  definerectanglegrid (nrows, ncols);
  drawrectanglegridlines (nrows, ncols);
endfig;


% FIG 5: Only tiling of 2 by 1 grid
beginfig(5);
  pair gridpoints[][];

  nrows := 2; 
  ncols := 1; 
  
  definerectanglegrid (nrows, ncols);
  drawrectanglegridlines (nrows, ncols);

  drawdominotile (1, 1, 90);
endfig;
  

% FIG 6: First tiling of 2 by 2 grid
beginfig(6);
  pair gridpoints[][];

  nrows := 2; 
  ncols := 2; 
  
  definerectanglegrid (nrows, ncols);
  drawrectanglegridlines (nrows, ncols);

  drawdominotile (1, 1, 90);
  drawdominotile (1, 2, 90);
endfig;
 
% FIG 7:  Second tiling of 2 by 2 grid
beginfig(7);
  pair gridpoints[][];

  nrows := 2; 
  ncols := 2; 
  
  definerectanglegrid (nrows, ncols);
  drawrectanglegridlines (nrows, ncols);

  drawdominotile (1, 1, 0);
  drawdominotile (2, 1, 0);
endfig;
  

% FIG 8: First tiling of 2 by 3 grid
beginfig(8);
  pair gridpoints[][];

  nrows := 2; 
  ncols := 3; 
  
  definerectanglegrid (nrows, ncols);
  drawrectanglegridlines (nrows, ncols);

  drawdominotile (1, 1, 90);
  drawdominotile (1, 2, 90);
  drawdominotile (1, 3, 90);
endfig;
  

% FIG 9: Second tiling of 2 by 3 grid
beginfig(9);
  pair gridpoints[][];

  nrows := 2; 
  ncols := 3; 
  
  definerectanglegrid (nrows, ncols);
  drawrectanglegridlines (nrows, ncols);

  drawdominotile (1, 1, 90);
  drawdominotile (1, 2, 0);
  drawdominotile (2, 2, 0);
endfig;
 
% FIG 10: Third tiling of 2 by 3 grid
beginfig(10);
  pair gridpoints[][];

  nrows := 2; 
  ncols := 3; 
  
  definerectanglegrid (nrows, ncols);
  drawrectanglegridlines (nrows, ncols);

  drawdominotile (1, 1, 0);
  drawdominotile (2, 1, 0);
  drawdominotile (1, 3, 90);
endfig;
 

end
