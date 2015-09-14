//change2
module tube(id,od,l){
   difference(){
    cylinder(r=od/2,l,$fn=100,center=true);
    translate([0,0,-1])cylinder(r=id/2,l+2,$fn=100,center=true);
    
   }
    
    
}

module channel(){
	for(i=[-20,20])rotate([0,0,i]){
		hull(){
			sphere(7.5/2,$fn=30);
			translate([10,0,0])sphere(4.5/2,$fn=30);
		}
		hull(){
			translate([10,0,0])sphere(4.5/2,$fn=30);
			translate([20,0,0])sphere(4/2,$fn=30);
		}
	}
	translate([-7.5,0,0])rotate([0,90,0])cylinder(r=7.5/2,h=15,$fn=30,center=true);
}

module shell(){
	for(i=[-20,20])rotate([0,0,i]){
		hull(){
			sphere(9/2,$fn=30);
			translate([15,0,0])sphere(6/2,$fn=30);
		}

	}
	translate([-7.5,0,0])rotate([0,90,0])cylinder(r=9/2,h=15,$fn=30,center=true);
}



translate([0,0,4.5])render()difference(){
union(){translate([0,0,0])mirror()shell();
translate([-17,8.50,0])rotate(a=90,v=[0,1,0]){
translate([0,-2,0])rotate(a=20,v=[1,0,0])tube(4,5.5,30);
translate([0,-15,0])rotate(a=20,v=[-1,0,0])tube(4,5.5,30);
translate([0,-8.5,40])tube(7.5,9,40);
}
}
translate([0,0,0])mirror()channel();
}
%cube([200,200,0.01],center=true);

#translate([2.8,0,0]){rotate(a=180,v=[0,0,1])
difference(){
    
rotate(a=6,v=[0,-1,0]){
translate([7,0,-5.3]){
cube ([20,20,10],center=true);}}
translate([0,0,-5])    cube ([70,70,10],center=true);
translate([0,0,-8])    cube ([70,70,10],center=true);
}}
translate([-33,9,0])cube([5,5,1.75]);
translate([-33,-14,0])cube([5,5,1.75]);
translate([-30,-15,0])cube([13,30,1.45]);
	
	