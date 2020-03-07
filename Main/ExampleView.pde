/* A simple example just to demonstrate how it works*/
class ExampleView extends View {
  
  ExampleView(float posX, float posY, float width, float height) {
    super(posX, posY, width, height); 
  }
  
  ExampleView() {
    super();
  }

  void setup() {
   
    View layers = new LayerView(0, 0, width, height);
    View snow = new SnowView();
    View main = new StackView(true);
    View ball1 = new BallView(30, 1.5);
    View ball2 = new BrownianView();
    View menu = new StackView(false);
    View brownianMenu = new StackView(true);
    Button button = new Button(new RestartViewAction(ball1), "Reset Ball");
    View button2 = new Button(new IncreaseWeightAction(ball2, 0.3), "Increase Brownian");
    View button3 = new Button( new IncreaseWeightAction(ball2, -0.3), "Decrease Brownian");
    View button4 = new Button(new HideAction(ball1, ball2), "Change");
    
    
    int cnt = 31;
    float[] dataX = new float[cnt];
    float[] dataY = new float[cnt];
    for (int i = 0; i < cnt; i++) {
      dataX[i] = i;
      dataY[i] = (cnt / 2 - i) * (cnt / 2 - i);
    }
    View button5 = new Button(new CreateGraphPopupAction(this, cnt, dataX, dataY), "See graph");
    Button button6 = new Button(new ToggleButtonAction(button), "Disable top button");

    // Add views to the window
    this.addSubview(layers);
    layers.addSubview(main);
    layers.addSubview(snow);
    brownianMenu.addSubview(button2);
    brownianMenu.addSubview(button3);
    main.addSubview(ball1);
    main.addSubview(ball2);
    main.addSubview(menu);
    menu.addSubview(button);
    menu.addSubview(brownianMenu);
    menu.addSubview(button4);
    menu.addSubview(button5);
    menu.addSubview(button6);
  }
  

}
