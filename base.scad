include <arduino.scad>
include <PololuMicroMetalGearmotorBracketExtended.scad>

robot_diameter=300; // diameter of robot in mm
acrylic_depth=8;

wheel_width=19; // http://skpang.co.uk/catalog/pololu-wheel-42x19mm-pair-p-463.html
wheel_diameter=42;
wheel_w_clearence=5;
wheel_d_clearence=5;


//standoffs(MEGA2560, mountType=PIN);
//holePlacement(boardType=MEGA2560)
//				cylinder(r = mountingHoleRadius + 1.5, h = 10, $fn = 32);

module WheelWell(h=16){
	cube([wheel_width+wheel_w_clearence,wheel_diameter+wheel_d_clearence,h], center=true);
}


difference(){
	cylinder(r=robot_diameter/2, h=acrylic_depth, $fn=100);
	holePlacement(boardType=MEGA2560)
					cylinder(r = mountingHoleRadius + 1.5, h = 10, $fn = 32);
	translate([(robot_diameter/2)-(robot_diameter/4/2),0,0]) WheelWell();
	translate([-1*((robot_diameter/2)-(robot_diameter/4/2)),0,0]) WheelWell();
}