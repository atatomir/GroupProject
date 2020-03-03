/* Main file where coordination is executed*/

/* The main window */
View window = new StackView(0, 0, 700, 700, true);


/* Setul initial window */
void setup() {
  size(700, 700);
  
  View ball1 = new BallView(0, 0, 0, 0, 30, 1.5);
  View ball2 = new BrownianView(0, 0, 0, 0);
  View menu = new StackView(0, 0, 0, 0, false);
  View button = new Button(0, 0, 0, 0, new RestartViewAction(ball1), "Reset Ball");
  View button2 = new Button(0, 0, 0, 0, new IncreaseWeightAction(ball2, 0.3), "Increase Brownian");
  View button3 = new Button(0, 0, 0, 0, new IncreaseWeightAction(ball2, -0.3), "Decrease Brownian");
  View button4 = new Button(0, 0, 0, 0, new HideAction(ball1, ball2), "Change");

  // Add views to the window
  window.addSubview(ball1);
  window.addSubview(ball2);
  window.addSubview(menu);
  menu.addSubview(button);
  menu.addSubview(button2);
  menu.addSubview(button3);
  menu.addSubview(button4);

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
