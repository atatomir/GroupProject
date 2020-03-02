/* Main file where coordination is executed*/

/* The main window */
View window = new StackView(0, 0, 500, 500, true);


/* Setul initial window */
void setup() {
  size(500, 500);
  
  View ball1 = new BallView(0, 0, 250, 250, 15, 3);
  View ball2 = new BrownianView(250, 250, 250, 250);

  // Add views to the window
  window.addSubview(ball1);
  window.addSubview(ball2);

  window.setupView();
}

/* Draw window */
void draw() {
  window.drawView();
}


/* Forward mouse events */
void mousePressed() { window.mousePressed(); }

void mouseReleased() { window.mouseReleased(); }

void mouseMoved() { window.mouseMoved(); }

void mouseDragged() { window.mouseDragged(); }

/* Forward keyboard events */
void keyPressed() { window.keyPressed(); }

void keyReleased() { window.keyReleased(); }
