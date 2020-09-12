$fn=32;
//w=47.0;
// By math this is 54, but need some clearance  
w=53.2;
tw=26;
th=17;
tabh=5;
h=12;
touchw = 18;
touchhole=2;

attachthick=3;
attachdepth=10;
attachheight=25;
slotr=1.8;
slotl=14;
module slot(r,l) {
 hull() {
        translate([-.1,0,0]) 
   rotate([0,90,0])
    cylinder(r=r,h=5);
        translate([-.1,0,l]) 
   rotate([0,90,0])
    cylinder(r=r,h=5);
    };
};
    
difference() {
    union() {cube([w,2,h]);
cube([w,4,3]);
translate([(w/2)-(tw/2),0,0]) 
  cube([tw,th,tabh]);
  
translate([0,0,0]) 
   cube([attachthick,attachdepth,attachheight]);
translate([w-attachthick,0,0]) 
   cube([attachthick,attachdepth,attachheight]);
    };
    translate([(w/2)-(touchw/2),1+th/2,-0.1]) 
      cylinder(r=touchhole, h=tabh+0.2);
    translate([(w/2)+(touchw/2),1+th/2,-0.1]) 
      cylinder(r=touchhole, h=tabh+0.2);
    translate([(w/2),1+th/2,-0.1]) 
      cylinder(r=touchhole, h=tabh+0.2);
 // slots
        translate([-.1,5,6]) 
                slot(slotr,slotl);
 //       translate([-.1,14,4]) 
 //               slot(slotr,slotl);
        translate([w-attachthick-.1,5,6]) 
                slot(slotr,slotl);
 //       translate([w-attachthick-.1,14,4]) 
 //               slot(slotr,slotl);
    
    
};