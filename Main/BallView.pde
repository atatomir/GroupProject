class BallView extends View {
  float x, y, dx, dy, ballColor = 255;
  float r = 10;
  char inside = ' ';
  
  BallView(float posX, float posY, float width, float height, float r, float speed) {
    super(posX, posY, width, height); 
    this.r = r;
    dx = 2 * speed;
    dy = 0.5 * speed;
  }
  
  void setup() {
    super.setup();
    x = width / 2;
    y = height / 2;
  }
  
  void draw() {
    super.draw();
    update();
    x += dx; y += dy;
    fill(ballColor, 0, 0);
    ellipseMode(CENTER);
    ellipse(x, y, 2 * r, 2 * r);
    drawText();
  }
  
  void align() {
    super.align();
    r = constrain(r, 0, width / 4);
    r = constrain(r, 0, height / 4);
    
    x = constrain(x, r, width - r);
    y = constrain(y, r, height - r);
  }
  
  void update() {
    if (x - r < 0 || x + r > width) dx *= -1;
    if (y - r < 0 || y + r > height) dy *= -1;
  }
  
  void drawText() {  
    fill(255);
    textSize(sizeToMatch("" + inside, 2.0 * r, 2.0 * r));
    textAlign(CENTER);
    text(inside, x, y + textDescent());
  }
  
  void mousePressed() {
    super.mousePressed();
    if (mouseInside()) ballColor = int(random(0, 256));
  }
  
  void keyPressed() {
     inside = key;
  }
}
