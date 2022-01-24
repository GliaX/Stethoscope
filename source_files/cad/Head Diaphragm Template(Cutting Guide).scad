//Head Diaphragm Template(Cutting Guide)
$outside_width = 30; //Radius of outside wall (mm)
$inside_width_wall = 20; //Inside radius of wall (mm)
$fn=360;


// Side wall

    difference() {
        cylinder(h = 2, r = $outside_width);
        cylinder(h = 2, r = $inside_width_wall);
    }

