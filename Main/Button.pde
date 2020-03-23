/* Button: a simple button that can be pressed */

class Button extends View {
  Action action;

  String label;
  color textColor = color(0);
  PFont textFont = createFont("Arial", 30, true);
  
  final static int bUP = 0, bDOWN = 2, bOVER = 1;
  int status = bUP;
  boolean enable = true;

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
    
    if (!enable) {
      drawDisable();
      drawText();
      return;
    }
    
    if (!mousePressed) status = min(status, bOVER);
    if (!mouseInside()) status = bUP;

    switch(status) {
    case bUP: 
      drawUp();
      break;
    case bDOWN: 
      drawDown();
      break;
    case bOVER:
      drawOver();
      break;
    default:
      println("Error in button's status");
    }

    drawText();
  }
  
  void setEnable(boolean flag) {
    enable = flag; 
  }

  /* Functions below need to be implemented */
  void drawDisable() {
    background(200);
  }
  
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
    status = bDOWN;
    if (action != null) action.apply();
  }
  
  void mouseMoved() {
    status = bOVER;
  }
  
}
