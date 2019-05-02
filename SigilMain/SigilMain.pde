


class Sigil {
  
  Point[] p;
  int center;
  PImage power;
  PImage trigger;
  PShape hex;
  float rad;
  
  Sigil() {
    p = new Point[]{new Point(), new Point(), new Point()};
  }
  
  void setPoints(float[] ratio, int center) {
    this.center = center;
    float total = ratio[0] + ratio[1] + ratio[2];
    p[0].x = this.center;
    p[0].y = this.center - int((ratio[0] / total) * center);
    
    p[1].x = this.center + int((ratio[1] / total) * center * .866);
    p[1].y = this.center + int((ratio[1] / total) * center * .5);
    
    p[2].x = this.center - int((ratio[2] / total) * center * .866);
    p[2].y = this.center + int((ratio[2] / total) * center * .5);
    
    this.rad = max(this.center - p[0].y, sqrt(pow(this.center - p[1].x, 2) + pow(this.center - p[1].y, 2)), sqrt(pow(this.center - p[2].x, 2) + pow(this.center - p[2].y, 2)))*2;
  
  }
  
  void setSigil(String name){
      power = loadImage(name);
      this.hex = createShape();
      hex.beginShape();
      hex.vertex(this.center-14, this.center-28);
      hex.vertex(this.center+14, this.center-28);
      hex.vertex(this.center+28, this.center);
      hex.vertex(this.center+14, this.center+28);
      hex.vertex(this.center-14, this.center+28);
      hex.vertex(this.center-28, this.center);
      hex.endShape(CLOSE);
  }
  
  void setTrigger(String name) {
      this.trigger = loadImage(name);
  }
  
  void drawSigil(){
    strokeWeight(3);
    point(p[2].x, p[2].y);
    line(p[0].x, p[0].y, p[1].x, p[1].y);
    line(p[1].x, p[1].y, p[2].x, p[2].y);
    line(p[0].x, p[0].y, p[2].x, p[2].y);
    
    stroke(255, 0, 0);
    strokeWeight(1);
    line(p[0].x, p[0].y, this.center, this.center);
    line(p[1].x, p[1].y, this.center, this.center);
    line(p[2].x, p[2].y, this.center, this.center);
    shape(this.hex, 0, 0);
    image(this.power, this.center-25, this.center-25, 50, 50);
    noFill();
    stroke(0, 0, 0);
    strokeWeight(2);
    circle(this.center, this.center, this.rad);
 
    fill(255, 255, 255);
    circle(this.center + (this.rad * 0.707) / 2 + 14, this.center - (this.rad * 0.707) / 2 + 25 , 75);
    image(this.trigger, this.center + (this.rad * 0.707 - 13) / 2, this.center - (this.rad * 0.707) / 2 , 50, 50);
  }
 class Point {
   
  int x;
  int y;
  PImage arg;
  
  Point(){
    this.arg = null;
    this.x = 0;
    this.y = 0;
  }
 }
}
