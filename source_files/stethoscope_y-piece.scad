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






////////////////////////////////////////
//mouse ear
	//translate([35,0,-1.5])cylinder(r=2,h=10);
for(i=[-20,20])rotate([0,0,i]){
translate([35,-1,-4.5])cube([5,2,.2]);
translate([35+2,0,-4.5])difference(){
    cylinder(r=5,h=.5);
    translate([-12,-6,0])cube([12,12,1]);
}

}




translate([-35-4,-1,-4.4])cube([5,2,.2]);
translate([-35-.5,0,-4.4])difference(){
    cylinder(r=5,h=.5);
    translate([0,-6,0])cube([12,12,1]);
}

