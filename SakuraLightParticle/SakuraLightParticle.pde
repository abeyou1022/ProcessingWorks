Light[] lights = new Light[300]; 

final int YAMA_ZAKURA = #FF7EB0;
final int SOMEIYOSHINO = #FBE5EB;
final int YAE_ZAKURA = #FF468A;
final int MAGENDA = #FF00FF;

int[] sakuraColor = {YAMA_ZAKURA, SOMEIYOSHINO, YAE_ZAKURA, MAGENDA};


void setup(){
  size(500,500);
  smooth();
  imageMode(CENTER);
  blendMode(SCREEN); //LIGHTEST, SCREEN, ADDあたりがきれい
  background(0);
  
  create();
}

void create(){
  for(Light light : lights){
    float r = random(200);
    float angle = radians((int)random(0,359));
    light = new Light(width/2+cos(angle)*r,height/2+sin(angle)*r,sakuraColor[(int)random(4)],5);
    light.render();
  }
}

void draw(){
  
}

class Light {
  PImage light; //出力する光（画像）
  float x, y;
  
  //光の大きさの指定なし（デフォルト値は5）
  Light(float x, float y, color col) {
    this.x = x;
    this.y = y;

    int r = col>>16&0xFF;
    int g = col>>8&0xFF;
    int b = col&0xFF;

    light = createLight(r, g, b, 5);
  }
  
  //光の大きさの指定あり
  Light(float x, float y, color col, int size){
    this.x = x;
    this.y = y;
    
    int r = col>>16&0xFF;
    int g = col>>8&0xFF;
    int b = col&0xFF;
    
    light = createLight(r, g, b, size);
  }

  PImage createLight(int r, int g, int b, int size) {
    int side = size*20; //画像の大きさ
    int lightPower = size;  //光の大きさ
    float center = side/2;
    PImage img = createImage(side, side, RGB);

    for (int y = 0; y < side; y++) {
      for (int x = 0; x < side; x++) {

        float w = 1;  //色が薄くなっていくための係数

        //三平方の定理より中心からの画素の色を計算する
        float dx = center - x;
        float dy = center - y;
        float distance = sqrt(dx * dx + dy * dy);
        
        //減衰
        w = 255/pow(distance, 1.7); 
        if(distance>5) w *= 10/distance;
        
        img.pixels[x+y*side] = color(r/distance*lightPower*w, g/distance*lightPower*w, b/distance*lightPower*w);
      }
    }

    return img;
  }

  //出力
  void render() {
    image(light, x, y);
  }
}
