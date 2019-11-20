
int point = 0;
int c = 0; 
int playerPos = 2;
int px = 150;
int py = 500;
boolean state = true;

void setup(){
  frameRate(30);
  size(300,600);
}

void draw(){
  background(150);
  line(100,0,100,600);
  line(200,0,200,600);
  
  
  fill(50,50,255);
  textSize(20);
  text("Score: " + point, 20,20);
  
  if(c <= 30){
    c++; 
  }else if(c >30){
    c = 0; 
    point++;
  }
  
  //-----------------------------------
   if(playerPos == 1 && state == true && keyPressed){
      if(keyCode == RIGHT){
        playerPos = 2;
        state = false;
      }
    }else if(playerPos == 2 && state == true && keyPressed){
      if(keyCode == LEFT){
        playerPos = 1;
        state = false;
      }else if(keyCode == RIGHT){
        playerPos = 3;
        state = false;
      }
    }else if(playerPos == 3 && state == true && keyPressed){
      if(keyCode == LEFT){
        playerPos = 2;
        state = false;
      }
    } 
    if(!keyPressed){
      state = true;
    }
    //-------------------------------------------
    if(playerPos == 1){
      px = 50;
    }else if(playerPos == 2){
      px = 150;
    }else if(playerPos == 3){
      px = 250;
    } 
    //------------------------------------------------
    fill(0);
    ellipse(px, py, 50, 50);
  //-------------------------------------
  
}
