//You should implement your assign3 here.

PImage bg1,bg2,hp,fighter,treasure,enemy;

float treasureX,treasureY,fighterX,fighterY,enemyX,enemyY,enemyY1,enemyY2;
float m,q,j; //hp & background

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
  
  enemyY=floor(random(30,440)); //enemy  
  j=floor(random(30,440));
  
  m=39; //hp
  
  fighterX=width/2;
  fighterY=height/2;
}
  
void draw() {

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
      
      for(int i=0;i<5;i++){
        enemyX=i*65;        
        image(enemy,enemyX,enemyY);
        enemyX+=3;
        enemyX%=640;
      }
        
      
          
     /* for(int i=0;i<5;i++){
                
        enemyX=i*65;        
        enemyY=i*25;
      image(enemy,enemyX,enemyY);
                        
      }*/
      
       /* for(int i=0; i<3; i++){
          enemyX = i*65;
          image(enemy,enemyX,enemyY1);
          enemyY1 += 20;            
          image(enemy,enemyX,enemyY2);
          enemyY2 -= 20;
          }*/
      
         
      
      //treasure detection
      if(treasureX>=fighterX-30 && treasureX<=fighterX+30 && treasureY>=fighterY-45 && treasureY<=fighterY+45 ){
        treasureX=floor(random(600)); 
        treasureY=floor(random(440));
        m+=19.5;
       if(m>=195){
        m=195;
       }
      }
      
                       
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
