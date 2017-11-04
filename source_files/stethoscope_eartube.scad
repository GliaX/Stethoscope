/*
the eartube is made of combination of spheres of 7mm diameter combined together to form its shape. 
the positioning of the spheres is taken by making array of x axis positions and array of y axis positions
the earbud area is different from the rest of the eartube body so it was made in different way to shape and rotated to be in the right direction to snap fit the standard earbud
the inner hole in the eartube which should deliver the "sound" is made also from spheres but with 4mm  diameter with the same positioning of the outer shell spheres
the start and the end of the eartube have  mouse ears to prevent the eartube from warping during the printing process which can be removed easily by a sharp blade



*/
/////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

//arrays of the positions of the spheres that makes the eartube

xxa=[162.71,160.705,158];
yya=[75.66,77.135,78.61];
xarray=[-6,0,36.5,42.19,79.92,99.81,148.63,150,153.73,154.75,155.89,157.91,159.74,161.04,162.34,163.4,163.94,164.37,165.09,165.65,166.29,167.14,167.73,168.32,168.81,169.17,169.35,169.3,168.9,168.47,167.83,167.32,166.54,165.7,164.9,162.71,158.7];

yarray=[0,0,0,0.85,7.29,14.11,29.85,30.29,32.11,32.6,33.41,34.83,36.42,37.46,38.68,40.03,41.05,41.71,43.01,44.01,45.19,46.74,48.18,49.63,51.78,53.91,56.05,59.24,61.43,63.81,66.11,67.92,69.74,71.23,72.67,75.66,78.61];




difference(){//this difference cuts inside the eartube budy
    union(){//this union constuct the eartube body "outer shell,which is made in two step,1- making the speres to build most of its body and 2-the earbud tip at the end
   difference(){//this difference cots the cylindrical insert of the earbud tosnap in the eartube
       
    union(){
for(i=[3:1:34]){//building the shape of the outer shell of the ear tube till the ear bud area
    hull(){//combining eartube speres to shape the body
    translate([xarray[i],yarray[i],0])sphere(3.5,$fn=10);
    translate([xarray[i+1],yarray[i+1],0])sphere(3.5,$fn=10);
    
        }}
        
        
        
        //building the start of the eartube which will be a streched cylinder to fit as a key in the earyube spring,which will need no directional calibration in the assembly process
        
            hull(){
        translate([xarray[1],yarray[1],0])scale([1,1.2,1])sphere(3.5,$fn=10);
    translate([xarray[2],yarray[2],0])scale([1,1.2,1])sphere(3.5,$fn=10);
    
        }
        
        
        //this is the part where the streched cylinder joins the rest of the eartube body,without a noticable bump
        
            hull(){
    translate([xarray[2],yarray[2],0])
        scale([1,1.2,1])sphere(3.5,$fn=10);
    translate([xarray[4],yarray[4],0])
        sphere(3.5,$fn=10);
    
        }
        
        
        hull(){
           translate([xarray[34],yarray[34],0])
        sphere(3.5,$fn=10);
        
              translate([xxa[2],yya[2],0])
rotate([0,0,-30])rotate([0,90,0])rotate([0,0,18])cylinder(r=3.5,h=1.5);//earbud
        }
            }
        translate([xxa[2]-.1,yya[2],0])rotate([0,0,-30])rotate([0,90,0])cylinder(r=4,h=3.5);//earbud
            
      
    }
        // ear plug
        // i took the last two points on the array and took a moddle point  turns out that the distance is 2mm which is enough 
        
        
     //bulding the ear bud area
  
     
    

    
     translate([xxa[1],yya[1],0])
rotate([0,0,-30])rotate([0,90,0])cylinder(r=1,h=1);
    
         translate([xxa[2],yya[2],0])
rotate([0,0,-30])rotate([0,90,0])rotate([0,0,18])cylinder(r=3.5,h=1.5);//earbud snap fit cylinder
             
    
    
    
translate([xxa[2],yya[2],0])rotate([0,0,-30])rotate([0,90,0])rotate([0,0,18])cylinder(r=2,h=3.5);//earbud snap fit cylinder joint
     
     

        
       
        }
        union(){  
for(i=[0:1:34]){//building the hole of the tube from the [0,0] until the earbud area
    hull(){
    translate([xarray[i],yarray[i],0])//cylinder(r=.5,h=10);
        sphere(2,$fn=10);
    translate([xarray[i+1],yarray[i+1],0])//cylinder(r=.5,h=10);
        sphere(2,$fn=10);
    
        }}
        
        ///////////////////////////////////
        //building the shape of the hole of the tube at the earbud THE START
        
        
           hull(){  
    translate([xarray[35],yarray[35],0])
        sphere(.8,$fn=10);
    translate([xxa[2]-1,yya[2]+.7,0])
        sphere(1.5,$fn=10);
    
        }
        
           hull(){
    translate([xarray[35],yarray[35],0])
        sphere(1.5,$fn=10);
    translate([xxa[2],yya[2],0])
        sphere(.1,$fn=10);
    
        }

        }}
        
        
        
        
        
        //eartubes bottom mouse ear
        yyy=2;//connector width
        translate([-5,-yyy/2,-3.33])cube([10,yyy,.2]);
        translate([-3,0,-3.33])difference(){
        cylinder(r=5,h=.5);
        translate([0,-6,0])cube([12,12,1]);
        }    
        
        
//eartube earbud mouse ear
 translate([xxa[2],yya[2],0])
rotate([0,0,-30])translate([0,0,-3.33]){translate([-0,0,0])difference(){
        cylinder(r=5,h=.5);
        translate([0,-6,0])cube([12,12,1]);
        }    
        translate([-5,-yyy/2,0])cube([.05,yyy,.2]);
        
    }

