$fn=64;
color("lightgrey"){difference(){difference(){difference(){difference(){union(){union(){union(){union(){union(){union(){union(){union(){cylinder(h = 1.080, r = 21.715);
translate(v = [0, 0, 1.080])
cylinder(h = 1.060, r = 21.000);
}
translate(v = [0, 0, 2.140])
cylinder(h = 0.800, r = 22.150);
}
translate(v = [0, 0, 2.940])
cylinder(h = 3.260, r1 = 22.150, r2 = 10.500);
}
translate(v = [0, 0, 6.200])
cylinder(h = 1.300, r1 = 10.500, r2 = 8.475);
}
translate(v = [0, 0, 7.500])
cylinder(h = 13.500, r1 = 8.475, r2 = 13.500);
}
translate(v = [0, 0, 21.000])
cylinder(h = 4.000, r1 = 13.500, r2 = 16.375);
}
translate(v = [0, 0, 25.000])
cylinder(h = 0.800, r = 15.500);
}
translate(v = [0, 0, 25.800])
cylinder(h = 1.420, r = 17.215);
}
translate(v = [0, 0, -0.010])
cylinder(h = 27.240, r = 1.575);
}
translate(v = [0, 0, -0.010])
cylinder(z = 0.210, r = 17.850);
}
translate(v = [0, 0, -0.010])
difference(){cylinder(h = 0.570, r = 20.450);
translate(v = [0, 0, -0.010])
cylinder(h = 0.590, r = 17.850);
}
}
translate(v = [0, 0, 0.560])
rotate_extrude(convexity = 10){rotate(a = [90, 0, 0])
polygon(points = [[0, 1.455], [2, 1.330], [4, 1.290], [6, 1.090], [8, 0.966], [10, 0.835], [12, 0.710], [14, 0.600], [16, 0.470], [18, 0.350], [20, 0.240], [22, 0.105], [24, 0.000], [0, 0]]);
}
}
}
