Blob b;
Blob[] blobs = new Blob[10];

void setup() {
  size(400, 400);
  colorMode(HSB);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height), 40);
  }
}

void draw() {
  // println(frameRate);
  loadPixels();
  for (int x=0; x < width; x++) {
    for (int y=0; y < height; y++) {
      int index = x + y*height;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        float k = 1200; //map(mouseX, 0, width, 0, 10000);
        sum += k / d;
      }
      pixels[index] = color(sum, 255, 255);
    }
  }
  updatePixels();
  for (Blob b : blobs) {
    // b.show();
    b.update();
  }
  
  saveFrame("output/image_######.tiff");
}
