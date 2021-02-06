print_adjustment = 0.22;
mm_multiplier = 25.4;
magnet_holder_diameter = 7/8 * mm_multiplier;
big_magnet_diameter = 1/2 * mm_multiplier + print_adjustment;
big_magnet_thickness = 1/8 * mm_multiplier + print_adjustment;
small_magnet_diameter = 3/8 * mm_multiplier + print_adjustment;
pad_height = big_magnet_thickness + 1/10 * mm_multiplier + print_adjustment;


difference(){
    cylinder( r = magnet_holder_diameter/2, h = pad_height, $fn = 64);

    cylinder( r = big_magnet_diameter/2, h = big_magnet_thickness, $fn = 64);

    translate([0,0,big_magnet_thickness]){
        cylinder( r = small_magnet_diameter/2, h = big_magnet_thickness, $fn = 64);
    }
}