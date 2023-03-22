Sets i
Alias(i,j,k);

Parameters
y(i) y coordinate of node-i
x(i) x coordinate of node-i
d(i,j) distance between node-i and node-j
e(i,j) iki nod arasindaki enerji


$if not set gdxin $set gdxin lo
$GDXIN C:\Users\seker\Desktop\gems\lo.gdx
$LOAD  i x y d e
$GDXIN


Integer Variable f(i,j,k);
Free Variable beta_min;

* Upper Bound on flows
f.up(i,j,k)=1;
* Lower Bounds on flows
f.lo(i,j,k)=0;


Equation
Con1(i,j,k),
Con3_1(i,k),
Con3_2(i,k),
Con3_3(i,k),
Con4(k),
Con5,
Con6(i,j,k);

Con1(i,j,k)$(ord(i)<>1 and ord(k)<>1 and ord(j)<>ord(i) and d(i,j)>82.92)..f(i,j,k)  =E=0 ;
Con3_1(i,k)$(ord(i) = ord(k) and ord(k) <> 1)..sum(j$(ord(j) <> ord(i)),f(i,j,k)) - sum(j$(ord(j)<>ord(i) and ord(j)<>1),f(j,i,k))                        =E=    1;
Con3_2(i,k)$(ord(i) = 1 and ord(k) <> 1)..sum(j$(ord(i) <> ord(j)),f(i,j,k)) - sum(j$(ord(j)<>ord(i) and ord(j)<>1),f(j,i,k))                             =E=   -1;
Con3_3(i,k)$(not (ord(i) = 1 or ord(i) = ord(k)) and ord(k) <> 1)..sum(j$(ord(i) <> ord(j)),f(i,j,k)) - sum(j$(ord(j)<>ord(i) and ord(j)<>1),f(j,i,k))    =E=    0;

Con4(k)$(ord(k)<>1)..    sum(j$(ord(j) <> 1),f(j,k,k)) =E= 0;
Con5..       sum(i$(ord(i)<>1), sum(j,sum(k$(ord(k)<>1),f(i,j,k)))) =E= beta_min;
Con6(i,j,k)$(ord(i)<>1 and ord(k)<>1 and ord(j)<>ord(i))..f(i,j,k)  =G= 0;



Model hopCount/All/;
Solve hopCount using mip minimizing beta_min;
Display beta_min.L, x, y, d;

execute_unload 'C:\Users\seker\Desktop\gems\Result.gdx',beta_min;
