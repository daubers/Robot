include <arduino.scad>
include <PololuMicroMetalGearmotorBracketExtended.scad>

robot_diameter=300; // diameter of robot in mm
acrylic_depth=8;



//standoffs(MEGA2560, mountType=PIN);
//holePlacement(boardType=MEGA2560)
//				cylinder(r = mountingHoleRadius + 1.5, h = 10, $fn = 32);

difference(){
cylinder(r=robot_diameter/2, h=acrylic_depth, $fn=100);
holePlacement(boardType=MEGA2560)
				cylinder(r = mountingHoleRadius + 1.5, h = 10, $fn = 32);
}