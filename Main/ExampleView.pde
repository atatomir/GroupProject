/* A simple example just to demonstrate how it works*/
class ExampleView extends LayerView {
  
  ExampleView(float posX, float posY, float width, float height) {
    super(posX, posY, width, height); 
  }
  
  ExampleView() {
    super();
  }

  void setup() {
    size(700, 700);
    //frameRate(40);

    View snow = new SnowView();
    View main = new StackView(true);
    View ball1 = new BallView(30, 1.5);
    View ball2 = new BrownianView();
    View menu = new StackView(false);
    View button = new Button(new RestartViewAction(ball1), "Reset Ball");
    View button2 = new Button(new IncreaseWeightAction(ball2, 0.3), "Increase Brownian");
    View button3 = new Button( new IncreaseWeightAction(ball2, -0.3), "Decrease Brownian");
    View button4 = new Button(new HideAction(ball1, ball2), "Change");

    // Add views to the window
    this.addSubview(main);
    this.addSubview(snow);
    main.addSubview(ball1);
    main.addSubview(ball2);
    main.addSubview(menu);
    menu.addSubview(button);
    menu.addSubview(button2);
    menu.addSubview(button3);
    menu.addSubview(button4);
  }
}
