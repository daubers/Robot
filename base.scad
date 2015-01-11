include <arduino.scad>
include <PololuMicroMetalGearmotorBracketExtended.scad>
include <MotorDriverCarrier.scad>

robot_diameter=200; // diameter of robot in mm
acrylic_depth=3;

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
	translate([wheel_width/2+wheel_w_clearence/2+wheel_to_mount,-1*hole_seperation/2,0]){
		rotate([0,0,90]) mmgb_holes(height=acrylic_depth);
	}
}

module base_plate(){
	difference(){
		cylinder(r=robot_diameter/2, h=acrylic_depth, $fn=100);
		translate([-1*robot_diameter/8,-1*(robot_diameter/2)+10,0]) holePlacement(boardType=UNO)
					cylinder(r = 1, h = 10, $fn = 32);
		translate([(robot_diameter/2)-(robot_diameter/4/2),0,0]) rotate([0,0,180]) WheelWell();
		translate([-1*((robot_diameter/2)-(robot_diameter/4/2)),0,0]) WheelWell();
	
		rotate([0,0,45]) translate([(robot_diameter/2)-(robot_diameter/8),0,0]) cylinder(r=1, h=30, $fn = 32);
		rotate([0,0,45+90]) translate([(robot_diameter/2)-(robot_diameter/8),0,0]) cylinder(r=1, h=30, $fn = 32);
		rotate([0,0,45 + 180]) translate([(robot_diameter/2)-(robot_diameter/8),0,0]) cylinder(r=1, h=30, $fn = 32);
		rotate([0,0,45+270]) translate([(robot_diameter/2)-(robot_diameter/8),0,0]) cylinder(r=1, h=30, $fn = 32);

	}
}
//translate([0,0,acrylic_depth]) color([1,0,0]) board_carrier();

module top_plate() {
	difference(){
		cylinder(r=robot_diameter/2, h=acrylic_depth, $fn=100);
		rotate([0,0,45]) translate([(robot_diameter/2)-(robot_diameter/8),0,0]) cylinder(r=1, h=30, $fn = 32);
		rotate([0,0,45+90]) translate([(robot_diameter/2)-(robot_diameter/8),0,0]) cylinder(r=1, h=30, $fn = 32);
		rotate([0,0,45 + 180]) translate([(robot_diameter/2)-(robot_diameter/8),0,0]) cylinder(r=1, h=30, $fn = 32);
		rotate([0,0,45+270]) translate([(robot_diameter/2)-(robot_diameter/8),0,0]) cylinder(r=1, h=30, $fn = 32);
	}
}

//projection(cut=true) base_plate();
//translate([0,0,20]) top_plate();
projection(cut=true) top_plate();