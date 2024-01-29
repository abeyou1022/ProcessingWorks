void setup() {
  size(500, 500);
  background(0);
  blendMode(ADD);
}

void draw() {
  stroke(87, 139, 186, 20);
  for (float i=0; i<6; i++) {
    for (float x=0; x<width; x+=.5) {
      point(x, 100+(i*30)+noise(frameCount*.01, x*.005, i)*200);
    }
  }
}

//マウスクリックで画面をリセット
void mousePressed(){
  background(0);
}
