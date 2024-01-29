float x, y, n=random(30);
void setup() {
  size(500,500);
  //stroke(#cda37a, 60);
  stroke(87,139,186,20);
  noFill();
  blendMode(ADD);
  rectMode(CENTER);
  background(0);
}
void draw() {
  strokeWeight(noise(n)*2+0.5);
  push();
  translate(width/2,height/2);
  rotate(noise(n+0.1)*2*PI);
  x=noise(n)*400;
  y=noise(3*n)*400;
  ellipse(0, 0, x, y);
  pop();
  n+=0.005;
}
