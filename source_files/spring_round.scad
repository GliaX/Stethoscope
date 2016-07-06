rotate([90,0,0]) {

//Base cylinder that acts as a bridge
translate([0,-3,0]) {
rotate([0,90,0]){
cylinder($fn=360, h=60, r=2);
}
}


//right holder - slides onto the R eartube
difference() {
translate ([64,5,0]) {
    rotate([90,0,0]){
        cylinder($fn=360, h=10, r=4.75);}
    }
    translate ([64,5,0]) {
    rotate([90,0,0]){
        cylinder($fn=360, h=11, r=3.5);}
    }
    }


//left holder - slides onto the L eartube
difference() {
translate ([-4,5,0]) {
    rotate([90,0,0]){
        cylinder($fn=360, h=10, r=4.75);}
    }
    translate ([-4,5,0]) {
    rotate([90,0,0]){
        cylinder($fn=360, h=11, r=3.5);}
    }
}
}
