int point = 0;
int c = 0; 
int playerPos = 2;
int px = 150;
int py = 500;
boolean state = true;
boolean death = false;

Enemy e1 = new Enemy();
Enemy e2 = new Enemy();

void setup(){
  frameRate(60);
  size(300,600);
}

void draw(){
  background(150);
  line(100,0,100,600);
  line(200,0,200,600);
  
  e1.update();
  e2.update();

  
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
   if(playerPos == 1 && state == true && keyPressed && death == false){
      if(keyCode == RIGHT){
        playerPos = 2;
        state = false;
      }
    }else if(playerPos == 2 && state == true && keyPressed && death == false){
      if(keyCode == LEFT){
        playerPos = 1;
        state = false;
      }else if(keyCode == RIGHT){
        playerPos = 3;
        state = false;
      }
    }else if(playerPos == 3 && state == true && keyPressed && death == false){
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



class Enemy {
int spand = 1;
float x = 40;
float y = 0;
float speed = 5;
int enemyPos = 1;
 
  void update(){
    y=y + speed;
    
    if(y>height){
      y=0;
      spand = int(random(1,30));
      if(speed < 20){
        speed = speed + 0.2;
      }
    }
    
    if(spand <= 10){
      enemyPos = 1;
      x = 50;
    }else if(spand >10 && spand <= 20){
      enemyPos = 2;
      x = 150; 
    }else if(spand > 20){
      enemyPos = 3;
      x = 250; 
    }
    
    if(dist(x,y,px,py)<=35){
      background(0);
      
      fill(255,0,0);
      textSize(32);
      text("GAME OVER",60,(height/2)-200);
      
      fill(255,255,0);
      textSize(20);
      text("Score: "+point,70,(height/2)-150);
      
      fill(0,255,0);
      textSize(20);
      text("Click to restart",70,(height/2)-100);
      
      y = 500;
      c = 15;
      death = true;
      
      if(mousePressed){
        y = 0;
        point = 0;
        death = false;
        speed = 5;
      }
      
      
     
    }
    
    fill(255);  
    ellipse(x,y,20,20);
  }

}
