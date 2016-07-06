// Bottom ring
module bottom_ring($fn=360) {
    difference() {
        cylinder(h = 0.5, r = 22);
        cylinder(h = 0.5, r = 20);
    }
}

// Side wall
module side_wall($fn=360) {
    difference() {
        cylinder(h = 5, r = 23);
        cylinder(h = 5, r = 22);
    }
}

//Compile both rings
union() {
    bottom_ring();
    side_wall();
}