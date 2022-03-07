float handRotation,
      indexBaseRotation,
      middleBaseRotation,
      ringBaseRotation,
      indexTipRotation,
      middleTipRotation,
      ringTipRotation;

void setup() {
  size(800,800,P3D);
  stroke(113, 28, 178);
  noFill();
  
}

void draw() {
  background(0);
  if(keyPressed){
    if(key == 'r'){
      handRotation += 0.01;
    }
    if(key == 'f'){
      handRotation -= 0.01;
    }
    if(key == '1') {
      indexBaseRotation += 0.01;
    }
    if(key == 'q') {
      indexBaseRotation -= 0.01;
    }
    if(key == '2') {
      middleBaseRotation += 0.01;
    }
    if(key == 'w') {
      middleBaseRotation -= 0.01;
    }
    if(key == '3') {
      ringBaseRotation += 0.01;
    }
    if(key == 'e') {
      ringBaseRotation -= 0.01;
    }
    if(key == 'a') {
      indexTipRotation += 0.01;
    }
    if(key == 'z') {
      indexTipRotation -= 0.01;
    }
    if(key == 's') {
      middleTipRotation += 0.01;
    }
    if(key == 'x') {
      middleTipRotation -= 0.01;
    }
    if(key == 'd') {
      ringTipRotation += 0.01;
    }
    if(key == 'c') {
      ringTipRotation -= 0.01;
    }
  }
  
// Drawing palm at the center of the screen
  translate(width/2, height/2, 0);
  rotateY(handRotation);
  box(99, 114, 20);
  
// Saving the state matrix
  pushMatrix();

// Drawing index Finger
  // Drawing the base
  translate(-(99/2)-1,-(114/2),0);
  rotateX(indexBaseRotation);
  translate((32/2),-(49/2),0);
  box(32,  49, 20);
  
  // Drawing the tip
  translate(0,-(49/2),0);
  rotateX(indexTipRotation);
  translate(0,-(49/2),0);
  box(32,  49, 20);
// Reseting the state matrix
  popMatrix();

// Saving the state matrix
  pushMatrix();
  
// Drawing the middle Finger
  // Drawing the base
  translate(0,-(114/2),0);
  rotateX(middleBaseRotation);
  translate(0,-(49/2),0);
  box(32,  49, 20);
  
  // Drawing the tip
  translate(0,-(49/2),0);
  rotateX(middleTipRotation);
  translate(0,-(49/2),0);
  box(32,  49, 20);

// Reseting the state matrix
  popMatrix();

// Saving the state matrix
  pushMatrix();
  
// Drawing the ring Finger
  // Drawing the base
  translate((99/2)+1,-(114/2),0);
  rotateX(ringBaseRotation);
  translate(-(32/2),-(49/2),0);
  box(32,  49, 20);
  
  // Drawing the tip
  translate(0,-(49/2),0);
  rotateX(ringTipRotation);
  translate(0,-(49/2),0);
  box(32,  49, 20);

// Reseting the state matrix
  popMatrix();

}
