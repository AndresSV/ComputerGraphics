// isolating transformations
// hierarchical transformations

void setup() {
  size(800, 800, P3D);
  
  // color of the line in your figures
  stroke(113, 28, 178);
  
  // just draw lines
   noFill();
   
}

void draw() {
  
  background(0);
  
  // how to manage input
  // polling - poleo
  if(keyPressed) {
    if(key == 'q') println("YOU PRESSED Q!");
  }
  
  // HOW TO ISOLATE TRANSFORMATIONS
  
  pushMatrix();
  // we havve a stack of matrices that we can work with
  
  // making our lives easier
  translate(width/2, height/2, 0);
    
  rotate(radians(30));
    
  // IMPORTANT NOTE: even if you use convenience methods the order remains inverted
  scale(2 ,1, 1);
  
  // this is shear
  // basic transformations: translate, rotate, scale and shear
  // shearX(5);
  
  box(100);
  
  popMatrix();
  // wach time we pop matrix
  // we retrieve the last pushed matrix and restore it as our state matrix
  
  translate(width/2 + 100, height/2 - 100, 0);  
  sphere(100);
}
