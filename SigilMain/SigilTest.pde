void settings(){
  size(900, 900);
}

void setup(){
  background(255, 255, 255);
  Sigil s = new Sigil();
  float[] ratio = {1, 22, 1};
  s.setPoints(ratio, 450);
  s.setTrigger("boot.png");
  s.setSigil("fire-element.png");
  s.drawSigil();
}

void draw(){
}
