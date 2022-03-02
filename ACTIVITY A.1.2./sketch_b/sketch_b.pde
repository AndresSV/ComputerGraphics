void setup() {
  size(800, 600, P3D);
  stroke(255);
  noFill();
}
void draw() {
  background(0);
  
  float tx = width/2;
  float ty = height/2;
  float tz = 0;
  PMatrix3D translation = new PMatrix3D(1, 0, 0, tx,
                                        0, 1, 0, ty,
                                        0, 0, 1, tz,
                                        0, 0, 0, 1);
                                        
  float angle = millis() * 0.025;
  float cosAngle = cos(radians(angle));
  float sinAngle = sin(radians(angle));
  
  PMatrix3D rotationZ = new PMatrix3D(cosAngle, -sinAngle,  0,0,
                                      sinAngle, cosAngle,   0,0,
                                      0,        0,          1,0,
                                      0,        0,          0, 1);
  applyMatrix(translation);
  applyMatrix(rotationZ);
  drawSquare();
}

void drawSquare() {
  beginShape();
  vertex(-50, -50);
  vertex(50, -50);
  vertex(50, 50);
  vertex(-50, 50); 
  endShape(CLOSE);
}
