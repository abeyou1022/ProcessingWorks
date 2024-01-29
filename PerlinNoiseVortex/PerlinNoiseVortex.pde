float x, y, a, r, n, w=250;
void setup() {
  size(500, 500);
  blendMode(ADD);
  background(0);
}
void draw() {
  x=mouseX;
  y=mouseY;
  a=atan2(y-w, x-w);
  stroke(87, 139, 186, 20);
  for (r=0; r<dist(w, w, x, y); r+=.1) {
    n=noise(r*.005, frameCount*.005)*30+a;
    point(w+cos(n)*r, w+sin(n)*r);
  }
}
