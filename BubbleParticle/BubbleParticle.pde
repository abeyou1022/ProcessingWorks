int num = 720;
Particle[] particle = new Particle[num];

void setup() {
  size(1075,650);
  background(0, 10, 20);
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  noStroke();

  for (int i=0; i<particle.length; i++) {
    float r = random(300);
    float angle = radians((int)random(0, 359));
    particle[i] = new Bubble(width/2+cos(angle)*r, height/2+sin(angle)*r);
  }
}

void draw(){
  background(209,99,7); //RGB(0,10,20);
  
  for(Particle p : particle) p.draw();
}

class Particle {
  PVector pos;
  float min = 5;
  float max = 60;
  int col;
  
  void draw(){}
}

class Bubble extends Particle {
  
  float size, speed;

  Bubble(float x, float y) {
    pos = new PVector(x, y);
    col = color(random(360), 99, 99, 40);
    speed = random(1);
  }

  void draw() {
    fill(col);
    ellipse(pos.x, pos.y, size, size);

    size+=speed;
    if (size>max) {
      float r = random(300);
      float angle = radians((int)random(0, 359));
      this.pos = new PVector(width/2+cos(angle)*r, height/2+sin(angle)*r);
      size=0;
    }
  }
}
