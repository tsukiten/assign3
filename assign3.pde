//You should implement your assign3 here.
int enemystate;
final int c=0;
final int b=1;
final int a=2;

PImage bg1,bg2,hp,fighter,treasure,enemy;

float treasureX,treasureY,fighterX,fighterY,enemyX,enemyY,enemyY1,enemyY2;
float m,q; //hp & background

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int speed=5;


void setup () {
  size(640, 480) ;

  bg1 =loadImage("img/bg1.png");
  bg2 =loadImage("img/bg2.png");
  hp =loadImage("img/hp.png");
  fighter =loadImage("img/fighter.png");
  treasure =loadImage("img/treasure.png");
  enemy =loadImage("img/enemy.png");
  
  
  treasureX=floor(random(600)); //treasure
  treasureY=floor(random(440));
  
  enemyX=-50;
  enemyY=floor(random(30,440)); //enemy  
  enemystate=c;
  
  m=39; //hp
  
  fighterX=width/2;
  fighterY=height/2;
}
  
void draw() {
     //boundary detection
      if (fighterX>585){
        fighterX=585;
      }
      if (fighterX<0){
        fighterX=0;
      }
      if (fighterY>425){
        fighterY=425;
      }
      if (fighterY<5){
        fighterY=5;
      }      
      
      
      if (upPressed) {
        fighterY -= speed;
      }
      if (downPressed) {
        fighterY += speed;
      }
      if (leftPressed) {
        fighterX -= speed;
      }
      if (rightPressed) {
        fighterX += speed;
      }
         

      //background
      image(bg1,q%1280-640,0); 
      image(bg2,(q+640)%1280-640,0);
      q++;
      
      //hp
      fill(230,0,0); 
      rect(28,27,m,23);
      image(hp,20,20); 
      
      //fighter
      image(fighter,fighterX,fighterY); 
      
      //treasure
      image(treasure,treasureX,treasureY); 
      
      //enemy
      switch(enemystate){
        case c:
          for(int i=0;i<5;i++){
            image(enemy,enemyX-i*65,enemyY);
            enemyX+=2;
            if(enemyX>=1000){
              enemystate=b;
              enemyX=-50;
              enemyY=floor(random(5,250)); 
            }
          }           
        break;
      
       case b:    
          for(int i=0;i<5;i++){       
          image(enemy,enemyX-i*65,enemyY+i*40);
            enemyX+=2;
            if(enemyX>=1000){
              enemystate=a;
              enemyX=-50;
              enemyY=floor(random(80,345)); 
            }        
          }
       break;
      
       case a:
        for(int i=0;i<5;i++){
         if(i==0){image(enemy,enemyX-i*65,enemyY);} 
         if(i==1){image(enemy,enemyX-i*65,enemyY-i*40);image(enemy,enemyX-i*65,enemyY+i*40);}
         if(i==2){image(enemy,enemyX-i*65,enemyY-i*40);image(enemy,enemyX-i*65,enemyY+i*40);}
         if(i==3){image(enemy,enemyX-i*65,enemyY-40);image(enemy,enemyX-i*65,enemyY+40);}
         if(i==4){image(enemy,enemyX-i*65,enemyY);}
         enemyX+=2;
         if(enemyX>=1000){
          enemystate=c;
          enemyX=-50;
          enemyY=floor(random(5,415)); 
         } 
        }
        break;
      }
 
      //treasure detection
      if(treasureX>=fighterX-30 && treasureX<=fighterX+30 && treasureY>=fighterY-45 && treasureY<=fighterY+45 ){
        treasureX=floor(random(600)); 
        treasureY=floor(random(440));
        m+=19.5;
       if(m>=195){
        m=195;
       }
      }
      
        
}

void keyPressed(){
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
      }
  }
}

void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }

}
