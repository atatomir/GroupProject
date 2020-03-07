class SnowView extends View {
  int flakesLimit = 100, countFlakes = 0;
  Snowflake[] flakes = new Snowflake[flakesLimit];
  int timeLimit = 10;
  int currentLimit = 0;
  
  
  SnowView(float posX, float posY, float width, float height) {
    super(posX, posY, width, height);
    countFlakes = 0;
    currentLimit = 0;
  }
  
  SnowView() {
    super();
    countFlakes = 0;
    currentLimit = 0;
  }
  
  void setup() {
    super.setup();
    setCatchMouse(false);
  }
  
  void draw() {
    super.draw();
 
    for (int i = 0; i < countFlakes; i++) {
       flakes[i].update();
       if (flakes[i].melted(width, height)) {
         flakes[i] = flakes[countFlakes - 1];
         countFlakes--; i--;
       } else {
         flakes[i].draw(); 
       }
    }
    
    if (countFlakes < flakesLimit && ++currentLimit == timeLimit) {
      generateFlake();
      currentLimit = 0;
    }
  }
  
  void generateFlake() {
    flakes[countFlakes] = new Snowflake(random(0, width), 0, 5, random(PI / 4, 3 * PI / 4), 1);
    flakes[countFlakes].draw();
    countFlakes++;
  }
  
}

class Snowflake {
   float x, y;
   float r;
   float alfa, speed;
   
   Snowflake(float x, float y, float r, float alfa, float speed) {
     this.x = x;
     this.y = y;
     this.r = r;
     this.alfa = alfa;
     this.speed = speed;
   }
   
   void update() {
     x += speed * cos(alfa);
     y += speed * sin(alfa);
   }
   
   boolean melted(float limitX, float limitY) {
     return x < r || x > limitX - r || y > limitY - r; 
   }
   
   void draw() {
     fill(255);
     ellipseMode(CENTER);
     //fill(random(0, 255), random(0, 255), random(0, 255));
     ellipse(x, y, r * 2, r * 2); 
   }
}
