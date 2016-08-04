$outside_width = 41.5/2; //Radius of outside wall (mm)
$inside_width_diaphragm = 18; // Inside radius of diaphragm (mm)
$inside_width_wall = 20; //Inside radius of wall (mm)

// Bottom ring
module bottom_ring($fn=360) {
    difference() {
        cylinder(h = 0.5, r = $outside_width);
        cylinder(h = 0.5, r = $inside_width_diaphragm);
    }
}

// Side wall
module side_wall($fn=360) {
    difference() {
        cylinder(h = 6, r = $outside_width);
        cylinder(h = 6, r = $inside_width_wall);
    }
}

//Compile both rings
union() {
    bottom_ring();
    side_wall();
}