use <Write.scad>
rotate([90,0,0]) {

difference() {

//springbase
translate([0,-3,0]) {
rotate([0,90,0]){
cylinder($fn=360, h=60, r=2);
}
}

//letters
translate ([52,-1.3,1]){
rotate ([0,0,90]) {
write("Glia", h=4, space=5, rotate=-90, centre=true, font = "knewave.dxf");
    }
}
}
//right holder
difference() {
translate ([64,5,0]) {
    rotate([90,0,0]){
        cylinder($fn=360, h=10, r=4.75);}
    }
    translate ([64,5,0]) {
    rotate([90,0,0]){
        cylinder($fn=360, h=11, r=3.5);}
    }
 //      translate ([50,-5,2.8]) {
  //      cube(30,15,10);}
    }


//left holder
difference() {
translate ([-4,5,0]) {
    rotate([90,0,0]){
        cylinder($fn=360, h=10, r=4.75);}
    }
    translate ([-4,5,0]) {
    rotate([90,0,0]){
        cylinder($fn=360, h=11, r=3.5);}
    }
//    translate ([-8,-5,2.8]) {
//        cube(30,15,10);}
}
}