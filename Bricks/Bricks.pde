//Jerry Feng
//2-3
//2022/02/14

Paddle p = new Paddle(400, 700, 50, 10);
Ball b= new Ball( 100, 400, 10, 10);
//Brick c= new Brick( 100, 100, 50, 10);
Brick [] c= new Brick[13];
int score = 0;
Brick [] c2= new Brick[13];
int d = 0;

void setup() {
  size( 800, 800);
  for (int i = 0; i < c.length; i++) {
    c[i]= new Brick (70 + 50*i, 100, 50, 10);
  }
  for (int i = 0; i < c.length; i++) {
    c2[i]= new Brick (70 + 50*i, 200, 50, 10);
  }
}

void draw() {
  background(0);
  p.draw();
  b.draw();
    for ( int i = 0; i < c.length; i++){
      c[i].draw();
      c2[i].draw(); // can't use same "for" loop is the arrays are different sizes
      }
  b.move();
  if (b.intersect(p)){
      b.changeYdir();
  }
  for ( int i = 0; i < c.length; i++){
    if (b.intersect(c[i])){
        b.changeYdir();
        c[i].changex();
        score = score+1;
    }
  }
  for ( int i = 0; i < c.length; i++){
    if (b.intersect(c2[i])){
        b.changeYdir();
        d = d+1;
        if (d > 2) {
          c2[i].changex();
        }
    }//for
  }//if

   textSize(10);
   text("Your score is " + score, 10, 10);
   if ( score > 12) {
     textSize(50);
     text( "You won!", 300, 400);
   }
}


void keyPressed() {
  if (key == CODED) { //== means equals, = is assignment( what to do)
    if (keyCode == RIGHT) {
      if (p.xpos < 750) {
      p.move(1); //1 means right since it's positive
      }
  }
    if (keyCode == LEFT) {
      if (p.xpos > 0) {
      p.move(-1);
      }
    }
    redraw();
  } //clossing first if statement
} //closing void

class Ball {
  int xpos, ypos, awidth, aheight, xdir, ydir;
 
  public Ball(int x, int y, int w, int h) {
    xpos = x;
    ypos = y;
    awidth = w;
    aheight = h;
    xdir = 5;
    ydir = 5;
   
  }

  public void move(){
     xpos = xpos + xdir;
     ypos = ypos + ydir;
     if (ypos > 800){
       ydir = -ydir; //change dirction when exceeds the screen size
       
     }
     if (ypos < 0){
       ydir = -ydir;
       
     }
     if (xpos > 800){
       xdir = - xdir;
       
     }
     if (xpos < 0){
       xdir = - xdir;
       
     }
  }
 
  public void changeYdir(){
    ydir = -ydir;
  }

  public boolean intersect(Paddle p) { //boolean means true or false
    if(xpos > p.xpos && xpos < p.xpos + p.awidth){ //&& means and
      if(ypos > p.ypos && ypos < p.ypos + p.aheight){
        return true;
      }
    }
      return false;

    //if(pointX > rectX && pointX < rectX + rectWidth){
    //  if(pointY > rectY && pointY < rectY + rectHeight){
    //    //the point is inside the rectangle  
    //  }
    //}

 }
  public boolean intersect(Brick c) {
  if(xpos > c.xpos && xpos < c.xpos + c.awidth){ //&& means and
      if(ypos > c.ypos && ypos < c.ypos + c.aheight){
        return true;
      }
    }
      return false;
  }
 
  public void draw() {
    ellipse( xpos, ypos, awidth, aheight);
  }
 
}

class Paddle {
 int xpos, ypos, awidth, aheight;
 
  //public is contructor(The constructor is a special function inside of a class that creates the instance of the object itself. It is where you give the instructions on how to set up the object.)
  public Paddle (int x, int y, int w, int h) { //x, y, w, h, only works in public puddle(constructor)
    xpos = x; // pos= postions
    ypos = y;
    awidth = w;
    aheight = h;
   
  }
 
  public void move(int xdir) {
    xpos= xpos + 7 * xdir; //5 is speed, xdir is direction can be only postive or negative or 0 //mouseX;
    rect( xpos, ypos, awidth, aheight);
   
  }
 
  public int getX(){return xpos;}
  public int getY(){return ypos;}
 
   public void draw() {
     rect( xpos, ypos, awidth, aheight);
  }
 
}

class Brick {
  int xpos, ypos, awidth, aheight;
 
  public Brick (int x, int y, int w, int h) {
    xpos = x;
    ypos = y;
    awidth = w;
    aheight = h;
   
  }
 
  public void draw() {
    rect( xpos, ypos, awidth, aheight);
  }
 
  public void changex() {
    xpos= -1000;
  }
}
