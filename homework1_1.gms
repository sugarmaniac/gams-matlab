Positive Variable x1 , x2 , x3 , x4 , x5 ;
Free Variable z;

Equations
Con1,
Con2,
Con3,
Con4,
Con5,
Con6,
Obj ;

Con1.. x5 =L= 300;
Con2.. 0.18*x1 + 0.28*x2 + 0.4*x3 + 0.5*x4 =L= 0.2125*x6;
Con3.. x1 =g= 0.2*(x1 + x2 + x3 + x4);
Con4.. x2 =G= 0.1*(x1 + x2 + x3 + x4);
Con5.. x3 + x4 =G= 0.25*(x1 + x2 + x3 + x4);
Con6.. 50000*x1 + 70000*x2 + 130000*x3 + 160000*x4 + 2000*x5 =L= 15000000;
Obj.. 1000*x1 + 1900*x2 + 2700*x3 + 3400*x4 =E= z;

Model homework1_1/All/ ;

Solve homework1_1 using LP maximizing z;

Display x1.L , x2.L , x3.L , x4.L , x5.L , z.L;
