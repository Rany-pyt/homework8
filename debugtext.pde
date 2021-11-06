class DebugText {
  PVector pos;
  
  boolean isVisible = true;
  
  DebugText(int x, int y) {
    pos = new PVector(x, y);
  }
  
  void show() {
    if (isVisible) {
      fill(0);
      String text = "generation: " + population.gen + "   -   min step: " + population.minStep;
      text(text, pos.x, pos.y);
    }
  }
  
  
  
}
