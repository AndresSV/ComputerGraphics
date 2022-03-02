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
                                        
  float tx_2 = width/4;
  float ty_2 = 0;
  float tz_2 = 0;
  PMatrix3D translation_2 = new PMatrix3D(1, 0, 0, tx_2,
                                          0, 1, 0, ty_2,
                                          0, 0, 1, tz_2,
                                          0, 0, 0, 1);
                                        
  float scaleValue = cos( millis() * 0.0015 );
  float sx = scaleValue;
  float sy = scaleValue;
  float sz = scaleValue;
  PMatrix3D scale = new PMatrix3D(sx, 0,  0,  0,
                                  0,  sy, 0,  0,
                                  0,  0,  sz, 0,
                                  0,  0,  0,  1);


                                        
  float angle = millis() * 0.025;
  float cosAngle = cos(radians(angle));
  float sinAngle = sin(radians(angle));
  
  PMatrix3D rotationZ = new PMatrix3D(cosAngle, -sinAngle,  0,0,
                                      sinAngle, cosAngle,   0,0,
                                      0,        0,          1,0,
                                      0,        0,          0, 1);
                                      
  PMatrix3D rotationZ_2 = new PMatrix3D(cosAngle, -sinAngle,  0,0,
                                      sinAngle, cosAngle,   0,0,
                                      0,        0,          1,0,
                                      0,        0,          0, 1);
  
  
  applyMatrix(translation);
  applyMatrix(rotationZ_2);
  applyMatrix(translation_2);
  applyMatrix(scale);
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
