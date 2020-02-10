draft=0;
$fn=30;
closem3=1.675;
normalm3=1.7;
loosem3=2;
eart=3.5;
// bighead 9.50
//little spacer 4.88
//18.85 outside
//9.30 inside
// 16.58 11.46
// bot spacer top screw
// 19.64 
// right to screw 11.45
// screw to screw 49.24
// inside 30.57
//  Head Diameter: 5.8mm; Head Height: 2.2mm; Thread Pitch: 0.5mm; Thread Dia. : 3mm 
cmounts= [[ 60,25],[60,39]];
carriage = [[47.5,35.25],[47.5,35.25-39.9]];
carriager= 6;
module ear(right=false) {
    earz1=40+5;
    earz2=15+23+5;
    difference() {
        union() {hull() {
       cube([19,eart,5]);
       translate([5,0,earz1])
           rotate([-90,0,0]) cylinder(r=5,h=eart);
       translate([5+9,0,earz1])
           rotate([-90,0,0]) cylinder(r=5,h=eart);

    }
    hull() {
       if (right) {cube([19,eart+4,5]);} else
       translate([0,-4,0])cube([19,eart+4,5]);
       translate([0,0,8])
         cube([19,eart,1]);

    }
}

   hull(){ translate([6,-.1,12]) rotate([-90,0,0]) cylinder(r=normalm3,h=6);
    translate([6,-.1,earz2]) rotate([-90,0,0]) cylinder(r=normalm3,h=6);
   }
   hull(){ translate([4.5+9,-.1,12]) rotate([-90,0,0]) cylinder(r=normalm3,h=6);
    translate([4.5+9,-.1,earz2]) rotate([-90,0,0]) cylinder(r=normalm3,h=6);
   };
hull() {   translate([15.25,-.1,16]) rotate([-90,0,0]) cylinder(r=normalm3,h=6);
   translate([15.25,-.1,17]) rotate([-90,0,0]) cylinder(r=normalm3,h=6);
}
    };
}
module motorhole(mr=12,h=4){
      rotate([-90,0,0])
        cylinder(r=mr,h=h,$fn=30);
}
module motortab(depth=15){
hull() {    translate([0,0,0])
      rotate([0,90,0])
      cylinder(r=3,h=3);
    translate([0,0,40])
      rotate([0,90,0])
      cylinder(r=3,h=3);
    translate([0,-depth,0])
      rotate([0,90,0])
      cylinder(r=3,h=3);
}
}
    pw=50;
    ph=42;

