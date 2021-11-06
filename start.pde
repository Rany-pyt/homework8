class Start {
  PVector pos;
  
  Start(int x, int y) {
    pos = new PVector(x,y);
  }
  
  // --------------------------------------------------
  
  void show() {
    noStroke();
    fill(200,0,255);
    ellipse(pos.x, pos.y, 10,10);
  }
}
