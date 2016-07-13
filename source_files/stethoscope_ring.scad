// Bottom ring
module bottom_ring($fn=360) {
    difference() {
        cylinder(h = 0.5, r = 43.43/2);
        cylinder(h = 0.5, r = 18);
    }
}

// Side wall
module side_wall($fn=360) {
    difference() {
        cylinder(h = 6, r = 43.43/2);
        cylinder(h = 6, r = 20);
    }
}

//Compile both rings
union() {
    bottom_ring();
    side_wall();
}