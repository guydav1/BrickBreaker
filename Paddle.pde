class Paddle {

  PVector pos;
  float w = 70; 
  float h = 15;

  Paddle() {
    this.pos = new PVector(width/2+w/2, height -h*2);
  }


  public void update() {
    this.pos.x = mouseX;
  }

  public void show() {
    rect(pos.x, pos.y, w, h);
  }
}
