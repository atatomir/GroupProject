/* LayerView: A view with multiple layered subviews */
class LayerView extends View {
  LayerView(float posX, float posY, float width, float height) {
    super(posX, posY, width, height); 
  }
  
  LayerView() {
    super(); 
  }
  
  void align() {
    for (int i = 0; i < scount; i++) {
      if (views[i].hidden) continue;
      
      views[i].resize(width, height);
      views[i].reposition(0, 0);
      views[i].align();
    }
  } 
}
