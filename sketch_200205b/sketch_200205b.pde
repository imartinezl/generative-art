
float zoff = 0;
float zstep = 0.01;
//color [] colors = { #ff2e63, #08d9d6, #252a34, #eaeaea, #ffc7c7 }; 
color [] colors = { #ECD078,#D95B43,#C02942,#542437,#53777A,#ECD078,#D95B43,#C02942}; 

void setup() {
  size(600, 600);
  smooth();
  noiseDetail(2);
  //frameRate(5);
}

void draw() {
  backnoise();
}


void backnoise() {
  loadPixels();

  float step = 0.007;
  float xstep = step;
  float ystep = step;

  float xoff = 0;
  for (int x = 0; x < width/2; x++) {
    float yoff = 0;
    for (int y = 0; y < height/2; y++) {
      
      float n = noise(xoff+zoff, yoff, zoff);
      //float value = (sin(n) + 1)*0.5*255;
      float value = n*255;
      color c = color(value, 0, 0);
      if (value < 80) {
        c = colors[0];
      } else if (value < 100) {
        c = colors[1];
      } else if (value < 130) {
        c = colors[2];
      } else if (value < 200) {
        c = colors[3];
      } else {
        c = colors[4];
      }
      int index_ne = y*width + x;
      pixels[index_ne] = c;
      int index_nw = (y+1)*width - (x+1);
      pixels[index_nw] = c;
      int index_se = (height-(y+1))*width + x;
      pixels[index_se] = c;
      int index_sw = (height-(y+2))*width - (x+1);
      pixels[index_sw] = c;
      yoff += ystep;
    }
    xoff += xstep;
  }
  zoff += zstep;
  //if(zoff > 1 || zoff < 0){
  //  zstep *= -1;
  //}
  //println(cont);

  updatePixels();
  
  saveFrame("figures/fig_#####.jpg");
}
