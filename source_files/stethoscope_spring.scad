ro=20;

// Create the spring
difference(){
    difference(){
        cylinder(r=ro,h=10,$fn=60);//outer diameter
        cylinder(r=ro-2,h=10,$fn=60);//inner diameter
    }
    translate([-45,0,0])cube([90,45,10]);//cut
}

translate([ro-2,0,0])hole();
translate([-ro-10,0,0])hole();

//making a cube with tube hole
module hole(){
    translate([0,10,0])difference(){
        cube([12,10,10]); //tube housing outer shell
        translate([6,0,5])rotate([-90,15,0])cylinder(r=3.7,h=11,$fn=6);//ear tube diameter
        }
 }

translate([ro-2,0,0])cube([2,10,10]);
translate([-ro,0,0])cube([2,10,10]);