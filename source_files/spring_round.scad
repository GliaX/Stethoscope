rotate([90,0,0]) {

    // Horizontal base of the spring
    translate([0,-3,0]) {
        rotate([0,90,0]){
            cylinder($fn=360, h=60, r=2);
        }
    }

    // Right ear-tube holder
    translate ([64,5,0]) {
        rotate([90,0,0]){
            difference() {
                cylinder($fn=360, h=10, r=4.75);
                cylinder($fn=360, h=11, r=3.5);
            }
        }
    }


    // Left ear-tube holder
    translate ([-4,5,0]) {
        rotate([90,0,0]){
            difference() {
                cylinder($fn=360, h=10, r=4.75);
                cylinder($fn=360, h=11, r=3.5);
            }
        }
    }
}