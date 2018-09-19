class Brick {

  PVector pos;
  int level;
  color col;
  private float alpha;
  float w = 80, h = 20;
  boolean isDead = false;

  Brick(float x, float y, int lvl, color col) {
    this.pos = new PVector(x, y);
    this.level = lvl;
    this.col = col;
  }

  void show() {
    if (isDead) return;

    switch (level) {
    case 3: 
      alpha = 255;
      break;
    case 2: 
      alpha = 175;
      break;
    case 1: 
      alpha = 95;
    }
    stroke(0);
    fill(col, alpha);
    rect(pos.x, pos.y, w, h, 10);
  }

  void isHit(Ball b) {
    if (b.pos.x + b.r > pos.x && b.pos.x -b.r < pos.x+w && b.pos.y + b.r > pos.y && b.pos.y - b.r < pos.y + h && !isDead) {  
      level--;
      if (level == 0 ) isDead = true;      
      if (b.pos.y-b.r<pos.y+h && b.vel.y <0) b.vel.y  *= -1;
      //else if (b.pos.y + b.r > pos.y && b.vel.y > 0) b.vel.y  *= -1;
    }
  }
}