module motorholes(h=3) {
    translate([pw/2,-.1,6.5+15.5])
        motorhole(mr=12,h=h+1);
    translate([pw/2-15.5,-.1,6.5])
        motorhole(mr=loosem3,h=h+1);
    translate([pw/2+15.5,-.1,6.5])
        motorhole(mr=loosem3,h=h+1);
    translate([pw/2-15.5,-.1,6.5+31])
        motorhole(mr=loosem3,h=h+1);
    translate([pw/2+15.5,-.1,6.5+31])
        motorhole(mr=loosem3,h=h+1);
};
module motormount(h=3,holeonly=false) {
   translate([-pw/2,0,0])
    if (! holeonly)     difference() {union() {cube([pw,h,43]);
    }
        motorholes(h);
    } else {
        motorholes(h);

}
}
module mounthole(ch,cw,h1,h2,r1,r2) {
translate([ch+5,cw-4.5,h2]) cylinder(h=h1,r1=r1,r2=r2);
translate([ch+5,cw+4.5,h2]) cylinder(h=h1,r1=r1,r2=r2);
translate([ch-5,cw+4.5,h2]) cylinder(h=h1,r1=r1,r2=r2);
translate([ch-5,cw-4.5,h2]) cylinder(h=h1,r1=r1,r2=r2);
}
plateh=7;
hotendcentery=32;
mcx = 0;
// Titan offset from center 11.1
// Chimera +10 -10 from centerline
// Titan 13.5 from base
// Chimera 6mm
// baseplate 7mm
// extruder base 3.5mm  
// need delta of 3.5mm
// hotend base 4mm
// 
// Chimera 6+7+4 = 17.0
// Extruder 3.5+13.5 1
mcy = hotendcentery-11.1-10;
difference() {union() {
difference() {union() {//cube([80,64,3]);
    $fn=20;
   hull(){
    translate([45+32,62,0]) cylinder(r=2,h=plateh);
    translate([45,62,0]) cylinder(r=2,h=plateh);
    translate([45+32,-4,0]) cylinder(r=2,h=plateh);
    translate([-5+32,-10+40,0]) cylinder(r=2,h=plateh);
    translate([-27,-18,0]) cylinder(r=2,h=plateh);
    translate([-27,40,0]) cylinder(r=2,h=plateh);
    translate([50,-18,0]) cylinder(r=2,h=plateh);
       }
       
    translate([56,5,0]) ear();
    translate([56,64-5-eart,0]) ear(right=true);
}
// Extruder cutout
//translate([mcx-50/2,mfy+3.01,3]) cube([50,130,5]);
//translate([mcx-50/2,mfy+15,3]) cube([57,130,5]);
    translate([mcx-25+3,mcy,0]) rotate([90,0,90]) motormount(h=6,holeonly=true);
    translate([mcx-(50/2),mcy-(54/2),3.5]) cube([50,54,5]);

//translate([mcx-50/2,mfy+5+3.1,-.1]) cube([25,30,5.2]);
// Mouting holes and countersink
for (i=cmounts) {
translate([i[0],i[1],-.1]) cylinder(h=10,r=2.85);
translate([i[0],i[1],4.7]) cylinder(h=10,r=4.2);
}
// Clear holes for carriage bolts
for (i=carriage) {
translate([i[0],i[1],-.1]) cylinder(h=10,r=carriager);
translate([i[0],i[1],10]) sphere(r=carriager);
};
// other mount holes
translate([60-10.55,25-10.9,-.1]) cylinder(h=10,r=2.2);
translate([60-10.5+19.25,25-10.9-17.75,-.1]) cylinder(h=10,r=2.2);
translate([4,45,-.1]) cylinder(h=10,r=loosem3);
translate([18,45,-.1]) cylinder(h=10,r=loosem3);


// Holes to mount the hotend mount
translate([79-25/2,32-19,-.1]) cylinder(h=10,r=closem3);
translate([79-25/2,32+19,-.1]) cylinder(h=10,r=closem3);
translate([79-25/2,32-19,-.1]) cylinder(h=3,r=3.375,$fn=6);
translate([79-25/2,32+19,-.1]) cylinder(h=3,r=3.375,$fn=6);

};

// 10.5+9+10.5 w
// 25h
chh=23/2;
cww=46/2;
hsw=10.5+9+10.5;
hsh=23;
translate([-60,8,0])
//translate([80-25,9,10])
difference() {union() {
// main
    translate([0,0.5,0]) cube([23,45,3]);
// hotend platform
translate([chh-(hsh/2) , cww - (hsw/2),0]) 
    cube([hsh,hsw,4.0]);
// Tab
    translate([-10,0.5,0]) cube([12,14,3]);
    
}
mounthole(5+9.5,cww,7,-.1,closem3,closem3);
mounthole(5+9.5,cww,2.45,-.1,3.35,closem3);
translate([chh,cww-19,-.1]) cylinder(h=10,r=closem3);
translate([chh,cww+19,-.1]) cylinder(h=10,r=closem3);
//translate([60-10.55,25-10.9,-.1]) cylinder(h=10,r=2.2);
translate([5-10.55,16-10.9,-.1]) cylinder(h=10,r=2.2);

};
};
if (draft == 1 ) {
    translate([-40,-40,2]) cube([200,200,100]);
    translate([-40,-40,-1]) cube([70,150,10]);
};
if (draft == 2 ) {
    translate([-31,-40,-1]) cube([200,200,100]);
};
};


// 11.1 from center
// center is 5.5+15.5+2 from base
// 11.9 from base net
// 6 from base chimera
// net thickness 5.9