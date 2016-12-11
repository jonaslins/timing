class Object {
 int speed;
 int y;
 int x;
 int objColor;
 final int SIZE = 40;
 String text;
 PImage png;
  public Object(String text, PImage png){
    this.png = png;
    this.text = text;
    this.speed = (int) random(1,5);
    this.x = (int) random (0, width - SIZE);
    this.y = 0;
    this.objColor = color(random(255), random(255), random(100,255));
  }
  
  boolean update(){
   this.y += speed;
   stroke(this.objColor);
   fill(objColor);
   //rect(this.x, this.y, SIZE, SIZE);
   fill(255);
   if (png == null) {
    text(text ,this.x + 3, this.y + SIZE); 
   } else {
    image(png, this.x - 3, this.y - 10);  
   }
   if(this.y >= height){
     return true;
   } else {
     return false; 
   }
  }
  
  boolean clicked(int x, int y){
    if(( this.x <= x && x <= this.x + SIZE) && (this.y <= y && y <= this.y + SIZE)){
      return true;
    } else {
      return false;
    }
  }
}