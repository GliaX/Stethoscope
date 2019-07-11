
spring_radius = 20; // Radius of spring
eartube_rotation = 5; // Rotation of eartube in spring


// Create the first leaf (outside) of the spring

module outerSpring() {
    difference(){
        cylinder(r=spring_radius+1,h=10,$fn=60); //outer diameter
        cylinder(r=spring_radius-2,h=10,$fn=60); //inner diameter
    }
}

// Create the second leaf (inside) of the spring
module innerSpring() {
    translate([0,8,0]) 
    difference(){
        cylinder(r=spring_radius+2,h=10,$fn=60); //outer diameter
        cylinder(r=spring_radius,h=10,$fn=60); //inner diameter
    }
}


// Create connector and hole for eartube.

module hole($rotate){
    radius = 7;
    difference() {
        hull(){
            translate([-radius,-radius,0]) cube([2,10,20]);
            translate([-radius,-radius,0]) cube([12,2,12]);
            translate([1,.2,0])scale([1.2,1.05,1])//thicker wall
            cylinder(r=radius,h=12);
        }
        translate([1,0,0]) rotate([0,0,$rotate]) union(){hull(){
        translate([0,0,-10])scale([1.2,1,1])sphere(3.7,$fn=10);//ear tube diameter
    translate([0,0,30])scale([1.2,1,1])sphere(3.7,$fn=10);
       }//ear tube diameter
       
      // translate([-.6,-1.2-3.5,0])cube([1.2,1.2,3]);//key pitch
   }
    }
 }
 
 
// Create the final piece

    difference(){

        // Springs
        union() {
            outerSpring();
//            innerSpring();
       // cube(1);
            }
        union(){
        // Cuts
        translate([-45,0,0])cube([90,45,10]); //cut centre
        translate([spring_radius+1,-spring_radius,0])cube([90,45,10]); //cut left
        translate([-spring_radius-90-1,-spring_radius,0])cube([90,45,10]); //cut right
    }
}

    // Connectors
    translate([spring_radius+10.5,30,7]) rotate([90,0,-10]) hole(eartube_rotation);
    translate([-spring_radius-10.5,30,7]) mirror([1,0,0]) rotate([90,0,-10]) hole(eartube_rotation);
    
    //Connect connectors to springs
    translate([spring_radius-2,-0.5,0])rotate([0,0,-10]) cube([3,20,10]);
    translate([-spring_radius-1,-0.5,0])rotate([0,0,10]) cube([3,20,10]);