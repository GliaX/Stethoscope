module tube(id,od,l){
   render()difference(){
    cylinder(r=od/2,l,$fn=100,center=true);
    translate([0,0,-1])cylinder(r=id/2,l+2,$fn=100,center=true);
    
   }
    
    
}
rotate(a=90,v=[0,1,0]){
rotate(a=20,v=[1,0,0])tube(4,5.5,30);
translate([0,-17,0])rotate(a=20,v=[-1,0,0])tube(4,5.5,30);
translate([0,-8.5,40])tube(7.5,9,40);
}
%cube([200,200,0.01],center=true);