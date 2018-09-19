class Paddle {

  PVector pos;
  float w = 110; 
  float h = 15;

  Paddle() {
    this.pos = new PVector(width/2+w/2, height -h*2);
  }


  public void update() {
    this.pos.x = mouseX - w/2;
  }

  public void show() {
    fill(255,120,30);
    rect(pos.x, pos.y, w, h,7);
  }
}
