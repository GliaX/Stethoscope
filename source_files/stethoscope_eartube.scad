/*
//how to make an array
array=[10,20,30,40,50,60];
for(i=[5:-1:0]){
    //translate([i,0,0])cube([1,1,array[i]]);
    for(j=[i:-1:0]){
    translate([i,j,0])cube([1,1,array[j]]);
}
}

xarray=[0,23,32,80,100,150,155,159,160,162,162.8,163.5,164.5,167,168,169,170,170.2,170.5,170.5,170.2,168,165,163,159];
yarray=[0,0,0.9,9.3,14.1,30.3,32.6,34.8,35.9,37.7,39,40,41,45.2,46.7,48.2,51.8,54.4,56.2,59.2,63.8,67.9,73.7,75.7,78.6,85.2];
*/
// 


xxa=[162.71,160.705,158];
yya=[75.66,77.135,78.61];
xarray=[-6,0,36.5,42.19,79.92,99.81,148.63,150,153.73,154.75,155.89,157.91,159.74,161.04,162.34,163.4,163.94,164.37,165.09,165.65,166.29,167.14,167.73,168.32,168.81,169.17,169.35,169.3,168.9,168.47,167.83,167.32,166.54,165.7,164.9,162.71,158.7];

yarray=[0,0,0,0.85,7.29,14.11,29.85,30.29,32.11,32.6,33.41,34.83,36.42,37.46,38.68,40.03,41.05,41.71,43.01,44.01,45.19,46.74,48.18,49.63,51.78,53.91,56.05,59.24,61.43,63.81,66.11,67.92,69.74,71.23,72.67,75.66,78.61];


module eartube(){
translate([33.5,-.5,3.5])cube([3,1,1]);// end key
difference(){
    union(){
   difference(){
       union(){
for(i=[3:1:34]){//building the shape of the outer shell of the ear tube till the ear bud area
    hull(){
    translate([xarray[i],yarray[i],0])//cylinder(r=.5,h=10);
        sphere(3.5,$fn=10);
    translate([xarray[i+1],yarray[i+1],0])//cylinder(r=.5,h=10);
        sphere(3.5,$fn=10);
    
        }}
        
            translate([0,0,.2])hull(){
    translate([xarray[1],yarray[1],0])//cylinder(r=.5,h=10);
        scale([1,1.2,1])sphere(3.5,$fn=20);
    translate([xarray[2],yarray[2],0])//cylinder(r=.5,h=10);
        scale([1,1.2,1])sphere(3.7,$fn=20);
    
        }
        
            hull(){
    translate([xarray[2],yarray[2],0.2])//cylinder(r=.5,h=10);
        scale([1,1.2,1])sphere(3.7,$fn=20);
    translate([xarray[4],yarray[4],0])//cylinder(r=.5,h=10);
        sphere(3.5,$fn=10);
    
        }
        hull(){
           translate([xarray[34],yarray[34],0])//cylinder(r=.5,h=10);
        sphere(3.5,$fn=10);
        
              translate([xxa[2],yya[2],0])
rotate([0,0,-30])rotate([0,90,0])rotate([0,0,18])cylinder(r=3.5,h=1.5);//earbud
        }
            }
        translate([xxa[2]-.1,yya[2],0])rotate([0,0,-30])rotate([0,90,0])cylinder(r=4,h=3.5);//earbud
            
      
    }
        // ear plug
        // i took the last two points on the array and took a moddle point  turns out that the distance is 2mm which is enough 
        
        
    /* hull(){//bulding the ear bud area
     translate([xxa[0],yya[0],0])
sphere(3,$fn=10);
         translate([xxa[1],yya[1],0])
rotate([0,0,-30])rotate([0,90,0])cylinder(r=1,h=1);
     }*/
     
         
     translate([xxa[1],yya[1],0])
rotate([0,0,-30])rotate([0,90,0])cylinder(r=1,h=1);
         translate([xxa[2],yya[2],0])
rotate([0,0,-30])rotate([0,90,0])rotate([0,0,18])cylinder(r=3.5,h=1.5);//earbud
             
translate([xxa[2],yya[2],0])rotate([0,0,-30])rotate([0,90,0])rotate([0,0,18])cylinder(r=2,h=3.5);
     
     

        
       
        }
        union(){
      translate([-12.5,-5,-5])cube([10,10,10]);  
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
    translate([xarray[35],yarray[35],0])//cylinder(r=.5,h=10);
        sphere(.8,$fn=10);
    translate([xxa[2]-1,yya[2]+.7,0])//cylinder(r=.5,h=10);
        sphere(1.5,$fn=10);
    
        }
        
           hull(){
    translate([xarray[35],yarray[35],0])//cylinder(r=.5,h=10);
        sphere(1.5,$fn=10);
    translate([xxa[2],yya[2],0])//cylinder(r=.5,h=10);
        sphere(.1,$fn=10);
    
        }

//building the shape of the hole of the tube at the earbud  THE END        
///////////////////////////
       /*    hull(){
    translate([xarray2[34],yarray2[34],0])//cylinder(r=.5,h=10);
        sphere(2,$fn=10);
    translate([xarray2[35],yarray2[35],0])//cylinder(r=.5,h=10);
        sphere(1.5,$fn=10);
    
        }*/
//translate([0,-5,0])cube([200,200,10]);// cut in half 
        
        }}
                // translate([xxa[2]+1,yya[2]-4,-3.4])rotate([0,0,60])cube([5,5,.4]);//earbud support
        
    }
    
    font = "Kinnari:style=Italic";
//font = "Purisa:style=Bold";
//font = "Tlwg Mono:style=Bold";
//font ="eufm10:style=Bold";
cube_size = 60;
letter_size = 3;
letter_height = 8;

o = cube_size / 2 - letter_height / 2;

module letter(tt) {
  // Use linear_extrude() to make the letters 3D objects as they
  // are only 2D shapes when only using text()
  linear_extrude(height = letter_height) {
    text(tt, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
  }
}
translate([0,20,0])difference(){
eartube();
    translate([165.4,71.23,3])rotate([0,0,45])letter("R");
}


translate([0,-20,0])difference(){
mirror([0,1,0])eartube();
    translate([165.4,-71.23,3])rotate([0,0,-25])letter("L");
}



    //translate([0,20,0])eartube();
    //translate([0,-20,0])mirror([0,1,0])eartube();
    