% Tiling a 2^n x 2^n grid with L-shaped tiles
%
% Compile the figures by doing:
%
%    mpost tiling-L.mp
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
  gridpoints[0][0] = origin;
  
  for j := 1 upto gridsize:
    gridpoints[0][j] = gridpoints[0][j-1] + (0, cellsize);
  endfor;
  
  for i := 1 upto gridsize:
    gridpoints[i][0] = gridpoints[i-1][0] + (cellsize, 0);
    for j := 1 upto gridsize:
      gridpoints[i][j] = gridpoints[i][j-1] + (0, cellsize);
    endfor;
  endfor;
enddef;

def drawgriddots (expr gridsize) = 
  for i := 0 upto gridsize:
    for j := 0 upto gridsize:
      draw gridpoints[i][j] withpen tilepen;
    endfor;
  endfor;
enddef;

def drawgridlines (expr gridsize) = 
  for i := 0 upto gridsize:
    draw gridpoints[i][0]--gridpoints[i][gridsize] withpen gridpen;
  endfor;

  for j := 0 upto gridsize:
    draw gridpoints[0][j]--gridpoints[gridsize][j] withpen gridpen;
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
  fillcell (5, 6);
  drawltile (6, 4, 90);
  drawltile (7, 7, 180);
  drawltile (8, 8, 180);
  drawltile (8, 4, 90);
  drawltile (4, 8, 270);
  
  % Tile for inductive hypothesis
  drawltile (3, 3, 0);
  
  % South-west
  drawltile (0, 0, 0);
  drawltile (1, 1, 0);
  drawltile (2, 2, 0);
  drawltile (0, 4, 270);
  drawltile (4, 0, 90);

  % South-east
  drawltile (6, 2, 90);
  drawltile (7, 1, 90);
  drawltile (8, 0, 90);
  drawltile (4, 0, 0);
  drawltile (8, 4, 180);

  % North-west
  drawltile (2, 6, 270);
  drawltile (1, 7, 270);
  drawltile (0, 8, 270);
  drawltile (0, 4, 0);
  drawltile (4, 8, 180);
endfig;

% FIG 1: Punctured grid
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
 

 
end
