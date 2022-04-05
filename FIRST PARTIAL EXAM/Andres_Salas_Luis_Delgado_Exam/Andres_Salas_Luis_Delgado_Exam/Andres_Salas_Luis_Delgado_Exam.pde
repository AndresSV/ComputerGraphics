// Andrés Salas Villarreal - A01632107
// Luis Gerardo Delgado Ruiz - A01630534

float systemRotation,       // Q A
      sunRotation,          // W S
      sphereSystemRotation, // E D
      sphereMoonRotation,   // R F
      squareSystemRotation, // T G
      squareMoonRotation;   // Y H

void setup() {
  size(800,800,P3D);
  stroke(113,28,178);
  noFill();
}

void draw() {
  background(0);
  if(keyPressed) {
    if(key == 'q' || key == 'Q') {
      // positive +
      systemRotation += 0.01;
    }
    if(key == 'a' || key == 'A') {
      // negative -
      systemRotation -= 0.01;
    }
    if(key == 'w' || key == 'W') {
      sunRotation += 0.01;
    }
    if(key == 's' || key == 'S') {
      sunRotation -= 0.01;
    }
    if(key == 'e' || key == 'E') {
      sphereSystemRotation += 0.01;
    }
    if(key == 'd' || key == 'D') {
      sphereSystemRotation -= 0.01;
    }
    if(key == 'r' || key == 'R') {
      sphereMoonRotation += 0.04;
    }
    if(key == 'f' || key == 'F') {
      sphereMoonRotation -= 0.04;
    }
    if(key == 't' || key == 'T') {
      squareSystemRotation += 0.01;
    }
    if(key == 'g' || key == 'G') {
      squareSystemRotation -= 0.01;
    }
    if(key == 'y' || key == 'Y') {
      squareMoonRotation += 0.04;
    }
    if(key == 'h' || key == 'H') {
      squareMoonRotation -= 0.04;
    }
    if(key == 'u' || key == 'U') {
      systemRotation         += 0.01;
      sunRotation            += 0.01;
      sphereSystemRotation   += 0.01;
      sphereMoonRotation     += 0.04;
      squareSystemRotation   += 0.01;
      squareMoonRotation     += 0.04;
    }
    if(key == 'j' || key == 'J') {
      systemRotation         -= 0.01;
      sunRotation            -= 0.01;
      sphereSystemRotation   -= 0.01;
      sphereMoonRotation     -= 0.04;
      squareSystemRotation   -= 0.01;
      squareMoonRotation     -= 0.04;
    }
  }
  
//Drawing at the middle of the screen
  translate(width/2, height/2, 0);
  rotateY(systemRotation);
  
// Drawing System
  //Drawing Sun
  pushMatrix();
  rotateY(sunRotation);
  sphere(100);
  popMatrix();
  
  // Drawing Sphere Planet and Moon
  pushMatrix();
  // Sphere System Rotation
  rotateZ(sphereSystemRotation);
  translate (100 + 40, 0, 0);
  sphere(25);
  pushMatrix();
  // Sphere Moon Rotation
  rotateX(sphereMoonRotation);
  translate (0, 60, 0);
  sphere(8);
  
  popMatrix();  
  popMatrix();
  
  // Drawing Cube Planer and Moon
  pushMatrix();
  // Square System Rotation 
  rotateZ(squareSystemRotation);
  translate (- 100 - 40, 0, 0);
  box(25);
  pushMatrix();
  // Sphere Moon Rotation
  rotateX(squareMoonRotation);
  translate (0, 60, 0);
  box(8);
  
  popMatrix();
  popMatrix();
}
