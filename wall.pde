class Wall {
  PVector pos;
  PVector size;
  
  Wall(int x, int y, int oWidth, int oHeight) {
    this.pos = new PVector(x, y);
    this.size = new PVector(oWidth, oHeight);
  }
  
  // --------------------------------------------------
  
  void show() {
    noStroke();
    fill(0,0,255);
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  // --------------------------------------------------
  
  boolean isDotColiding(PVector dot) {
    if ((pos.x < dot.x && (pos.x + size.x) > dot.x) && (pos.y < dot.y && (pos.y + size.y) > dot.y)) {
      return true;
    }
    return false;
  }
}
