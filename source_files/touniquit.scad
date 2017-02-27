rod_r=7;//rod radius mm
rod_l=140;//rod length mm
rod_g=5;//rod groove radius
rod_res=8;//rod resolution

rod_groove_l=[4,4,8];//
rod_groove_p=[12,22,28];//

rod_in_strap_space=2;//spacing between rod and the curve
strap_holder_w=50;//strap holder width
strap_holder_t=1.5;//strap holder thickness
strap_holder_l=90;//strap holder length
holder_w=25;//curvy holder width
strap_w=40;// velcro strap width
strap_t=3;//velcro strap groove thickness
curve_sup_t=5;//groove support thichness
curve_t=4;//curve thickness

groov_p_y=[6,15];//y-position of strap grooves 

groov_array_length=2;//length of grooves y-position array 
curve_op=20;//curve upper openning window width 

//calculations
groov_p_x=(strap_holder_w-strap_w)/2;

curve_or=rod_r+rod_in_strap_space+curve_t; //curve outer radius
curve_ir=rod_r+rod_in_strap_space; //curve inner radius
window_y_p=(strap_holder_w-curve_op)/2;//y-position of window






///////////////////////////////////////////
//////////////////////////////////////////

module strap_holder(){
difference(){
union(){
cube([strap_holder_w,holder_w,curve_t]);
cube([strap_holder_w,strap_holder_l,strap_holder_t]);
}
for(i=[0:1:groov_array_length-1]){
translate([groov_p_x,groov_p_y[i],0])cube([strap_w,strap_t,curve_t]);
  translate([groov_p_x,strap_holder_l-strap_t-groov_p_y[i],0])cube([strap_w,strap_t,curve_t]);  
}   

}
//curve building
difference(){
translate([0,0,curve_or])rotate([-90,0,0])difference(){cylinder(r=curve_or,h=holder_w);
    translate([0,0,-curve_sup_t])cylinder(r=curve_ir,h=holder_w);
    
}
    translate([0,-.1,0])cube(300);
}

translate([strap_holder_w,0,0])mirror([1,0,0])
difference(){
translate([0,0,curve_or])rotate([-90,0,0])difference(){cylinder(r=curve_or,h=holder_w);
    translate([0,0,-curve_sup_t])cylinder(r=curve_ir,h=holder_w);
    
}
    translate([0,-.1,0])cube(300);
}
difference(){
translate([0,0,curve_or+curve_ir])cube([strap_holder_w,holder_w,curve_t]);
translate([window_y_p,0,curve_or+curve_ir])cube([curve_op,holder_w,curve_t]);
}
}
///////////////////////////////////



module rod(){
difference(){
hull(){
translate([0,rod_r,rod_r])sphere(r=rod_r,$fn=rod_res);
translate([0,rod_l-rod_r,rod_r])sphere(r=rod_r,$fn=rod_res);
}
//
hull(){
translate([0,(-strap_w+rod_l)/2,0])cylinder(r=strap_t/2,h=rod_r*2);
translate([0,(strap_w+rod_l)/2,0])cylinder(r=strap_t/2,h=rod_r*2);
}


for(i=[0:1:2]){
translate([0,rod_groove_p[i],rod_r])rotate([-90,0,0])rotate([0,0,22.5])difference(){cylinder(r=rod_r+1,h=rod_groove_l[i],$fn=rod_res);cylinder(r=rod_g,h=rod_groove_l[i],$fn=rod_res);
}
translate([0,rod_l-rod_groove_p[i],rod_r])rotate([90,0,0])rotate([0,0,22.5])difference(){cylinder(r=rod_r+1,h=rod_groove_l[i],$fn=rod_res);cylinder(r=rod_g,h=rod_groove_l[i],$fn=rod_res);
    
    
}

}
}
}
translate([-30,0,0])rod();
strap_holder();