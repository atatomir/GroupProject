/* Button: a simple button that can be pressed */
class Button extends View {
  Action action;
  
  String label;
  color textColor = color(0);
  PFont textFont = createFont("Arial", 30, true);
  
  
  Button(float posX, float posY, float width, float height, Action action, String label) {
    super(posX, posY, width, height);
    this.action = action;
    this.label = label;
  }
  
  Button(Action action, String label) {
    super();
    this.action = action;
    this.label = label;
  }
  
  void draw() {
    super.draw();
    
    if (mouseInside()) {
      if (mousePressed == true)
        drawDown();
      else
        drawOver();
    } else {
      drawUp();
    }
    drawText();
  }
  
  /* Functions below need to be implemented */
  void drawUp() {
    background(150);
  }
  
  void drawOver() {
    background(100);
  }
  
  void drawDown() {
    background(50);
  }
  
  void drawText() {
    textFont(textFont, sizeToMatch(label, width, height));
    fill(textColor);
    textAlign(CENTER);
    text(label, width / 2, height / 2 + textDescent());
  }
  
  void mousePressed() {
    if (!mouseInside() || action == null) return;
    action.apply();
  }
}
