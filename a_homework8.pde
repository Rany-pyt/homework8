Population population;
Goal goal;
Wall wall;
DebugText text;
Start start;

void setup() {
  size(800,900);
  population = new Population(1000);
  start = new Start(width/2, height/3*2);
  goal = new Goal(400, 10);
  wall = new Wall(100, 300, 600, 10);
  text = new DebugText(10, height - 10);
}


void draw() {
  background(255);
  
  start.show();
  goal.show();
  wall.show();
  text.show();
  
  if(population.allDotsDead()) {
    population.calculateFitness();
    population.naturalSelection();
    population.mutateBabies();
  } else {
    population.update();
    population.show();
  }
}
