class Slider extends View {
  Action action;
  float x1, x2, y, current;
  float radius = 25;
  boolean active = false;

  
  Slider(float posX, float posY, float width, float height, Action action, float current) {
    super(posX, posY, width, height); 
    this.action = action;
    this.current = current;
  }
  
  Slider(Action action, float current) {
    super();
    this.action = action;
    this.current = current;
  }
  
  void setup() {
    super.setup();
    setBackground(color(150));
    
  }
  
  void draw() {
    super.draw();
    
    fill(color(0));
    stroke(color(0));
    ellipseMode(CENTER);
    
    line(x1, y, x2, y);
    ellipse(x1, y, 10, 10);
    ellipse(x2, y, 10, 10);
    
    stroke(color(255));
    ellipse(pointBetween(x1, x2, current), y, radius, radius);
  }
  
  void align() {
    super.align();
    x1 = pointBetween(0, this.width, 0.1);
    x2 = pointBetween(0, this.width, 0.9);
    y = pointBetween(0, this.height, 0.5);
  }
  
  void mousePressed() {
    float xSlider = pointBetween(x1, x2, current);
    active = (distance(mouseX, mouseY, getX(xSlider), getY(y)) <= radius);
  }
  
  void mouseReleasedAnywhere() {
    super.mouseReleasedAnywhere();
    active = false;
  }
  
  void mouseDraggedAnywhere() {
    super.mouseDraggedAnywhere();
    
    if (!active) return;
    current = getRatio(getX(x1), 1.0 * mouseX, getX(x2));
    if (action != null) action.apply(current);
  }
  

}
