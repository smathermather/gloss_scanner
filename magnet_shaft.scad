print_adjustment = 0.22;
mm_multiplier = 25.4;

handle_major_diameter = 17.8;
handle_minor_diameter1 = 16.5;
handle_length = 110;
ferrule_height = 8;
ferrule_diameter = 14;
rod_diameter = 1/4 * mm_multiplier + print_adjustment;
rod_length = 1 * mm_multiplier + print_adjustment;
rod_finetune = 5;

difference(){
    hull(){
        translate([0,0,handle_length / 2]){
            sphere(handle_major_diameter/2, $fn = 8);
        }
        translate([0,0,handle_length]){
            sphere(handle_minor_diameter1/2, $fn = 8);
        }
        translate([0,0,0]){
            sphere(handle_minor_diameter1/2, $fn = 8);
        }
    }
    translate([0,0,handle_length - rod_length / 2 - rod_finetune]){
        #cylinder( r = rod_diameter / 2, h = rod_length, $fn = 32);
    }
}