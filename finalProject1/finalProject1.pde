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
int tempInit;
int state = 0;
PImage direito;
PImage esquerdo;
int combo;
PFont font;
boolean gameOverBool = true;
boolean introSoundBool =true;
boolean gameoverSoundBool = true;


void setup(){
 size(800, 600); 
 minim = new Minim(this);
 theme = minim.loadFile("extremeaction.mp3");
 heart = loadImage("heart3dplz.gif");
 restart();
 highscoreFile = loadStrings("highscore");
 highscore = Integer.valueOf(highscoreFile[0]);
 tempInit = 0;
 direito = loadImage("direito.png");
 esquerdo = loadImage("esquerdo.png");
 font = loadFont("data/Indocorno-48.vlw");
 textFont(font);

 //theme.loop();
 
}

void draw(){
 background(0);
 
 if (state == 0){
   initScreen();
 } else if (state == 1) {
   startGame();
 } else if (state == 2){
   gameOver(); 
 }
 
}

void keyPressed(){
  
    
    if (keyCode == 10 ){
      if (state == 2) restart();
      state = 1;
    }
    
    if(state == 1) {
    
    if(key == 'Q' || key == 'q'){
      if(QArray.size() > 0){
        QArray.remove(0);
        validateScore();
      } else {
        life--;
      }
      
    }else if (key == 'W' || key == 'w'){
      if(WArray.size() > 0){
        WArray.remove(0);
        validateScore();
      } else {
        life--;
      }
      
    }else if (key == 'E' || key == 'e'){
      if(EArray.size() > 0){
        EArray.remove(0);
        validateScore();
      } else {
        life--;
      }
      
    } else if (key == 'R' || key == 'r'){
      if(RArray.size() > 0){
        RArray.remove(0);
        validateScore();
      } else {
        life--;
      }
    }
   }
}

void validateScore(){
  
  minim.loadSample("pressed.mp3").trigger();
  score++;
  combo++;

}

void mousePressed(){
  int x = mouseX;
  int y = mouseY;
  if (state == 1) {
  if(mouseButton == LEFT){
    for(int i = 0; i < ESQArray.size(); i++){
      if(ESQArray.get(i).clicked(x, y)){
        ESQArray.remove(i);
        validateScore();
      }
    }
  } else {
  
    for(int i = 0; i < DIRArray.size(); i++){
      if(DIRArray.get(i).clicked(x, y)){
        DIRArray.remove(i);
        validateScore();
      }
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
  
  
  QArray.add(new Object("Q", null));
  WArray.add(new Object("W", null));
  RArray.add(new Object("R", null));
  
  score = 0;
  life = 3;
  time = 0;
  combo = 0;
  
}

void drawLifes(){
 for(int i = 0; i < life; i++){
  image(heart, width - 50 - 60 * i, 0); 
 }
}

void scores(){
 textSize(40);
 fill(255,0,0);
 text("Score: " + score, 5, 50);
 text("Combo: " + combo, 5, 110);
  
}

void startGame(){
 gameoverSoundBool = true;
 frameRate(60);
 drawLifes();
 scores();
 
 if (combo >= 10) {
  combo = 0;
  if (life < 5) life ++;
 }
 
 if(life <= 0) {
  state = 2; 
 }
 
 if(time > 35 - log(score * 1000)) {
  int random = (int)random(0,6);
  
  switch (random) {
      case 0:
      QArray.add(new Object("Q", null));
      break;
      case 1:
      WArray.add(new Object("W", null));
      break;
      case 2:
      EArray.add(new Object("E", null));
      break;
      case 3:
      RArray.add(new Object("R", null));
      break;
      case 4:
      DIRArray.add(new Object("DIR", direito));
      break;
      case 5:
      ESQArray.add(new Object("ESQ", esquerdo));
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
  }
 }
 for(int i = 0; i < WArray.size(); i++){
  if(WArray.get(i).update()) {
    WArray.remove(i);
    life--;
  }
 }
 for(int i = 0; i < EArray.size(); i++){
  if(EArray.get(i).update()) {
    EArray.remove(i);
    life--;
  }
 }
 for(int i = 0; i < RArray.size(); i++){
  if(RArray.get(i).update()) {
    RArray.remove(i);
    life--;
  }
 }
 for(int i = 0; i < DIRArray.size(); i++){
  if(DIRArray.get(i).update()) {
    DIRArray.remove(i);
    life--;
  }
 }
 for(int i = 0; i < ESQArray.size(); i++){
  if(ESQArray.get(i).update()) {
    ESQArray.remove(i);
    life--;
  }
 }
}


void initScreen(){
 frameRate(3);
 textSize(130);
 fill(255,0,0);
 if (millis() > 500){
   if(introSoundBool){
       minim.loadSample("intro.mp3").trigger();
       introSoundBool =false;
   }
   textAlign(CENTER, CENTER);
   text("Timing" , width/2, height/3);
   
   
   textSize(52);
   textAlign(LEFT);
   if (millis() > 3600)
     if (tempInit == 0) {
       text("Press Enter to start" , 50, height/1.5); 
       tempInit++;
     } else if (tempInit == 1) { 
       text("Press Enter to start." , 50, height/1.5); 
       tempInit++; 
     } else if (tempInit == 2) {
       text("Press Enter to start.." , 50, height/1.5); 
       tempInit++;
     } else if (tempInit == 3) {
       text("Press Enter to start..." , 50, height/1.5); 
       tempInit = 0;
     }
  }

 
}


void gameOver(){
  
  if (score > highscore) {
    
  highscore = score; 
  saveStrings("highscore", new String[]{highscore + ""});
  
  }
  
 if(gameoverSoundBool){
   minim.loadSample("gameover.mp3").trigger();
   gameoverSoundBool = false;
 }
 frameRate(3);
 textSize(130);
 fill(255,0,0);
 textAlign(CENTER, CENTER);
 if (gameOverBool) {
   text("GAME OVER" , width/2, height/3);
 }
 textSize(50);
 text("Score: " + score, width/2, height/2);
 textSize(25);
 text("Highscore: " + highscore, width/2, height/1.7);
 textAlign(LEFT);
 textSize(52);
 if (tempInit == 0) {
   text("Press Enter to start" , 50, height/1.3); 
   tempInit++;
   gameOverBool = !gameOverBool;
 } else if (tempInit == 1) { 
   text("Press Enter to start." , 50, height/1.3); 
   tempInit++; 
 } else if (tempInit == 2) {
   text("Press Enter to start.." , 50, height/1.3); 
   tempInit++;
   gameOverBool = !gameOverBool;
 } else if (tempInit == 3) {
   text("Press Enter to start..." , 50, height/1.3); 
   tempInit = 0;
 }
  
}
  
  
  