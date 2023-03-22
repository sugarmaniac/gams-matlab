SETS I   /1*5/;

Integer Variable x(I) ;
Free Variable z;

Equations
Con1,
Con2,
Con3,                                                 
Con4,
Con5,
Con6,
Obj,
Con7(I);

Con1.. x('5') =L= 300;
Con2.. 0.18*x('1') + 0.28*x('2') + 0.4*x('3') + 0.5*x('4') =L= 0.2125*x('5');
Con3.. x('1') =G= 0.2*sum(I$(ord(I)<>5),x(I));
Con4.. x('2') =G= 0.1*sum(I$(ord(I)<5),x(I));
Con5.. x('3') + x('4') =G= 0.25*sum(I$(ord(I)<>5),x(I));
Con6.. 50000*x('1') + 70000*x('2') + 130000*x('3') + 160000*x('4') + 2000*x('5') =L= 15000000;
Obj.. 1000*x('1') + 1900*x('2') + 2700*x('3') + 3400*x('4') =E= z;
Con7(I).. x(I) =G= 0;


Model homework1_1/All/ ;

Solve homework1_1 using mip maximizing z;

Display x.L , z.L;
