	//1aa
	module shell(){
	for(i=[-20,20])rotate([0,0,i]){
		hull(){
			sphere(9/2,$fn=30);
			translate([15,0,0])sphere(6/2,$fn=30);
		}
          	hull(){
			translate([15,0,0])sphere(5.5/2,$fn=30);
			translate([35,0,0])sphere(5.5/2,$fn=30);
		}
        

	}
	translate([-17.5,0,0])rotate([0,90,0])cylinder(r=9/2,h=35,$fn=30,center=true);
}
//shell();

module channel(){
	for(i=[-20,20])rotate([0,0,i]){
		hull(){
			sphere(6.5/2,$fn=30);
			translate([10,0,0])sphere(4/2,$fn=30);
		}
		hull(){
			translate([10,0,0])sphere(4/2,$fn=30);
			translate([20,0,0])sphere(3.5/2,$fn=30);
		}
        	hull(){
			translate([20,0,0])sphere(3.5/2,$fn=30);
			translate([50,0,0])sphere(3.5/2,$fn=30);
		}
	}
	translate([-17.5,0,0])rotate([0,90,0])cylinder(r=6.5/2,h=35,$fn=30,center=true);
}


difference(){
    shell();
    channel();
}
