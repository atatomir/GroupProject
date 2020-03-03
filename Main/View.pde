/* View: a drawing on screen following some patterns */
class View {
  /* Own information */
  View parent = null;
  color backgroundColor = color(255);
  float posX, posY, width, height;
  float viewWeight = 1.0;
  int viewId;
  boolean hidden = false;
  
  
  /* Subviews */
  int scount = 0;
   View[] views = new View[100];
  
  /* Create a new view */
  View(float posX, float posY, float width, float height) {
    resize(width, height);
    reposition(posX, posY);
  }
  
  /* Align subviews */
  void align() {
    // Nothing here yet..
  }
  
  /* Add new subview */
  void addSubview(View view) {
    views[scount] = view;
    view.viewId = scount;
    view.parent = this;
    scount++;
    
    align();
    view.setupView();
  }
  
  /* Remove subview */
  void removeSubview(int id) {
    for (int i = id; i + 1 < scount; i++) {
      views[i] = views[i + 1];
      views[i].viewId = i;
    }
    scount--;
    align();
  }
  
  /* Remove this view */
  void kill() {
     for (int i = scount - 1; i >= 0; i--)
       views[i].kill();
       
     if (parent != null) parent.removeSubview(viewId);
  }
  
  /* Manage size */
  void resize(float width, float height) {
    this.width = width;
    this.height = height;
  }
  
  /* Manage position */
  void reposition(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
  }
  
  /* Change weight */
  void changeWeight(float weight) {
    viewWeight = weight; 
    if (parent != null) parent.align();
  }
  
  /* Set hidden */
  void setHidden(boolean hidden) {
    this.hidden = hidden;
    if (parent != null) parent.align();
  }
  
  /* Find real coordiantes */
  float getX(float x) {
    if (parent == null) return posX + x;
    return parent.getX(0) + posX + x;
  }
  
  float getY(float y) {
    if (parent == null) return posY + y;
    return parent.getY(0) + posY + y;
  }
  
  /* Setup with translation included */
  void setupView() {
    pushMatrix();
    translate(posX, posY);
    
    // setup this view
    setup();
    align();
    
    // setup subviews
    for (int i = 0; i < scount; i++) 
      views[i].setupView();
    
    popMatrix();
  }
  
  /* Draw with translation included */
  void drawView() {
    if (hidden) return;
    pushMatrix();
    translate(posX, posY);
    
    // draw this view
    draw();
    
    // draw subviews
    for (int i = 0; i < scount; i++) 
      views[i].drawView();
      
    popMatrix();
  }
  
  /* Forward mouse events */
  void mousePressed() {
     for (int i = 0; i < scount; i++)
       views[i].mousePressed();
  }
  
  void mouseReleased() {
    for (int i = 0; i < scount; i++)
       views[i].mouseReleased();
  }
  
  void mouseMoved() {
    for (int i = 0; i < scount; i++)
       views[i].mouseMoved();
  }
  
  void mouseDragged() {
    for (int i = 0; i < scount; i++)
       views[i].mouseDragged();
  }
  
  boolean mouseInside() {
     return getX(0) <= mouseX && mouseX <= getX(width) &&
            getY(0) <= mouseY && mouseY <= getY(height);
  }
  
  /* Forward keyboard events */
  void keyPressed() {
    for (int i = 0; i < scount; i++)
       views[i].keyPressed();
  }
  
  void keyReleased() {
   for (int i = 0; i < scount; i++)
       views[i].keyReleased(); 
  }
  
  /* Set backround to RGB color */
  void background(float r, float g, float b) {
     fill(r, g, b);
     rect(0, 0, width, height);
  }
  
  /* Set background to BW color */
  void background(float w) {
     fill(w);
     rect(0, 0, width, height);
  }
  
  /* Set background to some color */
  void background(color c) {
     fill(c);
     rect(0, 0, width, height);
  }
  
  /* Default setup */
  void setup() {
    // nothing here
  }
  
  /* Default draw */
  void draw() {
    background(backgroundColor);
  }
}
