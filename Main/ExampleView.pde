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
    View button = new Button(new RestartViewAction(ball1), "Reset Ball");
    View button2 = new Button(new IncreaseWeightAction(ball2, 0.3), "Increase Brownian");
    View button3 = new Button( new IncreaseWeightAction(ball2, -0.3), "Decrease Brownian");
    View button4 = new Button(new HideAction(ball1, ball2), "Change");
    
    float[] dataX = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    float[] dataY = {0, 1, 3, 6, 10, 15, 21, 28, 36, 45};
    View button5 = new Button(new CreateGraphPopupAction(this, 10, dataX, dataY), "See graph");

    // Add views to the window
    this.addSubview(layers);
    layers.addSubview(main);
    layers.addSubview(snow);
    main.addSubview(ball1);
    main.addSubview(ball2);
    main.addSubview(menu);
    menu.addSubview(button);
    menu.addSubview(button2);
    menu.addSubview(button3);
    menu.addSubview(button4);
    menu.addSubview(button5);
  }
  

}
