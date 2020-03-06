class PopupView extends View {
  View currentView;
  Button closeButton = new Button(0, 0, 30, 30, new KillViewAction(this), "X");
  
  PopupView(float posX, float posY, float width, float height, View current) {
    super(posX, posY, width, height); 
    currentView = current;
  }
  
  PopupView(View current) {
    super();
    currentView = current;
  }
  
  void setup() {
    super.setup();
    
    currentView.resize(width, height);
    currentView.reposition(0, 0);
    addSubview(currentView);
    addSubview(closeButton);
  }
  
  void align() {
    currentView.resize(width, height);
    currentView.reposition(0, 0);
  }
  
}
