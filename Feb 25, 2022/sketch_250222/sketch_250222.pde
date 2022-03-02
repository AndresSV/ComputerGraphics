// 2 methods that we will be using
// part of the lifecycle
float displacement;

// runs once at the beginning
// used PRECISELY for setup

void setup() {
  size(800, 600 ,P3D);
  displacement = 0;
}

// this one runs each time we have a loop
// in graphical application the program is running constantly
void draw() {
  background(255);
  
  beginShape();
  
  // your verices go right here!
  
  // x axis - positive goes right
  // y axis - positive goes down
  vertex(displacement + 100, 100);
  vertex(displacement + 200, 100);
  vertex(displacement + 200, 200);
  vertex(displacement + 100, 200);
  
  endShape(CLOSE);
  
  displacement += 1;
}
