/* View: a drawing on screen following some patterns */
class View {
  /* Own information */
  float posX, posY, width, height;
  View parent = null;
  int viewId;
  
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
    pushMatrix();
    translate(posX, posY);
    
    // draw this view
    draw();
    
    // draw subviews
    for (int i = 0; i < scount; i++) 
      views[i].drawView();
      
    popMatrix();
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
  
  /* Default setup */
  void setup() {
    background(255);
  }
  
  /* Default draw */
  void draw() {
    background(255);
  }
}