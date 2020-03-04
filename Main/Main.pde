/* Main file where coordination is executed*/

/* The main window */
View window = new ExampleView(0, 0, 700, 700);

/* Setul initial window */
void setup() {
  size(700, 700);
  //frameRate(40);

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
