Sets i
Alias (i,j,k);

Parameters
         y(i) y coordinate of node-i
         x(i) x coordinate of node-i
         d(i,j) distance between node-i and node-j
         e(i,j)
         energy(i)
         beta_min
         n
;

$if not set gdxin $set gdxin Result
$GDXIN C:\Users\seker\Desktop\gems\lo1.gdx
$LOAD    i d e beta_min n
$GDXIN

integer variable f(i,j,k);

* Upper Bound on flows
*f.up(i,j,k)=1;
* Lower Bounds on flows
f.lo(i,j,k)=0;
*56

free variable t;


Equations
Con0(i,j,k),
Con7_1(i,k),
Con7_2(i,k),
Con7_3(i,k),
Con8(k),
Con9(i),
*Con10(i),
Con11,
Con12(i,j,k);

Con0(i,j,k)$(ord(i)<>1 and ord(k)<>1 and ord(j)<>ord(i) and d(i,j)>82.92)..      f(i,j,k)  =E=0 ;
Con7_1(i,k)$(ord(i)=ord(k) and ord(k)<>1)..                                      sum(j$(ord(j)<>ord(i)), f(i,j,k)) - sum(j$(ord(j)<>ord(i) and ord(j)<>1), f(j,i,k)) =E= t;
Con7_2(i,k)$(ord(i)=1 and ord(k)<>1)..                                           sum(j$(ord(j)<>ord(i)), f(i,j,k)) - sum(j$(ord(j)<>ord(i) and ord(j)<>1), f(j,i,k)) =E= -t;
Con7_3(i,k)$(ord(i)<>ord(k) and ord(i)<>1 and ord(k)<>1)..                       sum(j$(ord(j)<>ord(i)), f(i,j,k)) - sum(j$(ord(j)<>ord(i) and ord(j)<>1), f(j,i,k)) =E= 0;
Con8(k)$(ord(k)<>1)..                                                            sum(j$(ord(j)<>1), f(j,k,k)) =E= 0;
Con9(i)$(ord(i)<>1)..                                                            1024*sum(k$(ord(k)<>1),(sum(j,(e(i,j)*f(i,j,k)))+922*sum(j$(ord(j)<>1),f(j,i,k)))) =L= 25000000000000 ;
*Con10(i)$(ord(i)<>1)..                                                           energy(i)=E=25000000000000;
Con11..                                                                          sum(i$(ord(i)<>1),sum((j),sum(k$(ord(k)<>1),f(i,j,k)))) =L= beta_min*n*t;
Con12(i,j,k)$(ord(k)<>1 and ord(i)<>1 and ord(i)<>ord(j) )..                     f(i,j,k) =G= 0;



Model hop_count_second/All/ ;

Solve hop_count_second using mip maximizing t;

Display t.L;

execute_unload 'C:\Users\seker\Desktop\gems\Result1.gdx',t;



