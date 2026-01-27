%
% PYRAMID OF HEIGHT 6 DRAWN AS PYRAMID AND RECTILINEAR LATTICE
%
%    Compile by doing "mpost pyramidHeight6.mp"
%

color gray;
pair  lblshift;

gray        :=  0.80 white;
height      :=   6;           % height of pyramid
commonscale := 5.90 mm;       % scaling factor
csize       := 5.0 mm;        % diameter of nodes

lblshift := (-0.9csize, 0);

%
% Define and draw pyramid
%
def defineanddrawthepyramid =
  z[1] = origin;

  % Define lowest row
  first := height * (height + 1) / 2 + 1;
  last  := (height + 1) * (height + 2) / 2;

  for j = first + 1 upto last:
    y[j] = y[j - 1];
    x[j] = x[j - 1] + hscale;
  endfor

  % Define rows above
  for i = (height - 1) downto 0:
    first := i * (i + 1) / 2 + 1;
    last  := (i + 1) * (i + 2) / 2;
    y[first] = y[first + i + 1] + vscale;
    x[first] = (x[first + i + 1] + x [first + i + 2]) / 2;
    for j = first + 1 upto last:
      y[j] = y[j - 1];
      x[j] = (x[j + i + 1] + x[j + i + 2]) / 2;
    endfor
  endfor

  % Draw pyramid nodes
  for j = 1 upto (height + 1) * (height + 2) / 2:
    c[j] = fullcircle scaled csize shifted z[j];
    fill c[j] withcolor gray;
    draw c[j];
  endfor
  
  % Draw edges
  for i = height-1 downto 0:
    for j = (i * (i + 1) / 2 + 1) upto ((i + 1) * (i + 2) / 2):
%         drawarrow z[j + i + 1]--z[j] cutbefore c[j + i + 1] cutafter c[j];
%         drawarrow z[j + i + 2]--z[j] cutbefore c[j + i + 2] cutafter c[j];

      drawarrow z[j]--z[j + i + 1] cutbefore c[j] cutafter c[j + i + 1];
      drawarrow z[j]--z[j + i + 2] cutbefore c[j] cutafter c[j + i + 2];

    endfor
  endfor

enddef;

%
% Draw vertex labels shifted by amount lblshift
%
def labelverticesshifted =
  label(btex $z$ etex , z[1] + lblshift);
  
  label(btex $y_1$ etex , z[2] + lblshift);
  label(btex $y_2$ etex , z[3] + lblshift);

  label(btex $x_1$ etex , z[4] + lblshift);
  label(btex $x_2$ etex , z[5] + lblshift);
  label(btex $x_3$ etex , z[6] + lblshift);

  label(btex $w_1$ etex , z[7] + lblshift);
  label(btex $w_2$ etex , z[8] + lblshift);
  label(btex $w_3$ etex , z[9] + lblshift);
  label(btex $w_4$ etex , z[10] + lblshift);

  label(btex $v_1$ etex , z[11] + lblshift);
  label(btex $v_2$ etex , z[12] + lblshift);
  label(btex $v_3$ etex , z[13] + lblshift);
  label(btex $v_4$ etex , z[14] + lblshift);
  label(btex $v_5$ etex , z[15] + lblshift);

  label(btex $u_1$ etex , z[16] + lblshift);
  label(btex $u_2$ etex , z[17] + lblshift);
  label(btex $u_3$ etex , z[18] + lblshift);
  label(btex $u_4$ etex , z[19] + lblshift);
  label(btex $u_5$ etex , z[20] + lblshift);
  label(btex $u_6$ etex , z[21] + lblshift);

  label(btex $s_1$ etex , z[22] + lblshift);
  label(btex $s_2$ etex , z[23] + lblshift);
  label(btex $s_3$ etex , z[24] + lblshift);
  label(btex $s_4$ etex , z[25] + lblshift);
  label(btex $s_5$ etex , z[26] + lblshift);
  label(btex $s_6$ etex , z[27] + lblshift);
  label(btex $s_7$ etex , z[28] + lblshift);
enddef;

