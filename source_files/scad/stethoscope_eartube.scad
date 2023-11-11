/*
  The eartube is made of combination of spheres of 7mm diameter combined together to form its shape.
  The positioning of the spheres is taken by making array of x axis positions and array of y axis positions.
  The earbud area is different from the rest of the eartube body so it was made in different way. It is shaped and rotated to be in the right direction to snap fit standard earbuds.
  The inner hole in the eartube which should deliver the "sound" is made also from spheres but with 4mm  diameter with the same positioning of the outer shell spheres.
  The start and the end of the eartube have  mouse ears to prevent the eartube from warping during the printing process which can be removed easily by a sharp blade.
*/

/////////////////////////////////////////////////////////////
// Arrays for the X and Y positions of the spheres that make up the eartube

xarray=[-6,0,36.5,42.19,79.92,99.81,148.63,150,153.73,154.75,155.89,157.91,159.74,161.04,162.34,163.4,163.94,164.37,165.09,165.65,166.29,167.14,167.73,168.32,168.81,169.17,169.35,169.3,168.9,168.47,167.83,167.32];

yarray=[0,0,0,0.85,7.29,14.11,29.85,30.29,32.11,32.6,33.41,34.83,36.42,37.46,38.68,40.03,41.05,41.71,43.01,44.01,45.19,46.74,48.18,49.63,51.78,53.91,56.05,59.24,61.43,63.81,66.11,67.92];

// How much the earbud is rotated downward
earbud_rotation = -70;

// Width of piece connecting eartube to mouse ears for printing stability
mouse_ear_connector_width = 2;


//This difference function cuts inside the eartube body
difference(){
    // This union constucts the eartube body outer shell, which is made in two steps:
    //   1. Make the spheres to build most of its body; and
    //   2. The earbud tip at the end

    union(){
        // This difference function cuts the cylindrical insert of the earbud to snap in the eartube
        difference(){
            union(){
                // Build the shape of the outer shell of the ear tube up to the ear bud area
                // This uses the above array to create all segments
                for(i=[3:1:30]){
                    
                    //Combine eartube spheres to shape the body
                    hull(){
                        translate([xarray[i],yarray[i],0])sphere(3.5,$fn=10);
                        translate([xarray[i+1],yarray[i+1],0])sphere(3.5,$fn=10);
                    }
                }
                
                // Build the eartube base, which will be a stretched/elliptical cylinder to fit as a key in the ear tube spring. This will reduce the need for directional calibration in the assembly process.
                hull(){
                    //To create a taper, decrease the sphere size and reduce Z by the same amount so it remains on the plate. For example, to taper by 1mm, do:
                    // translate([xarray[1],yarray[1],-1])scale([1,1.2,1])sphere(2.5,$fn=10);
                    translate([xarray[1],yarray[1],0])scale([1,1.2,1])sphere(3.5,$fn=10);
                    translate([xarray[2],yarray[2],0])scale([1,1.2,1])sphere(3.5,$fn=10);
                }
                
                // Join the stretched cylinder to the rest of the eartube body without a noticable bump
                hull(){
                    translate([xarray[2],yarray[2],0])
                     scale([1,1.2,1]) sphere(3.5,$fn=10);
                    translate([xarray[4],yarray[4],0])
                     sphere(3.5,$fn=10);
                }
            }

        translate([xarray[30]-2,yarray[30]+6.5,0])
            rotate([0,90,earbud_rotation])cylinder(r=6,h=9.5);//earbud -- fixed a typo on translate arguments
        }
        
        // Add earbud connector piece
        // Build the earbud area
        translate([xarray[30]-0.4,yarray[30]+0.5,0])
         rotate([0,90,earbud_rotation])
         cylinder(r=1,h=1);
    
        translate([xarray[30]-0.4,yarray[30]+0.5,0])
         rotate([0,90,earbud_rotation]) rotate([0,0,18]) cylinder(r=3.5,h=1.5);
        
        // Build earbud snap fit cylinder joint
        translate([xarray[30]-0.4,yarray[30]+0.5,0])
         rotate([0,90,earbud_rotation]) cylinder(r=2,h=3.5);
    }
    
    union(){
        // Build the hole of the tube from the [0,0] until the earbud area

        // If tapered, point down the hollow part for the tapered part of the eartube like so:
        /*
        hull(){
            translate([xarray[0],yarray[0],-1])
                 sphere(2,$fn=10);
            translate([xarray[1],yarray[1],-1])
                 sphere(2,$fn=10);
            translate([xarray[2],yarray[2],0])
                 sphere(2,$fn=10);
        }
        */
        
        //If there is a taper, then start at part 2 of the array. Otherwise, start at 0

            for(i=[0:1:27]){
                hull(){
                translate([xarray[i],yarray[i],0])
                 sphere(2,$fn=10);
                translate([xarray[i+1],yarray[i+1],0])
                 sphere(2,$fn=10);
            }
        }
    
        // Build the shape of the hole of the tube at the earbud connector
        translate([xarray[30]-0.4,yarray[30]+0.5,0])
         rotate([0,90,earbud_rotation])cylinder(r=1.2,h=4.5,$fn=360);
    }
}

        //This creates the bottom mouse ear of the tube for added printing ease
        translate([-5,-mouse_ear_connector_width/2,-3.33])
        cube([10,mouse_ear_connector_width,0.2]);
        translate([-3,0,-3.33]) difference(){
            cylinder(r=5,h=.5);
            translate([0,-6,0]) cube([12,12,1]);
        }
        
        //Earbud mouse ear
        translate([xarray[30]-0.4,yarray[30]+0.5,0])
         rotate([0,0,earbud_rotation])
         translate([0,0,-3.33]) {
             translate([-2.5,0,0]) difference(){
                 cylinder(r=5,h=.5);
                 translate([0,-6,0]) cube([12,12,1]);
             }
             translate([-5,-mouse_ear_connector_width/2,0]) cube([5,mouse_ear_connector_width,.2]);
         }
         
         // Add stop so that people don't push the eartube too far
         translate([35.5,-1,3]) cube([2,2,2]);
