//A quick test for a polulu extended micro metal gear bracket.

bolt_diameter = 2.4384; // #2-56 http://en.wikipedia.org/wiki/List_of_drill_and_tap_sizes
hole_seperation = 18; // http://www.pololu.com/picture/view/0J798

wing_width = 5.8;
wing_depth = 8.5;
wing_height = 4;

cage_width = 15;
cage_depth = 17.3;
cage_height = 11.5;

module mmgb_holes(){
	cylinder(r=bolt_diameter/2, h=wing_height);
	translate([hole_seperation,0,0]) cylinder(r=bolt_diameter/2, h=wing_height);
}

//mmgb_holes();