%
% Draw vertex labels on vertices rotated by amount
% pyramidrotationangle
%
def labelverticesonvertices(expr pyramidrotationangle) =
  label(btex $z$ etex rotated -pyramidrotationangle , z[1]);
  
  label(btex $y_0$ etex rotated -pyramidrotationangle , z[2]);
  label(btex $y_1$ etex rotated -pyramidrotationangle , z[3]);

  label(btex $x_0$ etex rotated -pyramidrotationangle , z[4]);
  label(btex $x_1$ etex rotated -pyramidrotationangle , z[5]);
  label(btex $x_2$ etex rotated -pyramidrotationangle , z[6]);

  label(btex $w_0$ etex rotated -pyramidrotationangle , z[7]);
  label(btex $w_1$ etex rotated -pyramidrotationangle , z[8]);
  label(btex $w_2$ etex rotated -pyramidrotationangle , z[9]);
  label(btex $w_3$ etex rotated -pyramidrotationangle , z[10]);

  label(btex $v_0$ etex rotated -pyramidrotationangle , z[11]);
  label(btex $v_1$ etex rotated -pyramidrotationangle , z[12]);
  label(btex $v_2$ etex rotated -pyramidrotationangle , z[13]);
  label(btex $v_3$ etex rotated -pyramidrotationangle , z[14]);
  label(btex $v_4$ etex rotated -pyramidrotationangle , z[15]);

  label(btex $u_0$ etex rotated -pyramidrotationangle , z[16]);
  label(btex $u_1$ etex rotated -pyramidrotationangle , z[17]);
  label(btex $u_2$ etex rotated -pyramidrotationangle , z[18]);
  label(btex $u_3$ etex rotated -pyramidrotationangle , z[19]);
  label(btex $u_4$ etex rotated -pyramidrotationangle , z[20]);
  label(btex $u_5$ etex rotated -pyramidrotationangle , z[21]);

  label(btex $s_0$ etex rotated -pyramidrotationangle , z[22]);
  label(btex $s_1$ etex rotated -pyramidrotationangle , z[23]);
  label(btex $s_2$ etex rotated -pyramidrotationangle , z[24]);
  label(btex $s_3$ etex rotated -pyramidrotationangle , z[25]);
  label(btex $s_4$ etex rotated -pyramidrotationangle , z[26]);
  label(btex $s_5$ etex rotated -pyramidrotationangle , z[27]);
  label(btex $s_6$ etex rotated -pyramidrotationangle , z[28]);
enddef;

%
% FIGURE 1: Pyramid with labels beside vertices
%
beginfig(1);
  path c[];

  hscale := 2 * commonscale;
  vscale := commonscale;        
  
  defineanddrawthepyramid;

  labelverticesshifted;
endfig;



%
% FIGURE 2: Pyramid with labels on vertices
%
beginfig(2);
  path c[];

  hscale := 1.8 * commonscale;
  vscale := 1.5 * commonscale;        
  
  defineanddrawthepyramid;

  labelverticesonvertices(0);

endfig;


%
% FIGURE 3: Pyramid with labels on vertices, rotated to
% rectilinear lattice
%
% This version with rotation does not work with old versions
% of PDF-LaTeX!
%
beginfig(3);
  path c[];
  pen axispen;

  axispen := pencircle scaled 1.65;
  
  hscale := 2 * commonscale;
  vscale := commonscale;        
  
  defineanddrawthepyramid;

  labelverticesonvertices (135);

  currentpicture := currentpicture rotated 135;

  axisoffset := sqrt ((x[1]-x[2])**2 + (y[1]-y[2])**2);
  labeloffset := 1.7 axisoffset;
  ticklength := 1 mm;

  % y axis
  drawarrow
  (-axisoffset, -1.5 axisoffset)--
  (-axisoffset, (height + 0.5) * axisoffset)
  withpen axispen;

  for j = 0 step axisoffset until height * axisoffset:
    draw
    (-axisoffset - ticklength, j)--
    (-axisoffset + ticklength, j)
    withpen axispen;
  endfor;

  label(btex $1$ etex, (-labeloffset, 0));
  label(btex $2$ etex, (-labeloffset, axisoffset));
  label(btex $3$ etex, (-labeloffset, 2 axisoffset));
  label(btex $4$ etex, (-labeloffset, 3 axisoffset));
  label(btex $\ldots$ etex rotated 90, (-labeloffset, 4 axisoffset));
  label(btex $L$$-$$1$ etex, (-labeloffset, (height-1) * axisoffset));
  label(btex $L$ etex, (-labeloffset, height * axisoffset));

  % x axis
  drawarrow
  (-1.5 axisoffset, -axisoffset)--
  ((height + 0.5) * axisoffset, -axisoffset)
  withpen axispen;

  for j = 0 step axisoffset until height * axisoffset:
    draw
    (j, -axisoffset - ticklength)--
    (j, -axisoffset + ticklength)
    withpen axispen;
  endfor;
  
  label(btex $1$ etex, (0, -labeloffset));
  label(btex $2$ etex, (axisoffset, -labeloffset));
  label(btex $3$ etex, (2 axisoffset, -labeloffset));
  label(btex $4$ etex, (3 axisoffset, -labeloffset));
  label(btex $\ldots$ etex, (4 axisoffset, -labeloffset));
  label(btex $L$$-$$1$ etex, ((height-1) * axisoffset, -labeloffset));
  label(btex $h$ etex, (height * axisoffset, -labeloffset));
