// Create outer shell
module shell(){
	for(i=[-20,20])rotate([0,0,i]){
        
        // Create "Y" triangular/connecting piece
		hull(){
			sphere(9/2,$fn=30);
			translate([15,0,-1.5])sphere(6/2,$fn=30);
		}
        
        // Create "Y" arms
        hull(){
			translate([15,0,-1.5])sphere(6/2,$fn=30);
			translate([35,0,-1.5])sphere(6/2,$fn=30);
		}
	}
    
    // Create base of "Y"
	translate([-17.5,0,0])rotate([0,90,0])cylinder(r=9/2,h=35,$fn=30,center=true);
}

// Create hollow channel within shell
module channel(){
	for(i=[-20,20])rotate([0,0,i]){

       // Hollow out base of Y connecting piece
		hull(){
			sphere(6.5/2,$fn=30);
			translate([10,0,-1.5])sphere(4/2,$fn=30);
		}

       // Hollow out ends of Y connecting piece
		hull(){
			translate([10,0,-1.5])sphere(4/2,$fn=30);
			translate([20,0,-1.5])sphere(3.5/2,$fn=30);
		}

       // Hollow out arms of Y
      	hull(){
			translate([20,0,-1.5])sphere(3.5/2,$fn=30);
			translate([50,0,-1.5])sphere(3.5/2,$fn=30);
		}
	}
    
    // Hollow out base cylinder
	translate([-17.5,0,0])rotate([0,90,0])cylinder(r=6.5/2,h=35,$fn=30,center=true);
}


// Create final Y-Piece with differences between channel and shell
difference(){
    shell();
    channel();
}