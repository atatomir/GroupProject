class StackView extends View {
  boolean splitX;
  
  StackView(float posX, float posY, float width, float height, boolean splitX) {
    super(posX, posY, width, height); 
    this.splitX = splitX;
  }
 
  
  void align() {
    for (int i = 0; i < scount; i++) {
      float newX, newY, newWidth, newHeight;
      if (splitX) {
        newX = posX + (width / scount) * i;
        newY = 0;
        newWidth = width / scount;
        newHeight = height;
      } else {
        newX = 0;
        newY = posY + (height / scount) * i;
        newWidth = width;
        newHeight = height / scount;
      }
      views[i].resize(newWidth, newHeight);
      views[i].reposition(newX, newY);
      views[i].align();
    }
  }
 
}
