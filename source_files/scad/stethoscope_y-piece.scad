$fs=0.2;

// Create outer shell
module shell(){
	for(i=[-20,20])rotate([0,0,i]){
        
        // Create "Y" triangular/connecting piece
		hull(){
			sphere(6/2,$fn=30);
			translate([15,0,0])sphere(6/2,$fn=36);
		}
        
        // Create "Y" arms
        hull(){
			translate([15,0,0])sphere(6/2,$fn=36);
			translate([35,0,0])sphere(6/2,$fn=36);
		}
	}
    
    // Create base of "Y"
	translate([-17,0,0])rotate([0,90,0])cylinder(r=6/2,h=34,$fn=36,center=true);
	translate([-34,0,0]) sphere(6/2,$fn=36);

	// extra reinforcement
	hull() {
	  translate([0,-2,0]) rotate([0,0,-10]) translate([2,0,0]) rotate([0,90,0]) cylinder(d=6,h=28,$fn=36,center=true);
	  translate([0,2,0]) rotate([0,0,10]) translate([2,0,0]) rotate([0,90,0]) cylinder(d=6,h=28,$fn=36,center=true);
	}
}

// Create hollow channel within shell
module channel(){
	for(i=[-20,20])rotate([0,0,i])
	  rotate([0,90,0]) cylinder(d=4,h=45,$fn=36);
    
    // Hollow out base cylinder
	translate([-20,0,0])rotate([0,90,0])cylinder(d=4,h=42,$fn=36,center=true);
}


// Create final Y-Piece with differences between channel and shell
difference() {
    shell();
    channel();

	translate([17.55,0,0]) rotate_extrude() difference() {
		translate([0,-3.01,0]) square([6.2,6.02]);
		translate([6.1,0,0]) circle(d=6.2,$fn=36);
	}
}

// mouse ears
for (i=[-20,20]) rotate([0,0,i]) {
	translate([35,-0.8,-3])cube([5,1.6,0.5]);
	translate([42,0,-3]) cylinder(r=5,h=0.5);
}

translate([-35-4,-0.8,-3]) cube([5,1.6,0.5]);
translate([-42,0,-3]) cylinder(r=5,h=0.5);

