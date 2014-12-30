include <arduino.scad>
include <PololuMicroMetalGearmotorBracketExtended.scad>
include <MotorDriverCarrier.scad>

robot_diameter=200; // diameter of robot in mm
acrylic_depth=8;

wheel_width=19; // http://skpang.co.uk/catalog/pololu-wheel-42x19mm-pair-p-463.html
wheel_diameter=42;
wheel_w_clearence=5;
wheel_d_clearence=5;
wheel_to_mount=6;

//standoffs(MEGA2560, mountType=PIN);
//holePlacement(boardType=MEGA2560)
//				cylinder(r = mountingHoleRadius + 1.5, h = 10, $fn = 32);

module WheelWell(h=16){
	cube([wheel_width+wheel_w_clearence,wheel_diameter+wheel_d_clearence,h], center=true);
	translate([0,wheel_diameter+wheel_d_clearence/2,0]){
		mmgb_holes(height=acrylic_depth);
	}
}


difference(){
	cylinder(r=robot_diameter/2, h=acrylic_depth, $fn=100);
	translate([-1*robot_diameter/8,-1*(robot_diameter/2)+10,0]) holePlacement(boardType=MEGA2560)
					cylinder(r = mountingHoleRadius + 1.5, h = 10, $fn = 32);
	translate([(robot_diameter/2)-(robot_diameter/4/2),0,0]) WheelWell();
	translate([-1*((robot_diameter/2)-(robot_diameter/4/2)),0,0]) WheelWell();
	
	
}
translate([0,0,acrylic_depth]) board_carrier();