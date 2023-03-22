SETS     i   /1*2/
         j   /1*3/;

Positive Variable x(i,j);
Free Variable z;

parameters  a(j)/1 50000,
                 2 30000,
                 3 40000/,
            b(j)/1 87,
                 2 89,
                 3 92/;

Equations
Con1,
Con2,
Con3(j),
Con4(j),
Obj;

Con1..           5*sum(j , x('1',j)) + 10*sum(j , x('2',j)) =L= 1500000;
Con2..           2*sum(j , x('2',j)) =E= 200000;
Con3(j)..        sum(i , x(i,j)) =L= a(j);
Con4(j)..        (82*x('1',j) + 98*x('2',j)) =G= b(j)*sum(i,x(i,j));
Obj..            6.7*sum(i , x(i,'1')) + 7.2*sum(i , x(i,'2')) + 8.1*sum(i , x(i,'3')) =E= z;


Model homework1_4/All/ ;

Solve homework1_4 using lp maximizing z;

Display x.L , z.L;
