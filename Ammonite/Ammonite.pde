float x, y, a, r, n, w=250;
void setup() {
  size(500, 500);
}
void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, 500, 500);
  x=mouseX;
  y=mouseY;
  a=atan2(y-w, x-w);
  stroke(0, w, w);
  for (r=0; r<dist(w, w, x, y); r+=.1) {
    n=noise(r*.005, frameCount*.005)*30+a;
    point(w+cos(n)*r, w+sin(n)*r);
  }
}
