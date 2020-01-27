$fn=32;
w=49.0;
tw=26;
th=13;
h=10;
touchw = 18;
touchhole=2;

attachthick=3;
attachdepth=19;
attachheight=21;
slotr=2;
slotl=12;
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
translate([(w/2)-(tw/2),-th,0]) 
  cube([tw,th,3]);
  
translate([0,0,0]) 
   cube([attachthick,attachdepth,attachheight]);
translate([w-attachthick,0,0]) 
   cube([attachthick,attachdepth,attachheight]);
    };
    translate([(w/2)-(touchw/2),-th/2,-0.1]) 
      cylinder(r=touchhole, h=3.2);
    translate([(w/2)+(touchw/2),-th/2,-0.1]) 
      cylinder(r=touchhole, h=3.2);
    translate([(w/2),-th/2,-0.1]) 
      cylinder(r=touchhole, h=3.2);
 // slots
        translate([-.1,7,4]) 
                slot(slotr,slotl);
        translate([-.1,14,4]) 
                slot(slotr,slotl);
        translate([w-attachthick-.1,7,4]) 
                slot(slotr,slotl);
        translate([w-attachthick-.1,14,4]) 
                slot(slotr,slotl);
    
    
};