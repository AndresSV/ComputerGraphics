float rotation;
boolean autoRotation;

void setup() {
  size(800,800,P3D);
  stroke(255);
  noFill();
  rotation = 0;
  autoRotation = false;
}

void draw() {
  background(0);
  
  if(autoRotation) {
    rotation += 0.01;
  }
  
  if(keyPressed){
    if(key == 'q') {
      autoRotation = !autoRotation;
    }
    if(key == 'a'){
      rotation += 0.01;
    }
    if(key == 'f'){
      rotation -= 0.01;
    }
  }
  
  translate(width/2, height/2, 0);
  rotateY(rotation);
  
// Hip
  pushMatrix();
  translate(30, 0, 0);
  sphereDetail(8);
  sphere(20);
  popMatrix();
  
// Abdomen
  pushMatrix();
  translate(-6, -13, 0);
  rotate(radians(20));
  box(80, 40, 20);
  popMatrix();
  
// Chest
  pushMatrix();
  translate(-40, -30, 0);
  sphereDetail(8);
  sphere(30);
  popMatrix();
  
// Lower Left Leg
  pushMatrix();
  translate(40, 10, -15);
  rotate(radians(-37));
  box(15, 45, 5);
  rotate(radians(-15));
  translate(-7,33,0);
  box(10,20,5);
  translate(-3,17,0);
  rotate(radians(33));
  box(5,15,5);
  translate(-1,10,0);
  rotate(radians(84));
  box(5,7,5);
  popMatrix();
  
// Lower Right Leg
  pushMatrix();
  translate(40, 10, 15);
  rotate(radians(-15));
  box(15, 45, 5);
  rotate(radians(-15));
  translate(-7,33,0);
  box(10,20,5);
  translate(-3,17,0);
  rotate(radians(33));
  box(5,15,5);
  translate(-1,10,0);
  rotate(radians(84));
  box(5,7,5);
  popMatrix();
  
// Upper Left Leg
  pushMatrix();
  translate(-45, -25, -15);
  pushMatrix();
  rotate(radians(60));
  box(30,55,10);
  popMatrix();
  translate(-35, 13, 0);
  box(38, 20, 10);
  translate(-25,2,0);
  pushMatrix();
  rotate(radians(-30));
  box(20,13,10);
  popMatrix();
  translate(-15,5,0);
  box(10,10,10);
  popMatrix();
  
// Upper Right Leg
  pushMatrix();
  translate(-45, -25, 15);
  rotate(radians(-40));
  pushMatrix();
  rotate(radians(60));
  box(30,55,10);
  popMatrix();
  translate(-35, 13, 0);
  box(38, 20, 10);
  translate(-25,2,0);
  pushMatrix();
  rotate(radians(-30));
  box(20,13,10);
  popMatrix();
  translate(-15,5,0);
  box(10,10,10);
  popMatrix();
  
// Tail
  pushMatrix();
  translate(58,-26,0);
  pushMatrix();
  rotate(radians(50));
  box(10,35,10);
  popMatrix();
  translate(15,-17,0);
  box(8,16,8);
  popMatrix();
  
// Neck
  translate(-47, -52, 0);
  pushMatrix();
  rotate(radians(60));
  box(50,30,20);
  popMatrix();
  // Head
  translate(-26,-26,0);
  sphere(23);
  // Jaw
  pushMatrix();
  translate(-23,3,0);
  box(30,20,17);
  // Nose
  translate(-15,-10,0);
  box(10);
  popMatrix();
  // Left Ear
  pushMatrix();
  translate(16,-16,-10);
  box(25,10,10);
  translate(15,5,0);
  pushMatrix();
  rotate(radians(25));
  box(15,10,10);
  popMatrix();
  popMatrix();
  // Right Ear
  pushMatrix();
  rotate(radians(-30));
  translate(16,-16,10);
  box(25,10,10);
  translate(15,5,0);
  pushMatrix();
  rotate(radians(25));
  box(15,10,10);
  popMatrix();
  popMatrix();
}
