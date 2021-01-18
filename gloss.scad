sled_thickness = 25; // Thickness of the raised edge where the holes are
sled_diameter = 100;

hole_diameter = 6; // bolt hole diameter
bolthead_d = 12; // bolt head countersink diameter
bolthead_h = 2; // bolt head height (for countersink depth)
radius_to_hole = 50; // Distance from center to the center of the mounting holes
downangle = 32; // Angle in degrees cameras face downward
cord_hole_length = 20;
cord_hole_width = 10;
cord_hole_offset = 20;

// Alignment indent in edge
// picam base width is 13.5
picam_base_width = 14.1375;
// picam base thickness is 11.5, optimum size is
// 12.1375, but we want to give a little space for
// bad drilling and it's better to index against
// the side
picam_base_thickness = 12.2;
indent_depth = 2;
offset_of_hole = 0; // If the mounting bolt hole isn't centered you can adjust it
taper1 = 2;
taper2 = 5;
module edge_taper(){
    cylinder(h=5,r1=taper1, r2=0, $fn=48);
    rotate([0,180,0]){cylinder(h=5,r1=taper1);}
}

minkowski(){
    cylinder(h=sled_thickness,r=sled_diameter/2, $fn=60);
    translate([0,0,5]){
        edge_taper();
    }
}