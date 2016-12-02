import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer theme;
Minim minim;
ArrayList<Object> QArray;
ArrayList<Object> WArray;
ArrayList<Object> EArray;
ArrayList<Object> RArray;
ArrayList<Object> DIRArray;
ArrayList<Object> ESQArray;
int time;
int score;
int life;
int highscore;
PImage heart;
String[] highscoreFile;

void setup(){
 size(800, 600); 
 minim = new Minim(this);
 theme = minim.loadFile("extremeaction.mp3");
 theme.loop();
 heart = loadImage("heart3dplz.gif");
 restart();
 highscoreFile = loadStrings("highscore");
 highscore = Integer.valueOf(highscoreFile[0]);
 
}

void draw(){
 background(0);
 startGame();
 
}

void keyPressed(){

    if(key == 'Q' || key == 'q'){
      if(QArray.size() > 0){
        QArray.remove(0);
        score++;
      }
      
    }else if (key == 'W' || key == 'w'){
      if(WArray.size() > 0){
        WArray.remove(0);
        score++;
      }
      
    }else if (key == 'E' || key == 'e'){
      if(EArray.size() > 0){
        EArray.remove(0);
        score++;
      }
      
    }else if (key == 'R' || key == 'r'){
      if(RArray.size() > 0){
        RArray.remove(0);
        score++;
      }
      
    }
}

void mousePressed(){
  int x = mouseX;
  int y = mouseY;
  if(mouseButton == LEFT){
    for(int i = 0; i < ESQArray.size(); i++){
      if(ESQArray.get(i).clicked(x, y)){
        ESQArray.remove(i);
        score++;
        if (score > highscore) highscore = score; 
        saveStrings("highscore", new String[]{highscore + ""});
      }
    }
  } else {
  
    for(int i = 0; i < DIRArray.size(); i++){
      if(DIRArray.get(i).clicked(x, y)){
        DIRArray.remove(i);
        score++;
        if (score > highscore) highscore = score; 
        saveStrings("highscore", new String[]{highscore + ""});
      }
    }
  }
}

void restart(){
  QArray = new ArrayList<Object>();
  WArray = new ArrayList<Object>();
  EArray = new ArrayList<Object>();
  RArray = new ArrayList<Object>();
  DIRArray = new ArrayList<Object>();
  ESQArray = new ArrayList<Object>();
  
  QArray.add(new Object("Q"));
  WArray.add(new Object("W"));
  RArray.add(new Object("R"));
  
  score = 0;
  life = 3;
  time = 0;
  
}

void drawLifes(){
 for(int i = 0; i < life; i++){
  image(heart, width - 50 - 60 * i, 0); 
 }
}

void scores(){
 textSize(40);
 fill(255,0,0);
 text("Score: " + score, 0, 30);
 text("Highscore: " + highscore, 0, 70);
  
}

void startGame(){
 drawLifes();
 scores();
 
 if(time > 35 - log(score * 1000)) {
  int random = (int)random(0,6);
  
  switch (random) {
      case 0:
      QArray.add(new Object("Q"));
      break;
      case 1:
      WArray.add(new Object("W"));
      break;
      case 2:
      EArray.add(new Object("E"));
      break;
      case 3:
      RArray.add(new Object("R"));
      break;
      case 4:
      DIRArray.add(new Object("DIR"));
      break;
      case 5:
      ESQArray.add(new Object("ESQ"));
      break;
  }
  
  time = 0;
 } else {
  time++; 

 }
 
 
 for(int i = 0; i < QArray.size(); i++){
  if(QArray.get(i).update()) {
    QArray.remove(i);
    life--;
    if(life == 0){
     restart();
    }
  }
 }
 for(int i = 0; i < WArray.size(); i++){
  if(WArray.get(i).update()) {
    WArray.remove(i);
    life--;
    if(life == 0){
     restart();
    }
  }
 }
 for(int i = 0; i < EArray.size(); i++){
  if(EArray.get(i).update()) {
    EArray.remove(i);
    life--;
    if(life == 0){
     restart();
    }
  }
 }
 for(int i = 0; i < RArray.size(); i++){
  if(RArray.get(i).update()) {
    RArray.remove(i);
    life--;
    if(life == 0){
     restart();
    }
  }
 }
 for(int i = 0; i < DIRArray.size(); i++){
  if(DIRArray.get(i).update()) {
    DIRArray.remove(i);
    life--;
    if(life == 0){
     restart();
    }
  }
 }
 for(int i = 0; i < ESQArray.size(); i++){
  if(ESQArray.get(i).update()) {
    ESQArray.remove(i);
    life--;
    if(life == 0){
     restart();
    }
  }
 }
}
  
  
  