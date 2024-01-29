float x, y, r, n, w=250;
void setup() {
  size(500, 500);
  blendMode(ADD);
  background(0);
  stroke(87, 139, 186, 20);
}
void draw() {
  for (r=0; r<dist(w, w, x, y); r+=.1) {
    n=noise(r*.005, frameCount*.005)*30;
    point(w+cos(n)*r, 100+atan(n)*r);
  }
}
