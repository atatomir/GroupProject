/* Main file where coordination is executed*/

/* The main window */
View window = new StackView(0, 0, 500, 500, true);

View ball1 = new BallView(0, 0, 250, 250, 15, 3);
View ball2 = new BrownianView(250, 250, 250, 250);

void setup() {
  size(500, 500);
  
  // Add views to the window
  window.addSubview(ball1);
  window.addSubview(ball2);
  
  window.setupView();
}

void draw() {
  window.drawView();
}

void mouseClicked() {
  View v;
  if (window.scount % 2 == 0)
    v = new BallView(0, 0, 0, 0, 20, 2);
  else
    v = new BrownianView(0, 0, 0, 0);
    
  window.addSubview(v);
}

void keyPressed() {
  int x = (window.scount - 1) / 2;
  window.views[x].kill();
}
