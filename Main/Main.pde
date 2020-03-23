/* Main file where coordination is executed*/

/* The main window */

View window = new ExampleView(0, 0, 700, 700);

/* Setul initial window */
void setup() {
  size(700, 700);
  
  textFont(createFont("Arial", 30, true));
  //window.setLabels("People", "Handshakes", "A simple graph");

  window.setupView();
}

/* Draw window */
void draw() {
  window.drawView();
}


/* Forward mouse events */
void mousePressed() { window._mousePressed(); window.mousePressedAnywhere(); }

void mouseReleased() { window._mouseReleased(); window.mouseReleasedAnywhere(); }

void mouseMoved() { window._mouseMoved(); window.mouseMovedAnywhere(); }

void mouseDragged() { window._mouseDragged(); window.mouseDraggedAnywhere(); }

/* Forward keyboard events */
void keyPressed() { window.keyPressed(); }

void keyReleased() { window.keyReleased(); }
