class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;
  
  float fitness = 0.0f;
  
  Dot() {
    brain = new Brain(400);
    
    pos = new PVector(width/2, height/3*2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  // --------------------------------------------------
  
  void show() {
    if (isBest) {
      noStroke();
      fill(0,255,0);
      ellipse(pos.x, pos.y, 10,10);
    } else {
      fill(255,50,0);
      ellipse(pos.x, pos.y, 4,4);
    }
  }
  
  // --------------------------------------------------
  
  void move() {
    if (brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
      dead = true;
    }
    
    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }
  
  // --------------------------------------------------
  
  float distToGoal() {
    return dist(pos.x, pos.y, goal.pos.x, goal.pos.y);
  }
  
  // --------------------------------------------------
  
  void update() {
    if (!dead && !reachedGoal) {
      move();
      if (pos.x < 2 || pos.y < 2 || pos.x > width-2 || pos.y > height-2) {
        dead = true;
      } else if (wall.isDotColiding(new PVector(pos.x, pos.y))) {
        dead = true;
      } else if (distToGoal() < 5) {
        // if reached goal
        reachedGoal = true;
      }
    }
  }
  
  // --------------------------------------------------
  
  void calculateFitness() {
    if (reachedGoal) {
      fitness = 1.0/16.0 + 1000.0/(float)(brain.step * brain.step);
    } else {
      float distanceToGoal = distToGoal();
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }
  
  // --------------------------------------------------
  
  Dot giveBaby() {
    Dot baby = new Dot();
    baby.brain = brain.clone(); 
    return baby;
  }
}
