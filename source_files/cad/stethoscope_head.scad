$fn=365;

// Take output for original head and put it in one module
module original_head() {
    union(){translate(v = [0, 0, 17.8])
    mirror(v = [0, 0, 1])
    difference(){union(){intersection(){translate(v = [-50.0, -50.0])
    cube(size = [100, 100, 17.8]);
    union(){cylinder(h = 1.080, r = 21.715);
    translate(v = [0, 0, 1.08])
    cylinder(h = 1.060, r = 21.000);
    translate(v = [0, 0, 2.14])
    cylinder(h = 0.800, r = 22.150);
    translate(v = [0, 0, 2.9400000000000004])
    cylinder(h = 3.260, r1 = 22.150, r2 = 10.500);
    translate(v = [0, 0, 6.2])
    cylinder(h = 1.300, r1 = 10.500, r2 = 8.475);
    translate(v = [0, 0, 7.5])
    cylinder(h = 13.500, r1 = 8.475, r2 = 13.500);
    translate(v = [0, 0, 21.0])
    cylinder(h = 4.000, r1 = 13.500, r2 = 16.375);
    translate(v = [0, 0, 25.0])
    cylinder(h = 0.800, r = 15.500);
    translate(v = [0, 0, 25.8])
    cylinder(h = 1.420, r = 17.215);
    translate(v = [0, 0, 13.5])
    rotate(a = [90, 0, 0])
    difference(){union(){cylinder(h = 20, r = 5.450);
    translate(v = [0, 0, 20])
    difference(){cylinder(h = 20.300, r = 4.250);
    translate(v = [0, 0, 13.8])
    union(){cylinder(h = 6.500, r1 = 2.500, r2 = 3.250);
    translate(v = [0, 0, 6.5])
    cylinder(h = 1, r = 3.250);
    }
    }
    }
    translate(v = [0, 0, -0.01])
    cylinder(h = 40.320, r = 2.650);
    }
    }
    }
    cylinder(h = 17.800, r = 21.000);
    }
    union(){translate(v = [0, 0, -0.01])
    difference(){cylinder(h = 0.570, r = 20.450);
    translate(v = [0, 0, -0.01])
    cylinder(h = 0.590, r = 17.850);
    }
    translate(v = [0, 0, 0.56])
    union(){translate(v = [0, 0, 2.735])
    mirror(v = [0, 0, 1])
    rotate_extrude(convexity = 10){polygon(points = [[0.0, 0], [0.25, 0], [0.5, 0], [0.75, 0], [1.0, 0], [1.25, 0.16], [1.5, 0.46], [1.75, 0.72], [2.0, 0.85], [2.25, 0.93], [2.5, 0.96], [2.75, 0.99], [3.0, 1.02], [3.25, 1.05], [3.5, 1.085], [3.75, 1.12], [4.0, 1.15], [4.25, 1.18], [4.5, 1.215], [4.75, 1.2475], [5.0, 1.278], [5.25, 1.308], [5.5, 1.34], [5.75, 1.372], [6.0, 1.401], [6.25, 1.432], [6.5, 1.465], [6.75, 1.5], [7.0, 1.529], [7.25, 1.559], [7.5, 1.5925], [7.75, 1.63], [8.0, 1.659], [8.25, 1.69], [8.5, 1.7225], [8.75, 1.76], [9.0, 1.7875], [9.25, 1.811], [9.5, 1.849], [9.75, 1.88], [10.0, 1.91], [10.25, 1.94], [10.5, 1.9725], [10.75, 2.005], [11.0, 2.035], [11.25, 2.065], [11.5, 2.1], [11.75, 2.134], [12.0, 2.1675], [12.25, 2.199], [12.5, 2.23], [12.75, 2.2625], [13.0, 2.291], [13.25, 2.32], [13.5, 2.3575], [13.75, 2.39], [14.0, 2.42], [14.25, 2.45], [14.5, 2.48], [14.75, 2.518], [15.0, 2.5475], [15.25, 2.5775], [15.5, 2.6125], [15.75, 2.6475], [16.0, 2.68], [16.25, 2.735], [16.7, 2.735], [0, 2.735]]);
    }
    translate(v = [0, 0, -2])
    cylinder(h = 2, r = 16.700);
    }
    translate(v = [0, 0, 13.5])
    rotate(a = [90, 0, 0])
    translate(v = [0, 0, -0.01])
    cylinder(h = 40.320, r = 2.650);
    translate(v = [0, 0, -0.01])
    cylinder(h = 27.240, r = 3.440);
    }
    }
    cylinder(h = 1.700, r = 5.000);
    }
}

//Create ring to subtract
module ring () {
    translate([0,0,12.8])
    difference() {
        cylinder(h = 6, r = 25);
        cylinder(h = 6, r = 20);
    }
}

// Create final model by subtracting ring from head
difference() {
    original_head();
    ring();
}



translate([-1,-40.2-2.5,.05])cube([2,5,.2]);
translate([0,-40.2-1,.05])difference(){
    cylinder(r=5,h=.5);
    translate([-6,0,0])cube([12,12,1]);
}