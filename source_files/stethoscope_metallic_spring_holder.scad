//This makes a holder for the stethoscope's spring.
//
//Two need to be made, one with a negative and one with a positive rotation

$rotate=-15;

difference() {
cylinder(r=6.5,h=10); //tube housing outer shell
translate([0,-0.50,0]) rotate([0,0,$rotate]) cylinder(r=3.5,h=11,$fn=6);//ear tube diameter
translate([-4.7/2,3.2,0]) cube([4.7,1.5,5]);
    }

