class GraphView extends View {
  int points;
  float[] dataX, dataY, origX, origY;
  String labelX = "X", labelY = "Y";
  String title = "Graph";
  
  float x0, y0, x1, y1, x2, y2, x3, y3; 
  color graphColor = color(0);
  float eps = 1e-5;
  float stage = 0, rate;
  
  GraphView(float posX, float posY, float width, float height, int points, float[] dataX, float[] dataY, float speed) { 
    super(posX, posY, width, height);
    this.points = points;
    this.origX = dataX;
    this.origY = dataY;
    rate = speed;
  }
  
  GraphView(int points, float[] dataX, float[] dataY, float speed) {
    super(); 
    this.points = points;
    this.origX = dataX;
    this.origY = dataY;
    rate = speed;
  }
  
  void setLabels(String xx, String yy, String title) {
    labelX = xx;
    labelY = yy;
    this.title = title;
  }
  
  void setup() {
    super.setup();
    setBackground(color(255));
    transformData();
    
    stage = 0;
    align();
  }
  
  void draw() {
    super.draw();
    
    // Rotate graph
    pushMatrix();
    translate(0, height / 2);
    scale(1, -1);
    translate(0, -height / 2);
    
    fill(graphColor);
    stroke(graphColor);

    drawAxis();
    drawData(0.01 * stage);
    
    stage = min(stage + rate, 100);
      
    popMatrix();
  }
  
  void align() {
    super.align();
    
    x0 = pointBetween(0, width, 0.1);
    x1 = pointBetween(0, width, 0.2);
    x2 = pointBetween(0, width, 0.8);
    x3 = pointBetween(0, width, 0.9);
    
    y0 = pointBetween(0, height, 0.1);
    y1 = pointBetween(0, height, 0.2);
    y2 = pointBetween(0, height, 0.8);
    y3 = pointBetween(0, height, 0.9);
  }
  
  void drawData(float stage) {
    boolean done = false;
    
    for (int i = 0; i < points && !done; i++) {
      float currX = dataX[i];
      float currY = dataY[i];
      if (dataX[i] >= stage - eps && i > 0) {
        done = true;
        currX = stage;
        currY = pointBetween(dataY[i - 1], dataY[i], getRatio(dataX[i - 1], stage, dataX[i]));
      } 
      
      ellipse(pointBetween(x1, x2, currX), pointBetween(y1, y2, currY), 10, 10);
 
      if (i > 0)
        line(pointBetween(x1, x2, dataX[i - 1]), pointBetween(y1, y2, dataY[i - 1]), 
             pointBetween(x1, x2, currX), pointBetween(y1, y2, currY));
    }
  }
  
  void transformData() {
    float minX, maxX, minY, maxY;
    minX = minY = 1e30;
    maxX = maxY = -1e30;
    
    for (int i = 0; i < points; i++) {
      minX = min(minX, origX[i]); 
      minY = min(minY, origY[i]); 
      maxX = max(maxX, origX[i]); 
      maxY = max(maxY, origY[i]); 
    }
    
    dataX = new float[points];
    dataY = new float[points];
    
    for (int i = 0; i < points; i++) {
      dataX[i] = getRatio(minX, origX[i], maxX); 
      dataY[i] = getRatio(minY, origY[i], maxY); 
    }
  }
  
  void drawAxis() {    
     line(x0, y0, x3, y0);
     line(x0, y0, x0, y3);
     textAlign(CENTER);
     
     // draw x-axis
     textSize(sizeToMatch(labelX, x3 - x0, y0 * 0.8));
     transText(labelX, pointBetween(x0, x3, 0.5), y0 / 2, 0, 1, -1);
     
     textSize(sizeToMatch(str(dataX[0]), (x2 - x1) / points, y0 / 2.5));
     for (int i = 0; i < points; i++) {
       transText(str(int(origX[i])), pointBetween(x1, x2, dataX[i]), y0 * 0.83, 0, 1, -1); 
     }
     
     // draw y-axis
     textAlign(CENTER);
     textSize(sizeToMatch(labelY, y3 - y0, x0 * 0.8));
     transText(labelY, x0 / 2, pointBetween(y0, y3, 0.5), PI/2, 1, -1);
     
     textSize(sizeToMatch(str(dataY[0]), (y2 - y1) / points, x0 / 2.5));
     for (int i = 0; i < points; i++) {
       transText(str(int(origY[i])), x0 * 0.83, pointBetween(y1, y2, dataY[i]), 0, 1, -1); 
     }
     
     // draw title
     textAlign(CENTER);
     textSize(sizeToMatch(title, x3 - x0, height - y3));
     transText(title, pointBetween(x0, x3, 0.5), y3, 0, 1, -1);
  }
  
}
