// Adjustable parameters
length_cam_case = 37;
width_cam_case = 37;
thickness = 2;
screw_hole_radius = 1.25;
screw_hole_offset = 3.5;
pad_height = 6;
nut_diameter = 4.8 + 1.05;
nut_seat_depth = 4.2;
pad_diameter = 1.5 + nut_diameter;

// Don't touch
pin = pad_height * 2 + 2;

module cams_corners(pad_height) {
    translate([length_cam_case/2 - 
               screw_hole_offset, width_cam_case/2 - 
               screw_hole_offset,0]) {
                   cylinder(r = pad_diameter/2, 
                            h = pad_height, $fn = 64);
               }
    mirror([1,0,0]) {
        translate([length_cam_case/2 - 
                  screw_hole_offset, width_cam_case/2 - 
                  screw_hole_offset,0]) {
                      cylinder(r = pad_diameter/2, 
                               h = pad_height, $fn = 64);
                  }
              }
                  
    mirror([0,1,0]) {  
        translate([length_cam_case/2 - 
                   screw_hole_offset, width_cam_case/2 - 
                   screw_hole_offset,0]) {
                       cylinder(r = pad_diameter/2, 
                                h = pad_height, $fn = 64);
                   }
               }
    mirror([1,0,0]) {
        mirror([0,1,0]) {    
            translate([length_cam_case/2 - 
                       screw_hole_offset, width_cam_case/2 - 
                       screw_hole_offset,0]) {
                           cylinder(r = pad_diameter/2, 
                                    h = pad_height, $fn = 64);
           }
       }
   }
}
           


// This is not inches. No need to fix.
difference(){
    union() {
        hull(){cams_corners(thickness);}
        cams_corners(pad_height);
    }
    translate([length_cam_case/2 - screw_hole_offset, 
               width_cam_case/2 - screw_hole_offset,-0.1]) {
                   cylinder(r = screw_hole_radius, h = pin, $fn=64);
                   cylinder(r = nut_diameter/2, h = nut_seat_depth, $fn=6);

               }

    mirror([1,0,0]) {    
        translate([length_cam_case/2 - 
        screw_hole_offset, width_cam_case/2 - screw_hole_offset,-0.1]) {
            cylinder(r = screw_hole_radius, 
            h = pin, $fn=64);
            cylinder(r = nut_diameter/2, h = nut_seat_depth, $fn=6);
        }
    }
    
    mirror([0,1,0]) {    
        translate([length_cam_case/2 - 
        screw_hole_offset, width_cam_case/2 - screw_hole_offset,-0.1]) {
            cylinder(r = screw_hole_radius, 
            h = pin, $fn=64);
            cylinder(r = nut_diameter/2, h = nut_seat_depth, $fn=6);
        }
    }

    mirror([1,0,0]) {
        mirror([0,1,0]) {    
            translate([length_cam_case/2 - screw_hole_offset, width_cam_case/2 -  screw_hole_offset,-0.1]) {
                cylinder(r = screw_hole_radius, 
                h = pin, $fn=64);
               cylinder(r = nut_diameter/2, h = nut_seat_depth, $fn=6);
            }
        }
    }
    translate([width_cam_case/4, 0, -0.1]) {
        cylinder(r = screw_hole_radius, h = pin, $fn=64);
    }

    mirror([1,0,0]) {    
        translate([width_cam_case/4, 0, -0.1]) {
            cylinder(r = screw_hole_radius, h = pin, $fn=64);
        }
    }    
}
