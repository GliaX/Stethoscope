module tube(id,od,l){
   difference(){
    cylinder(r=od/2,l,$fn=100);
    translate([0,0,-1])cylinder(r=id/2,l+2,$fn=100);
    
   }
    
    
}
tube(5,7,10);