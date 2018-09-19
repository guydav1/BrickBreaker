class Obstacle {
  
  PVector pos;
  int level;
  color col;
  float w = 100,h = 25;
  boolean isDead = false;
  
  Obstacle(float x , float y, int lvl, color col) {
    this.pos = new PVector(x,y);
    this.level = lvl;
    this.col = col;
  }
  
  void show() {
    if(isDead) return;
     stroke(col);
     //fill(col);
     rect(pos.x,pos.y,w,h); 
  }
  
  void isHit(Ball b) {
     if(b.pos.x + b.r > pos.x && b.pos.x -b.r < pos.x+w && b.pos.y + b.r > pos.y && b.pos.y  < pos.y + h && !isDead) {
      isDead = true; 
      b.vel.y  *= -1;
     }
  }
}
