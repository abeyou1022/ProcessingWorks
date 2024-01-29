int VECTOR = 7;
int WIDTH = 240;
float N = 1000.0;
float LOTATE_PARAM = 0.0001;
float ANGLE_PARAM = 0.01;

size(500, 500);
background(0);
translate(250, 250);
stroke(135, 202, 255);
for (int n=0; n<N; n++) {
  rotate(n*LOTATE_PARAM);
  float r =abs(sin(n*ANGLE_PARAM))*WIDTH;
  for (int i=0; i<VECTOR; i++) {
    float ang =radians(360*i/VECTOR);
    point(cos(ang)*r, sin(ang)*r);
  }
}