endfig;


%
% FIGURE 4: Pyramid with labels on vertices, rotated to
% rectilinear lattice
%
% New version of figure 3 without rotation to avoid  bug
% in old versions of PDF-LaTeX.
%
beginfig(4);
  path c[];
  pen axispen;

  axispen := pencircle scaled 1.65;

  axisoffset := sqrt (2 * ((commonscale)**2));
  labeloffset := 1.7 axisoffset;
  ticklength := 1 mm;

  z[1] = origin;

  % Definiera lowest row
  first := height * (height + 1) / 2 + 1;
  last  := (height + 1) * (height + 2) / 2;

  for j = first + 1 upto last:
    y[j] = y[j - 1] + axisoffset;
    x[j] = x[j - 1] - axisoffset;
  endfor
  
  % Define rows above
  for i = (height - 1) downto 0:
    first := i * (i + 1) / 2 + 1;
    last  := (i + 1) * (i + 2) / 2;
    y[first] = y[first + i + 1];
    x[first] = x[first + i + 1] - axisoffset;
    for j = first + 1 upto last:
      y[j] = y[j - 1] + axisoffset;
      x[j] = x[j - 1] - axisoffset;
    endfor
  endfor
  
  % Rita punkter med små cirklar runt

  for j = 1 upto (height + 1) * (height + 2) / 2:
    c[j] = fullcircle scaled csize shifted z[j];
    fill c[j] withcolor gray;
    draw c[j];
  endfor
  
  % Rita kanter
  
  for i = height-1 downto 0:
    for j = (i * (i + 1) / 2 + 1) upto ((i + 1) * (i + 2) / 2):
%         drawarrow z[j + i + 1]--z[j] cutbefore c[j + i + 1] cutafter c[j];
%         drawarrow z[j + i + 2]--z[j] cutbefore c[j + i + 2] cutafter c[j];
      
      drawarrow z[j]--z[j + i + 1] cutbefore c[j] cutafter c[j + i + 1];
      drawarrow z[j]--z[j + i + 2] cutbefore c[j] cutafter c[j + i + 2];      
    endfor
  endfor

  % Label vertices
  labelverticesonvertices (0);

  % y axis
  drawarrow
  (-axisoffset, -1.5 axisoffset)--
  (-axisoffset, (height + 0.5) * axisoffset)
  withpen axispen;

  for j = 0 step axisoffset until height * axisoffset:
    draw
    (-axisoffset - ticklength, j)--
    (-axisoffset + ticklength, j)
    withpen axispen;
  endfor;

  label(btex $0$ etex, (-labeloffset, 0));
  label(btex $1$ etex, (-labeloffset, axisoffset));
  label(btex $2$ etex, (-labeloffset, 2 axisoffset));
  label(btex $3$ etex, (-labeloffset, 3 axisoffset));
  label(btex $\ldots$ etex rotated 90, (-labeloffset, 4 axisoffset));
  label(btex $L-$$2$ etex, (-labeloffset, (height-1) * axisoffset));
  label(btex $L-$$1$ etex, (-labeloffset, height * axisoffset));

  % x axis
  drawarrow
  (-1.5 axisoffset, -axisoffset)--
  ((height + 0.5) * axisoffset, -axisoffset)
  withpen axispen;

  for j = 0 step axisoffset until height * axisoffset:
    draw
    (j, -axisoffset - ticklength)--
    (j, -axisoffset + ticklength)
    withpen axispen;
  endfor;
  
  label(btex $0$ etex, (0, -labeloffset));
  label(btex $1$ etex, (axisoffset, -labeloffset));
  label(btex $2$ etex, (2 axisoffset, -labeloffset));
  label(btex $3$ etex, (3 axisoffset, -labeloffset));
  label(btex $\ldots$ etex, (4 axisoffset, -labeloffset));
  label(btex $L-$$2$ etex, ((height-1) * axisoffset, -labeloffset));
  label(btex $L-$$1$ etex, (height * axisoffset, -labeloffset));
endfig;

end
