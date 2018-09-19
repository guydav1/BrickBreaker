class Ball {

  PVector pos;
  PVector vel;
  color col = color(200, 30, 50);
  PVector jump = new PVector(0, -2);
  float r = 10;

  float speed = 7;

  Ball(float x, float y) {
    pos = new PVector();
    pos.set(x, y);
    vel = new PVector(0, 0);
  }



  void update() {

    pos.add(vel);


    if (pos.x-r<0) {
      pos.x = r;
      vel.x *= -1;
    } else if (pos.x + r >width) {
      pos.x = width -r;
      vel.x *= -1;
    } else if (pos.y-r<0) {
      pos.y += r;
      vel.y *= -1;
    } else if (pos.y - r > height) {
      lives--;
      pos.set(width/2, height/2);
      vel.set(0, 0);
    }
  }

  void show() {
    fill(col);
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  void paddleCollision(Paddle p) {
    if (pos.y+r > p.pos.y && pos.y+r < p.pos.y+r && pos.x > p.pos.x-r && pos.x < p.pos.x+p.w+r && vel.y>0) {
      float dif = pos.x - (p.pos.x + p.w/2);
      float angle = map(dif, -p.w/2, p.w/2, 220, 320);      
      angle = radians(angle);
      vel.x = speed * cos(angle);
      vel.y = speed * sin(angle);
    }
  }

  boolean brickCollision(Brick b) {

    if (pos.x +r > b.pos.x && pos.x -r < b.pos.x+b.w && pos.y + r > b.pos.y && pos.y - r < b.pos.y + b.h && !b.isDead) {  
      return true;
    }
    // if (b.level == 0 ) b.isDead = true;      
    //if (pos.y-r<b.pos.y+b.h && vel.y <0) {         
    // vel.y  *= -1;
    //}
    //else if (b.pos.y + b.r > pos.y && b.vel.y > 0) b.vel.y  *= -1;
    return false;
  }
}
