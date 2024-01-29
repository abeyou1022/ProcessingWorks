int num = 7; //花びらの枚数
PFont font; //フォント

void setup() {
  size(500, 500);
  background(0, 10, 20);
  strokeWeight(5);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);

  font = loadFont("DSEG7ClassicMini-Regular-48.vlw"); //フォントファイル
  textAlign(CENTER); //中央揃え
  textFont(font, 48); //文字サイズの設定
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);

  noStroke();
  fill(209, 99, 7, 10); //RGB(0,10,20)
  rect(0, 0, width-1, height-1);

  sinFlower();
  popMatrix();

  display();
}

//sin波模様
void sinFlower() {
  rotate(frameCount*0.01);
  float r = sin(frameCount*0.05)*width/2; //sin波  

  stroke(map(abs(r), 0, width/2, 0, 360), 99, 99); //中心からの距離で色を決定
  for (int i=0; i<num; i++) {
    float angle = radians(360*i/num);
    point(cos(angle)*r, sin(angle)*r);
  }
}

//時刻の表示
void display() {
  String hour = String.format("%02d", hour());
  String minute = String.format("%02d", minute());
  String second = String.format("%02d", second());
  String ms = String.format("%02d", 20+millis()/6000);

  fill(209, 99, 7);
  noStroke();
  rect(width/2, height/2, 255, 60);
  fill(0, 0, 99, 50);
  text("88:88:88", width/2, height/2+25);
  fill((map((frameCount*0.7)%359, 0, width/2, 0, 359)), 99, 99);
  text(hour+":"+minute+":"+second, width/2, height/2+25);
}
