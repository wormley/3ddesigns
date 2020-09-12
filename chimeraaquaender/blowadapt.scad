$fn=30;
r1=7.6/2;
r2=8.45/2;
h2=20;
rinner=6.5/2;
rotate([90,0,0])
difference() { 
    union() {
    translate([0.1,0,1.25]) cube([39.8,10,1.8]);
    hull() {
    translate([5.5,0,0]) cube([29,10,9.6]);
        translate([20,h2,5]) rotate([-90,0,0]) cylinder(r=5,h=2);

//    translate([20,30,5]) sphere(r=5);
    };
        translate([20,h2-5,5]) rotate([-90,0,0]) cylinder(r=r1,h=15);
        translate([20,h2+7,5]) rotate([-90,0,0]) cylinder(r1=r2,r2=r1,h=3);
        };
    translate([2.5,2.5,-.1]) cylinder(r=1.4,h=10);
    translate([40-2.5,2.5,-.1]) cylinder(r=1.4,h=10);
    hull () {
        translate([6.25,-1,0.85]) cube([27.5,8,7.7]);
        translate([20,h2,5]) sphere(r=3);
    };
        translate([20,20,5]) rotate([-90,0,0]) cylinder(r=rinner,h=35);
};


