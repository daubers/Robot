board_depth=15;
board_length=20;
board_height=1;

height_to_board=5;

module standoff(){
	cube([board_length,10,board_height]);
	translate([board_length+0.5, 5,(height_to_board+board_height*2)/2]) cube([2,10,height_to_board+board_height*2], center=true);
	translate([-0.5, 5,(height_to_board+board_height*2)/2]) cube([2,10,height_to_board+board_height*2], center=true);
}

difference(){
	standoff();
	translate([0,0,(height_to_board+board_height/2)]) cube([board_length,board_depth,board_height]);
}