class StackView extends View {
  boolean splitX;
  
  StackView(float posX, float posY, float width, float height, boolean splitX) {
    super(posX, posY, width, height); 
    this.splitX = splitX;
  }
  
  float totalWeightOfSubviews() {
    float aux = 0;
    for (int i = 0; i < scount; i++)  
      if (!views[i].hidden)
        aux += views[i].viewWeight;
    return aux;
  }
  
  void align() {
    float total = totalWeightOfSubviews();
    float current = 0;
    
    for (int i = 0; i < scount; i++) {
      if (views[i].hidden) continue;
      
      float newX, newY, newWidth, newHeight;
      if (splitX) {
        newX = posX + (width / total) * current;
        newY = 0;
        newWidth = views[i].viewWeight * width / total;
        newHeight = height;
      } else {
        newX = 0;
        newY = posY + (height / total) * current;
        newWidth = width;
        newHeight = views[i].viewWeight * height / total;
      }
      current += views[i].viewWeight;
      
      views[i].resize(newWidth, newHeight);
      views[i].reposition(newX, newY);
      views[i].align();
    }
  }
 
}
