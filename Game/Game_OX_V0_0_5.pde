import java.util.ArrayList;
import ddf.minim.*;




Minim minim;
AudioPlayer music;
AudioSample voice, effect, explosion, bossm;

int rain;
int[] x, y;
int[] justice, justiceY, vel;


float bx, by;  

float px, py;
float pxi, pyi, pxf, pyf;
float p, vp;
color thruster, glass, inside;
boolean fire, hit, missil,dead;
float targetX, targetY;
int sp2=10;


///missil
float xm, ym;  
float pm, vpm;

///flameMissile

float xc, yc;
float radiox, radioy, grados;
float velocidad;

///flame1


float radioxb, radioyb, gradosb;
float velocidadb;


float xt = -20;
float yt = -100;
int radius = 50;
float easing = 0.03;
float speed = 0;
float gravity = 0.1;
float upwardforce = -0.75;
float angle, oldAngle = 0;
int e2x;
int e2y;


float recoil;
float recoil2;


////flying animation

float xcf, ycf;
float radioxf, radioyf, gradosf;
float velocidadf;


/////target/////////

int vx;
int vy;
int ay;
int ax;

float vibx, viby; 



///sketch time

int hour;
int minute;
int second;
int start, timer1, score, lifes, ammo, charac;
boolean turn, alive, impact, fly, onAttack, direction, exploit; 
int posX, posY, speedX, speedY, speedYN, missilX, arms;
color f1, f2, f3, life1, life2, life3, life4;

///letter
PFont arcade;
PImage back, portrait, person, missile, gameover;
int imgbackX, speedimg;


///enemies
int lmine1, lmine2, lomnic, lomnicbeta, lboss;
int song, voiceS;

int radio, ext, rd, rd2, rd3, rx, ry, rx2, ry2, rx3, ry3, plus;
color expo;


int eye, r1, r2, r3, r4, r5, wide;
color light, light2;


int hitsminea, hitsmineb, hitsOa, hitsOb;

//////ENEM ARRAY

int[] ex, ey,hx,hy;
int size, index;
int mov, sp;

int minx;
int miny;
int may;
int mvx, mvy;

/////halcion

float xca, yca;
float radioxa, radioya, gradosO;
float velocidadO, xflameO, yflameO;
int rce;



///////////COLIDERS///////


float c1x;      // circle 1 position
float c1y;      // (controlled by mouse)
float c1r;     // radius

float c2x, c3x;    // circle 2 position
float c2y, c3y;
float c2r, c3r;

int goAway,sp3;;



float[] Ac2x, Ac2y, Ac2r;


boolean minaA, minaB, omnicA, omnicB;



void setup() {

  //iniciar variables
  fullScreen();
  background(255);
  noCursor();
  smooth();
  ///missile

  pm=0.0;
  vpm=0.03;
 sp3=8;


  radiox=20;
  radioy=0;
  grados=0;
  velocidad=15;

  //blue
  missilX=200;
  radioxb=30;
  radioyb=0;
  gradosb=0;
  velocidadb=20;
  arms=100;

  recoil=0;
  charac=2;



  radioxf=0;
  radioyf=10;
  gradosf=0;
  velocidadf=5;


  ay=1;
  vx=20;
  vy=20;


  minx=100;
  miny=-500;
  may=1;


  //velocidad en x y y
  mvx=10;
  mvy=10;

 /////halcion
 gradosO=0;
  velocidadO=20;
  xflameO=0;
  radioxa=20;
  rce=0;
 
 
 

  ///tiempos 

  start = millis()/1000;
  score=0;
  lifes=4;
  ammo=0;
  //println(start);

  ///starting pos

  posX=-710;
  posY=-190;
  speedX=15;
  speedY=5;
  speedYN=3;


  imgbackX=-960;
  speedimg=5;

  ///boolean


  turn=false;
  fly=false;
  impact=false;
  alive=true;
  exploit=false;
  dead=false;



  //////load letters and images-music


  arcade = loadFont("ArcadeClassic-50.vlw");
  back=loadImage("background.png");
  portrait=loadImage("portr.png");
  missile=loadImage("missile01.png");

  if (charac==1)
  {
    person=loadImage("pharahport1.png");
  }
  if (charac==2)
  {
    person=loadImage("pharahport2.png");
  }
  if (charac==3)
  {
    person=loadImage("pharahport1.png");
  }
  if (charac==4)
  {
    person=loadImage("pharahport1.png");
  }


gameover=loadImage("rip.png");

  /////////MUSIC/////

  song=(int)random(1, 3);
  voiceS=(int)random(1, 3);

  //final String filePath = dataPath("m1.mp3");

  minim= new Minim(this);

  effect=minim.loadSample("Missle.mp3", 500);
  explosion=minim.loadSample("Explosion.mp3");


  if (voiceS==1)
  {

    voice = minim.loadSample("Maneuvers.mp3");
  }
  if (voiceS==2)
  {


    voice = minim.loadSample("systemsgreen.mp3");
  }




  ///////

  if (song==1)
  {


    music=minim.loadFile("m1.mp3");
    music.play();
  }
  if (song==2)
  {


    music=minim.loadFile("Judgment.mp3");
    music.play();
  }


  bossm = minim.loadSample("Final.mp3");



  ///////////////ENEMIES/////////


  wide=10;

  size=1;

  ex=new int[size];
  ey=new int[size];



  for (int i=0; i<size; i++)
  {
    ex[i]=0;
    ex[i]=(int)random(1000, 3000);
    ey[i]=(int)random(-height/2+100, height/2-100);
  }

  Ac2x=new float[size];
  Ac2y=new float[size];
  Ac2r=new float[size];


  e2x=(int)random(1000, 3000);
  e2y=(int)random(-height/2+100, height/2-100);



  hx=new int[size];
  hy=new int[size];


 for (int i=0; i<size; i++)
  {
    hx[i]=0;
    hx[i]=(int)random(1000, 3000);
    hy[i]=(int)random(-height/2+100, height/2-100);
  }


  hitsminea= 1;
  hitsmineb= 2;
  hitsOa= 3;
  hitsOb= 4;


  mov=0;
  sp=10;

  ///////////////////RAIN ARRAY/////
  radio=150;
  rd=0;
  rd2=0;
  rd3=0;
  ext=3;

  rx=(int)random(0, 10);
  ry=(int)random(0, 10);



  rain=20;

  justice=new int[rain];
  justiceY=new int[rain];
  vel=new int[rain];



  for (int j=0; j<justice.length; j++)
  {
    justice[j]=(int)random(-230, +230);
    justiceY[j]=(int)random(-30, +30);
    vel[j]=(int)random(5, 7);
  }
}

void draw() {

  translate(width/2, height/2);
  targetX=mouseX-width/2;
  targetY=mouseY-height/2;
  onAttack=mousePressed;
  direction=keyPressed;

  ////////////Game mech////////////////
  
  background(255);

  if (imgbackX>-28730+960)
  {
    imgbackX=imgbackX-speedimg;
  } else
  {

    // bossm.trigger();
  }


  image(back, imgbackX, -540); ///back ground
  //////////////



  enemySpawn(imgbackX, timer1, goAway);


  if (imgbackX<-6000)
  {
    mineSpawn(imgbackX, timer1, goAway);
  }


 if (imgbackX<-12000)
  {
    minebeta(imgbackX, timer1, goAway);
  }

if (imgbackX<-16000)
  {
    omnicHalcion(imgbackX, timer1, goAway);

  }

if (imgbackX<-24000)
  {
    halcionalpha(imgbackX, timer1, goAway);

  }


  for (int a=0; a<width; a+=400)

  {

    strokeWeight(4);
    stroke(#9D9D9D);
    fill(#5F5F5F);

    beginShape();

    vertex(27770+imgbackX+a+-710, -490-50);
    quadraticVertex(27770+imgbackX+imgbackX+a+-710+50, -490-100, 27770+imgbackX+a+-710+100, -490-50);
    quadraticVertex(27770+imgbackX+a+-710+150, -490-100, 27770+imgbackX+a+-710+200, -490-50);
    quadraticVertex(27770+imgbackX+a+-710+250, -490, 27770+imgbackX+a+-710+200, -490+50);
    quadraticVertex(27770+imgbackX+a+-710+150, -490+100, 27770+imgbackX+a+-710+100, -490+50);
    quadraticVertex(27770+imgbackX+a+-710+50, -490+100, 27770+imgbackX+a+-710, -490+50);
    quadraticVertex(27770+imgbackX+a+-710-50, -490+100, 27770+imgbackX+a+-710-100, -490+50);
    quadraticVertex(27770+imgbackX+a+-710-150, -490+100, 27770+imgbackX+a+-710-200, -490+50);
    quadraticVertex(27770+imgbackX+a+-710-250, -490, 27770+imgbackX+a+-710-200, -490-50);
    quadraticVertex(27770+imgbackX+a+-710-150, -490-100, 27770+imgbackX+a+-710-100, -490-50);
    quadraticVertex(27770+imgbackX+a+-710-50, -490-100, 27770+imgbackX+a+-710, -490-50);

    endShape(CLOSE);

    for (int j=0; j<rain; j++)
    {


      justiceY[j]=justiceY[j]+5;
      strokeWeight(2);
      stroke(#292B83);
      fill(#00D6FA);

      //point(posX+justice[j], posY);

      beginShape();

      vertex(27770+imgbackX+a+-710+justice[j], -490-25+justiceY[j]);
      quadraticVertex(27770+imgbackX+a+-710+justice[j]+7, -490-8+justiceY[j], 27770+imgbackX+a+-710+justice[j], -490+justiceY[j]);
      quadraticVertex(27770+imgbackX+a+-710+justice[j]-7, -490-8+justiceY[j], 27770+imgbackX+a+-710+justice[j], -490-25+justiceY[j]);
      endShape(CLOSE);



      if (justiceY[j]>1080)
      {

        justice[j] = (int)random(-240, +240);
        justiceY[j] = (int)random(-30, +30);
      }
    }
  }

  ////////EXPLOSION


  if (exploit)
  {


    explosion();
  }



  //////////


  if (imgbackX==-970)
  {


    voice.trigger();
  }




  if (posY>540)
  {
    if (lifes>0)
    {
      lifes=lifes-1;
      //println(lifes);
    }
    alive=false;
    checkifAlive(score, lifes,arms);
  }

  if (!alive)

  {
  }




  /////////////////target///////////////


  strokeWeight(3);
  point(posX, posY);
  noFill();
  stroke(#FC0000);
  ellipse(targetX, targetY, 50, 50);

  point(targetX, targetY);//central point



  /////MAIN CHARACTER////////////////////////////////////////

  strokeWeight(3);
  noStroke();
  noFill();
  ellipse(posX, posY, 250, 250);


  ////////// Time - score //////////////////////////////////////////


  timer1=millis()/10000;
  score=score+timer1;
  //println(timer1);


  //////////////////////////////////////////////////////////

  if (onAttack)
  {

    posX=int(posX+vibx);
    posY=int(posY+viby);
  } else
  {
    vibx=0;
    viby=0;
  }


  //////////////////////////THE MATRIX////////////////////////////////////////////////////////////////






  pushMatrix();
  if (posX>targetX)
  {


    scale(-1, 1);

    translate(-posX*2, posY*0.01);
    // posX=posX*-1;
  }




  /////////////////SEEKER MISSILE TEST////////////////


  /*
  vy=vy+ay;//cambiar la velocidad segun aceleración (ay=1) "gravedad"
   targetY=targetY+vy;//movement y, posicion y segun velocidad
   targetX=targetX+vx;//movimiento en x, posicion x segun velocidad - 1 Movimiento lineal en x
   
   
   if(targetX>=920||targetX<=0) 
   {
   vx=-vx;
   
   
   }
   
   
   if(targetY>420) //se quita igual por el pixel
   {
   
   
   vy=-vy;
   
   
   
   }
   
   */






  /////flying animation//////////



  float xf=radioxf*cos(radians(gradosf));
  //float x=0; //movimiento en x
  float yf=radioyf*sin(radians(gradosf));
  //float y=0; //movimiento en y

  //float x=-radio*cos(radians(grados));
  //float y=radio*cos(radians(grados));


  //los grados son 0 y cos 0 es 1, entonces 1*100=100

  gradosf=gradosf+velocidadf;
  //optimizar programa
  if (gradosf>=360||gradosf<=0)
  {

    gradosf=0;
    //velocidad=-velocidad;
  }



  //test 01
  /*
     if(posX<0)
   {
   strokeWeight(5);
   point(posX,posY);
   triangle(posX,posY,posX,posY+30,posX+30,posY+15);
   }
   else
   {
   
   strokeWeight(5);
   point(posX,posY);
   triangle(posX,posY,posX,posY+30,posX-30,posY+15); 
   
   }
   */

  //OW CHARACTER DESIGN

  /*

   if(posX<0)
   {
   //RIGHT DRAW
   */









  /////WINGS//////////////////////////////////////////////////////////////////// 




  strokeWeight(2);
  stroke(#000000);
  fill(#133e78);

  beginShape();


  vertex(posX+5, posY+yf-140);
  quadraticVertex(posX+5, posY+yf-163, posX+5, posY+yf-163);
  quadraticVertex(posX+-3, posY+yf-180, posX+-20, posY+yf-185);
  vertex(posX+-100, posY+yf-185);
  vertex(posX+-115, posY+yf-165);
  vertex(posX+-200, posY+yf-165);
  vertex(posX+-288, posY+yf-140);
  vertex(posX+-200, posY+yf-140);
  vertex(posX+-190, posY+yf-148);
  vertex(posX+-70, posY+yf-148);
  //wing N2
  vertex(posX+-70, posY+yf-117);
  vertex(posX+-110, posY+yf-117);
  vertex(posX+-110, posY+yf-108);
  vertex(posX+-220, posY+yf-105);
  vertex(posX+-195, posY+yf-95);
  vertex(posX+-165, posY+yf-95);
  vertex(posX+-165, posY+yf-98);
  vertex(posX+-120, posY+yf-98);
  vertex(posX+-115, posY+yf-95);
  vertex(posX+-55, posY+yf-95);
  quadraticVertex(posX+-50, posY+yf-85, posX+-38, posY+yf-75);
  vertex(posX+-8, posY+yf-75);


  endShape();


  ///thruster

  strokeWeight(2);
  stroke(#000000);
  fill(#133e78);

  beginShape();

  vertex(posX+-18, posY+yf+-85);
  quadraticVertex(posX+-25, posY+yf+-105, posX+-35, posY+yf+-113);
  quadraticVertex(posX+-95, posY+yf+-113, posX+-95, posY+yf+-113);
  quadraticVertex(posX+-95, posY+yf+-153, posX+-95, posY+yf+-153);
  quadraticVertex(posX+-3, posY+yf+-153, posX+-3, posY+yf+-153);
  quadraticVertex(posX+15, posY+yf+-137, posX+30, posY+yf+-120);
  quadraticVertex(posX+80, posY+yf+-120, posX+80, posY+yf+-120);
  quadraticVertex(posX+80, posY+yf+-70, posX+80, posY+yf++-70);
  vertex(posX+-18, posY+yf++-85);


  endShape();





  //////////chest////torso////////////////////////////////////////////////////


  strokeWeight(2);
  stroke(#000000);
  fill(#1b66c5);


  beginShape();
  vertex(posX+55-recoil2, posY+yf+-80);
  quadraticVertex(posX+45-recoil2, posY+yf+-100, posX+25-recoil2, posY+yf+-120);
  quadraticVertex(posX+0-recoil2, posY+yf+-120, posX+0-recoil2, posY+yf+-120);
  quadraticVertex(posX+-6-recoil2, posY+yf+-110, posX+-10-recoil2, posY+yf+-90);
  quadraticVertex(posX+-10-recoil2, posY+yf+20, posX+-10-recoil2, posY+yf+20);
  quadraticVertex(posX+55-recoil2, posY+yf+20, posX+55-recoil2, posY+yf+20);
  vertex(posX+55-recoil2, posY+yf+-80);

  endShape();


  //////hole?????'//////////////////////////////////////////////


  strokeWeight(1);
  stroke(#000000);
  fill(#000000);



  ellipse(posX+25-recoil2, posY+yf+-100, 10, 16);


  strokeWeight(2);
  stroke(#000000);
  fill(#103e78);

  beginShape();

  vertex(posX+60, posY+yf+-80);
  quadraticVertex(posX+45, posY+yf+-80, posX+45, posY+yf+-80);
  quadraticVertex(posX+36, posY+yf+-40, posX+45, posY+yf+-10);
  quadraticVertex(posX+60, posY+yf+-10, posX+60, posY+yf+-10);
  vertex(posX+60, posY+yf+-80);

  endShape();


  beginShape();

  vertex(posX+80, posY+yf+-85);
  quadraticVertex(posX+80, posY+yf+-10, posX+80, posY+yf+-10);
  quadraticVertex(posX+52, posY+yf+-10, posX+52, posY+yf+-10);
  quadraticVertex(posX+52, posY+yf+-40, posX+52, posY+yf+-80);
  vertex(posX+80, posY+yf+-85);

  endShape();

  /////////ARM1////////////////////////////////////////////



  strokeWeight(2);
  stroke(#000000);
  fill(#133e78);

  beginShape();

  vertex(posX+-50-recoil, posY+yf+-35);
  quadraticVertex(posX+-65-recoil, posY+yf+-12, posX+-75-recoil, posY+yf+20);
  quadraticVertex(posX+-65-recoil, posY+yf+40, posX+-40-recoil, posY+yf+30);
  quadraticVertex(posX+-20-recoil, posY+yf+5, posX+-10-recoil, posY+yf+-28);
  quadraticVertex(posX+-30-recoil, posY+yf+-45, posX+-50-recoil, posY+yf+-35);


  endShape();



  ////shoulders//////////////////////////////////////////

  strokeWeight(2);
  stroke(#000000);
  fill(#133e78);


  beginShape();
  vertex(posX+-20-recoil, posY+yf+-85);
  quadraticVertex(posX+-6-recoil, posY+yf+-95, posX+8-recoil, posY+yf+-90);
  quadraticVertex(posX+25-recoil, posY+yf+-70, posX+20-recoil, posY+yf+-30);
  quadraticVertex(posX+10-recoil, posY+yf+-20, posX+-10-recoil, posY+yf+-10);
  quadraticVertex(posX+-25-recoil, posY+yf+-30, posX+-25-recoil, posY+yf+-30);
  quadraticVertex(posX+-25-recoil, posY+yf+-70, posX+-25-recoil, posY+yf+-70);
  vertex(posX+-20-recoil, posY+yf+-85);

  endShape();


  /////////SHOULDER BEHIND/////////////////////////////////
  strokeWeight(2);
  stroke(#000000);
  fill(#133e78);

  beginShape();

  vertex(posX+165-recoil, posY+yf+-5);
  quadraticVertex(posX+175-recoil, posY+yf+-27, posX+175-recoil, posY+yf+-50);
  quadraticVertex(posX+125-recoil, posY+yf+-50, posX+125-recoil, posY+yf+-50);
  quadraticVertex(posX+125-recoil, posY+yf+-5, posX+125-recoil, posY+yf+-5);
  vertex(posX+165-recoil, posY+yf+-5);



  endShape();




  strokeWeight(2);
  stroke(#000000);
  fill(#626d73);


  beginShape();
  vertex(posX+-20-recoil, posY+yf+-28);
  quadraticVertex(posX+-5-recoil, posY+yf+-28, posX+-78-recoil, posY+yf+-28);
  quadraticVertex(posX+-90-recoil, posY+yf+-48, posX+-80-recoil, posY+yf+-58);
  quadraticVertex(posX+-42-recoil, posY+yf+-75, posX+-20-recoil, posY+yf+-65);
  vertex(posX+-20-recoil, posY+yf+-28);

  endShape();

  //golden shoulder

  strokeWeight(2);
  stroke(#000000);
  fill(#fac000);


  beginShape();
  vertex(posX+-18-recoil, posY+yf+-90);
  quadraticVertex(posX+5-recoil, posY+yf+-80, posX+5-recoil, posY+yf+-50);
  quadraticVertex(posX+-10-recoil, posY+yf+-38, posX+-10-recoil, posY+yf+-38);
  quadraticVertex(posX+-45-recoil, posY+yf+-35, posX+-60-recoil, posY+yf+-45);
  quadraticVertex(posX+-62-recoil, posY+yf+-60, posX+-62-recoil, posY+yf+-60);
  quadraticVertex(posX+-40-recoil, posY+yf+-90, posX+-18-recoil, posY+yf+-90);


  endShape();




  //FACE/////////////////////////////////////////////////////////////////////////////////////////////////
  /*
     strokeWeight(3);
   point(140,-15);
   point(145,-20);
   point(150,-21);
   point(150,-40);
   point(150,-55);
   point(95,-95);
   point(98,-15);
   */

  strokeWeight(2);
  stroke(#000000);
  fill(#8e664a);

  beginShape();

  vertex(posX+140, posY+yf+-5);
  quadraticVertex(posX+144, posY+yf+-10, posX+145, posY+yf+-20);
  quadraticVertex(posX+152, posY+yf+-19, posX+152, posY+yf+-20);
  quadraticVertex(posX+150, posY+yf+-30, posX+150, posY+yf+-40);
  quadraticVertex(posX+150, posY+yf+-55, posX+150, posY+yf+-55);
  quadraticVertex(posX+130, posY+yf+-80, posX+95, posY+yf+-95);
  quadraticVertex(posX+70, posY+yf+-35, posX+98, posY+yf+-15);
  quadraticVertex(posX+120, posY+yf+0, posX+140, posY+yf+-5);

  endShape();

  //mouth

  strokeWeight(3);
  stroke(#000000);
  fill(#703f39);

  beginShape();

  vertex(posX+140, posY+yf+-5);
  quadraticVertex(posX+144, posY+yf+-10, posX+145, posY+yf+-20);


  endShape();

  strokeWeight(2);
  beginShape();

  vertex(posX+132, posY+yf+-15);
  quadraticVertex(posX+134, posY+yf+-22, posX+118, posY+yf+-25);

  endShape();


  if (onAttack)
  {
    /////////////////////mouth expression/////////////////////


    strokeWeight(2);
    stroke(#000000);
    fill(#FFFFFF);


    beginShape();

    vertex(posX+135, posY+yf+-15);
    quadraticVertex(posX+140, posY+yf+-28, posX+118, posY+yf+-25);
    vertex(posX+132, posY+yf+-15);

    endShape();

    strokeWeight(1);
    stroke(#000000);
    line(posX+135, posY+yf+-18, posX+130, posY+yf+-22);
  }



  //Mark of horus
  strokeWeight(2);
  stroke(#000000);
  fill(#292c3c);

  beginShape();
  vertex(posX+123, posY+yf+-50);
  quadraticVertex(posX+115, posY+yf+-47, posX+115, posY+yf+-45);
  quadraticVertex(posX+110, posY+yf+-40, posX+105, posY+yf+-45);
  quadraticVertex(posX+102, posY+yf+-48, posX+105, posY+yf+-50);
  quadraticVertex(posX+107, posY+yf+-53, posX+109, posY+yf+-50);
  quadraticVertex(posX+108, posY+yf+-48, posX+105, posY+yf+-45);
  quadraticVertex(posX+108, posY+yf+-42, posX+115, posY+yf+-45);
  vertex(posX+123, posY+yf+-50);

  endShape();


  //Sun glases

  strokeWeight(2);
  stroke(#000000);
  fill(#000000);//// colorg

  beginShape();

  vertex(posX+150, posY+yf+-33);
  quadraticVertex(posX+158, posY+yf+-36, posX+165, posY+yf+-45);
  quadraticVertex(posX+150, posY+yf+-55, posX+150, posY+yf+-55);
  quadraticVertex(posX+130, posY+yf+-80, posX+95, posY+yf+-95);
  quadraticVertex(posX+92, posY+yf+-75, posX+93, posY+yf+-60);
  quadraticVertex(posX+105, posY+yf+-63, posX+120, posY+yf+-62);
  quadraticVertex(posX+120, posY+yf+-52, posX+125, posY+yf+-45);
  quadraticVertex(posX+146, posY+yf+-39, posX+146, posY+yf+-39);
  quadraticVertex(posX+148, posY+yf+-40, posX+150, posY+yf+-40);
  vertex(posX+150, posY+yf+-35);

  endShape();

  /*
     strokeWeight(3);
   point(150,-35);
   point(150,-40);
   point(165,-45);
   point(150,-55);
   point(95,-95);
   point(93,-60);
   point(120,-62);
   point(125,-45);
   point(146,-39);
   */


  /////Helmet//////////////////////////////////////////////////////////////////////////// 

  ///back helmet


  strokeWeight(2);
  stroke(#000000);
  fill(#1b66c5);

  beginShape();

  vertex(posX+130, posY+yf+-135);
  quadraticVertex(posX+106, posY+yf+-147, posX+82, posY+yf+-150);
  quadraticVertex(posX+72, posY+yf+-158, posX+62, posY+yf+-175);
  quadraticVertex(posX+50, posY+yf+-140, posX+52, posY+yf+-123);
  quadraticVertex(posX+95, posY+yf+-95, posX+95, posY+yf+-95);
  quadraticVertex(posX+125, posY+yf+-110, posX+130, posY+yf+-135);



  endShape();

  /*
     strokeWeight(4);
   point(130,-135);
   point(82,-150);
   point(62,-175);
   point(52,-123);
   point(95,-95);
   */



  //Visor

  strokeWeight(2);
  stroke(#000000);
  fill(#ffbe00);

  beginShape();

  vertex(posX+163, posY+yf+-20);
  quadraticVertex(posX+190, posY+yf+-30, posX+185, posY+yf+-85);
  quadraticVertex(posX+170, posY+yf+-125, posX+135, posY+yf+-155);
  quadraticVertex(posX+130, posY+yf+-135, posX+120, posY+yf+-120);
  quadraticVertex(posX+95, posY+yf+-110, posX+95, posY+yf+-110);
  quadraticVertex(posX+95, posY+yf+-102, posX+100, posY+yf+-80);
  quadraticVertex(posX+129, posY+yf+-60, posX+162, posY+yf+-45);
  quadraticVertex(posX+170, posY+yf+-40, posX+163, posY+yf+-20);


  endShape();

  line(posX+120, posY+yf+-120, posX+135, posY+yf+-110);

  /*
     strokeWeight(4);
   
   point(163,-20);
   point(163,-45);
   //point(150,-53);
   point(185,-85);
   point(135,-145);
   point(120,-120);
   point(95,-95);
   point(92,-108);
   */


  ///neck

  strokeWeight(2);
  stroke(#000000);
  fill(#3d4045);

  beginShape();

  vertex(posX+98, posY+yf+-70);
  quadraticVertex(posX+82, posY+yf+-42, posX+98, posY+yf+-10);
  quadraticVertex(posX+72, posY+yf+-10, posX+72, posY+yf+-10);
  quadraticVertex(posX+72, posY+yf+-70, posX+72, posY+yf+-70);
  vertex(posX+90, posY+yf+-70);

  endShape();

  // Little wings helmet



  strokeWeight(2);
  stroke(#000000);
  fill(#a4a5ac);

  beginShape();

  vertex(posX+85, posY+yf+-98);
  vertex(posX+85, posY+yf+-115);
  vertex(posX+55, posY+yf+-130);
  vertex(posX+45, posY+yf+-130);
  vertex(posX+45, posY+yf+-105);
  vertex(posX+65, posY+yf+-98);
  vertex(posX+70, posY+yf+-80);
  vertex(posX+85, posY+yf+-98);


  endShape();
  //////lines///////

  strokeWeight(2);
  stroke(#3d4245);
  line(posX+45, posY+yf+-117, posX+75, posY+yf+-107);
  line(posX+75, posY+yf+-107, posX+80, posY+yf+-80);

  strokeWeight(3);
  stroke(#000000);
  fill(#686e73);

  point(posX+85, posY+yf+-80);

  ellipse(posX+85, posY+yf+-80, 32, 38);

  strokeWeight(2);
  stroke(#000000);
  fill(#000000);

  point(posX+85, posY+yf+-80);

  ellipse(posX+85, posY+yf+-80, 12, 18);


  strokeWeight(3);
  stroke(#000000);
  fill(#fac000);

  line(posX+85, posY+yf+-60, posX+85, posY+yf+-50);

  strokeWeight(1);
  rect(posX+81, posY+yf+-50, 7, 15);





  ///////MISSILES//////////////////

  strokeWeight(2);
  stroke(#000000);
  fill(#ff0000);

  beginShape();


  vertex(posX+78-recoil, posY+yf+-9);
  quadraticVertex(posX+75-recoil, posY+yf+-20, posX+85-recoil, posY+yf+-25);
  quadraticVertex(posX+92-recoil, posY+yf+-23, posX+100-recoil, posY+yf+-17);
  quadraticVertex(posX+92-recoil, posY+yf+-10, posX+78-recoil, posY+yf+-9);

  endShape();


  ////////////////////////////////left arm///////////////////////////////

  strokeWeight(2);
  stroke(#000000);
  fill(#292c3c);

  beginShape();


  vertex(posX+169-recoil, posY+yf+35);
  quadraticVertex(posX+169-recoil, posY+yf+55, posX+169-recoil, posY+yf+55);
  quadraticVertex(posX+149-recoil, posY+yf+80, posX+138-recoil, posY+yf+85);
  quadraticVertex(posX+134-recoil, posY+yf+87, posX+130-recoil, posY+yf+85);
  quadraticVertex(posX+127-recoil, posY+yf+60, posX+127-recoil, posY+yf+35);
  vertex(posX+169-recoil, posY+yf+35);

  endShape();




  ////////////ROCKET LAUNCHER///////////////////////

  /////////RL HANDGUARD///////////////////////////// 

  strokeWeight(2);
  stroke(#000000);
  fill(#3f4247);

  beginShape();


  vertex(posX+195-recoil, posY+yf+30);
  vertex(posX+195-recoil, posY+yf+46);
  vertex(posX+135-recoil, posY+yf+46);
  vertex(posX+130-recoil, posY+yf+55);
  vertex(posX+115-recoil, posY+yf+55);
  vertex(posX+115-recoil, posY+yf+48);
  vertex(posX+80-recoil, posY+yf+48);
  vertex(posX+80-recoil, posY+yf+60);
  vertex(posX+60-recoil, posY+yf+60);
  vertex(posX+60-recoil, posY+yf+30);
  vertex(posX+195-recoil, posY+yf+30);

  endShape();




  ////////////ROCKET LAUNCHER BODY/////////////////////// 
  strokeWeight(2);
  stroke(#000000);
  fill(#1d1e20);

  beginShape();

  vertex(posX+-10-recoil, posY+yf+-13);
  quadraticVertex(posX+200-recoil, posY+yf+-13, posX+200-recoil, posY+yf+-13);
  quadraticVertex(posX+185-recoil, posY+yf+13, posX+200-recoil, posY+yf+38);
  quadraticVertex(posX+30-recoil, posY+yf+38, posX+30-recoil, posY+yf+38);
  quadraticVertex(posX+-10-recoil, posY+yf+38, posX+-10-recoil, posY+yf+38);
  quadraticVertex(posX+-26-recoil, posY+yf+35, posX+-38-recoil, posY+yf+16);
  quadraticVertex(posX+-38-recoil, posY+yf+10, posX+-38-recoil, posY+yf+10);
  quadraticVertex(posX+-26-recoil, posY+yf+-10, posX+-10-recoil, posY+yf+-13);


  endShape();

  ///////deco/////////////////////////////////////////  




  //////MISSILES PROVIDER//////////////////////// 

  strokeWeight(2);
  stroke(#000000);
  fill(#fac000);

  beginShape();

  vertex(posX+30-recoil, posY+yf+-9);
  quadraticVertex(posX+78-recoil, posY+yf+-9, posX+78-recoil, posY+yf+-9);
  quadraticVertex(posX+75-recoil, posY+yf+-20, posX+85-recoil, posY+yf+-25);
  quadraticVertex(posX+85-recoil, posY+yf+-28, posX+85-recoil, posY+yf+-28);
  quadraticVertex(posX+37-recoil, posY+yf+-28, posX+37-recoil, posY+yf+-28);
  quadraticVertex(posX+25-recoil, posY+yf+-22, posX+30-recoil, posY+yf+-9);



  endShape();





  ///FRont RL

  strokeWeight(2);
  stroke(#000000);
  fill(#a8a7a8);

  beginShape();

  vertex(posX+190-recoil, posY+yf+-20);
  quadraticVertex(posX+170-recoil, posY+yf+12, posX+190-recoil, posY+yf+45);
  quadraticVertex(posX+213-recoil, posY+yf+50, posX+245-recoil, posY+yf+45);
  quadraticVertex(posX+255-recoil, posY+yf+12, posX+245-recoil, posY+yf+-20);
  quadraticVertex(posX+213-recoil, posY+yf+-22, posX+190-recoil, posY+yf+-20);


  endShape();


  strokeWeight(2);
  stroke(#000000);
  line(posX+187-recoil, posY+yf+-13, posX+247-recoil, posY+yf+-13);

  /////light RL///////////// 

  strokeWeight(2);
  stroke(#000000);
  fill(#fa8700);//////colorl

  beginShape();

  vertex(posX+220-recoil, posY+yf+-13);
  quadraticVertex(posX+210-recoil, posY+yf+16, posX+220-recoil, posY+yf+46);
  quadraticVertex(posX+230-recoil, posY+yf+46, posX+230-recoil, posY+yf+46);
  quadraticVertex(posX+220-recoil, posY+yf+16, posX+230-recoil, posY+yf+-13);
  vertex(posX+220-recoil, posY+yf+-13);


  endShape();

  /////base RL01///////////// 


  strokeWeight(2);
  stroke(#000000);
  fill(#3f4247);

  beginShape();


  vertex(posX+240-recoil, posY+yf+46);
  quadraticVertex(posX+220-recoil, posY+yf+60, posX+220-recoil, posY+yf+60);
  quadraticVertex(posX+190-recoil, posY+yf+60, posX+190-recoil, posY+yf+60);
  quadraticVertex(posX+185-recoil, posY+yf+46, posX+185-recoil, posY+yf+46);
  quadraticVertex(posX+240-recoil, posY+yf+46, posX+240-recoil, posY+yf+46);



  endShape();


  ////////////////RLprojectilelauncher////////


  strokeWeight(2);
  stroke(#000000);
  fill(#626d73);

  beginShape();


  vertex(posX+250-recoil, posY+yf+8);
  quadraticVertex(posX+250-recoil, posY+yf+24, posX+250-recoil, posY+yf+24);
  quadraticVertex(posX+240-recoil, posY+yf+24, posX+230-recoil, posY+yf+16);
  quadraticVertex(posX+240-recoil, posY+yf+6, posX+250-recoil, posY+yf+8);


  endShape();


  strokeWeight(2);
  stroke(#000000);
  fill(#626d73);

  beginShape();


  vertex(posX+252-recoil, posY+yf+-13);
  quadraticVertex(posX+235-recoil, posY+yf+16, posX+252-recoil, posY+yf+46);
  quadraticVertex(posX+275-recoil, posY+yf+46, posX+275-recoil, posY+yf+46);
  quadraticVertex(posX+285-recoil, posY+yf+38, posX+285-recoil, posY+yf+38);
  quadraticVertex(posX+290-recoil, posY+yf+16, posX+285-recoil, posY+yf+-5);
  quadraticVertex(posX+275-recoil, posY+yf+-13, posX+275-recoil, posY+yf+-13);
  vertex(posX+252-recoil, posY+yf+-13);

  endShape();


  /////////////left foot 02//////////////////////////////////////////////   

  strokeWeight(2);
  stroke(#000000);
  fill(#000000);

  beginShape();


  vertex(posX+-130, posY+yf+120);
  quadraticVertex(posX+-137, posY+yf+125, posX+-145, posY+yf+120);
  quadraticVertex(posX+-156, posY+yf+110, posX+-163, posY+yf+120);
  quadraticVertex(posX+-168, posY+yf+120, posX+-168, posY+yf+120);
  quadraticVertex(posX+-168, posY+yf+140, posX+-168, posY+yf+140);
  quadraticVertex(posX+-182, posY+yf+144, posX+-182, posY+yf+144);
  quadraticVertex(posX+-200, posY+yf+161, posX+-200, posY+yf+178);
  quadraticVertex(posX+-168, posY+yf+158, posX+-168, posY+yf+158);
  quadraticVertex(posX+-145, posY+yf+158, posX+-148, posY+yf+158);
  quadraticVertex(posX+-152, posY+yf+155, posX+-148, posY+yf+142);
  quadraticVertex(posX+-139, posY+yf+135, posX+-130, posY+yf+135);
  vertex(posX+-130, posY+yf+120);



  endShape();



  ////////////Leg 02 C///////////////////////////////////////
  strokeWeight(2);
  stroke(#000000);
  fill(#292d3c);

  beginShape();


  vertex(posX+-80, posY+yf+100);
  quadraticVertex(posX+-90, posY+yf+90, posX+-100, posY+yf+100);
  quadraticVertex(posX+-130, posY+yf+120, posX+-130, posY+yf+120);
  quadraticVertex(posX+-130, posY+yf+135, posX+-130, posY+yf+135);
  quadraticVertex(posX+-95, posY+yf+130, posX+-60, posY+yf+120);
  vertex(posX+-80, posY+yf+100);



  endShape();


  //////////LEG 02B/////////////////////////////////////////////////



  strokeWeight(2);
  stroke(#000000);
  fill(#000000);

  beginShape();


  vertex(posX+-35, posY+yf+60);
  quadraticVertex(posX+-55, posY+yf+65, posX+-50, posY+yf+88);
  quadraticVertex(posX+-60, posY+yf+100, posX+-85, posY+yf+95);//
  quadraticVertex(posX+-80, posY+yf+115, posX+-65, posY+yf+125);//
  quadraticVertex(posX+-30, posY+yf+120, posX+5, posY+yf+95);//
  vertex(posX+-35, posY+yf+60);




  endShape();


  //////////////KNEE//////////////////////////////////////////////////////


  strokeWeight(2);
  stroke(#000000);
  fill(#000000);

  beginShape();


  vertex(posX+17, posY+yf+153);
  quadraticVertex(posX+85, posY+yf+180, posX+60, posY+yf+115);
  endShape();



  ////////////////LEG 01 /////////////////////////////////////////////////      

  strokeWeight(2);
  stroke(#000000);
  fill(#1b66c5);

  beginShape();


  vertex(posX+-5, posY+yf+50);
  quadraticVertex(posX+-50, posY+yf+50, posX+-40, posY+yf+85);
  quadraticVertex(posX+-15, posY+yf+106, posX+15, posY+yf+127);
  quadraticVertex(posX+60, posY+yf+135, posX+60, posY+yf+135);
  quadraticVertex(posX+65, posY+yf+125, posX+60, posY+yf+115);
  quadraticVertex(posX+35, posY+yf+80, posX+-5, posY+yf+50);


  endShape();


  ///////////LEG 01 B/////////////////////////////////////////////////////

  strokeWeight(2);
  stroke(#000000);
  fill(#133e78);

  beginShape();


  vertex(posX+60, posY+yf+135);
  quadraticVertex(posX+37, posY+yf+127, posX+8, posY+yf+127);
  quadraticVertex(posX+-3, posY+yf+133, posX+-15, posY+yf+127);//
  quadraticVertex(posX+-22, posY+yf+120, posX+-33, posY+yf+130);//
  quadraticVertex(posX+-45, posY+yf+130, posX+-45, posY+yf+130);//
  quadraticVertex(posX+-45, posY+yf+145, posX+-45, posY+yf+145);//
  quadraticVertex(posX+-57, posY+yf+150, posX+-57, posY+yf+150);//
  quadraticVertex(posX+-70, posY+yf+165, posX+-70, posY+yf+190);//
  quadraticVertex(posX+-45, posY+yf+165, posX+-45, posY+yf+165);//
  quadraticVertex(posX+-25, posY+yf+165, posX+-25, posY+yf+165);//
  quadraticVertex(posX+-25, posY+yf+147, posX+-15, posY+yf+145);
  quadraticVertex(posX+1, posY+yf+153, posX+17, posY+yf+153);
  quadraticVertex(posX+38, posY+yf+155, posX+60, posY+yf+135);



  endShape();



  strokeWeight(2);
  stroke(#000000);
  fill(#3f4247);

  ellipse(posX+50, posY+yf+140, 22, 22);




  ////RIGHT HAND//////////////   

  strokeWeight(2);
  stroke(#000000);
  fill(#133e78);

  beginShape();


  vertex(posX+57-recoil, posY+yf+38);
  quadraticVertex(posX+60-recoil, posY+yf+43, posX+57-recoil, posY+yf+48);
  quadraticVertex(posX+47-recoil, posY+yf+46, posX+45-recoil, posY+yf+48);
  quadraticVertex(posX+48-recoil, posY+yf+51, posX+45-recoil, posY+yf+55);
  quadraticVertex(posX+48-recoil, posY+yf+58, posX+45-recoil, posY+yf+62);
  quadraticVertex(posX+45-recoil, posY+yf+67, posX+35-recoil, posY+yf+72);
  quadraticVertex(posX+22-recoil, posY+yf+72, posX+15-recoil, posY+yf+67);
  quadraticVertex(posX+10-recoil, posY+yf+52, posX+15-recoil, posY+yf+38);
  quadraticVertex(posX+36-recoil, posY+yf+35, posX+57-recoil, posY+yf+38);

  endShape();

  line(posX+45-recoil, posY+yf+48, posX+35-recoil, posY+yf+48);
  line(posX+45-recoil, posY+yf+55, posX+35-recoil, posY+yf+55);
  line(posX+45-recoil, posY+yf+62, posX+35-recoil, posY+yf+62);



  /////////Right arm /////////////////////////////////////////////////////////////


  strokeWeight(2);
  stroke(#000000);
  fill(#1b66c5);

  beginShape();


  vertex(posX+-10-recoil, posY+yf+33);
  quadraticVertex(posX+-25-recoil, posY+yf+28, posX+-35-recoil, posY+yf+15);
  quadraticVertex(posX+-65-recoil, posY+yf+5, posX+-95-recoil, posY+yf+20);
  quadraticVertex(posX+-105-recoil, posY+yf+30, posX+-58-recoil, posY+yf+50);
  quadraticVertex(posX+-29-recoil, posY+yf+57, posX+-5-recoil, posY+yf+57);
  quadraticVertex(posX+-10-recoil, posY+yf+33, posX+-10-recoil, posY+yf+33);

  endShape();



  ///////golden hand protector///////////////

  strokeWeight(2);
  stroke(#000000);
  fill(#fac000);

  beginShape();


  vertex(posX+15-recoil, posY+yf+70);
  quadraticVertex(posX+20-recoil, posY+yf+55, posX+15-recoil, posY+yf+38);
  quadraticVertex(posX+8-recoil, posY+yf+22, posX+-13-recoil, posY+yf+30);
  quadraticVertex(posX+-8-recoil, posY+yf+42, posX+-13-recoil, posY+yf+55);
  quadraticVertex(posX+1-recoil, posY+yf+68, posX+15-recoil, posY+yf+70);


  endShape();


  ////////left hand///////////////////////////////////////////////

  strokeWeight(2);
  stroke(#000000);
  fill(#1865c5);

  beginShape();


  vertex(posX+175-recoil, posY+yf+50);
  quadraticVertex(posX+178-recoil, posY+yf+37, posX+175-recoil, posY+yf+25);
  quadraticVertex(posX+169-recoil, posY+yf+22, posX+163-recoil, posY+yf+25);
  quadraticVertex(posX+163-recoil, posY+yf+30, posX+163-recoil, posY+yf+30);
  quadraticVertex(posX+156-recoil, posY+yf+27, posX+150-recoil, posY+yf+30);
  quadraticVertex(posX+144-recoil, posY+yf+27, posX+138-recoil, posY+yf+30);
  quadraticVertex(posX+135-recoil, posY+yf+40, posX+138-recoil, posY+yf+50);
  quadraticVertex(posX+144-recoil, posY+yf+55, posX+150-recoil, posY+yf+50);
  quadraticVertex(posX+156-recoil, posY+yf+55, posX+163-recoil, posY+yf+50);
  quadraticVertex(posX+169-recoil, posY+yf+55, posX+175-recoil, posY+yf+50);

  endShape();


  line(posX+150-recoil, posY+yf+30, posX+150-recoil, posY+yf+50);
  line(posX+163-recoil, posY+yf+30, posX+163-recoil, posY+yf+50);


  /////////////thruster 00////////////////////


  strokeWeight(2);
  stroke(#000000);
  fill(#000000);

  beginShape();


  vertex(posX+-95, posY+yf+-113);
  vertex(posX+-80, posY+yf+-113);
  vertex(posX+-70, posY+yf+-123);
  //wing N7 thruster
  vertex(posX+-70, posY+yf+-143);
  vertex(posX+-80, posY+yf+-153);
  vertex(posX+-95, posY+yf+-153);
  vertex(posX+-95, posY+yf+-113);


  endShape();




  strokeWeight(2);
  stroke(#000000);
  fill(#626d73);

  beginShape();


  vertex(posX+-80, posY+yf+-113);
  vertex(posX+-70, posY+yf+-123);
  vertex(posX+-70, posY+yf+-143);
  vertex(posX+-80, posY+yf+-153);
  vertex(posX+-60, posY+yf+-153);
  vertex(posX+-50, posY+yf+-143);
  vertex(posX+-50, posY+yf+-123);
  vertex(posX+-60, posY+yf+-113);
  vertex(posX+-80, posY+yf+-113);
  //wing N7 thruster


  endShape();

  ////////////flame//////////////////////////////////////



  float xflameb=radiox*cos(radians(gradosb));
  //float x=0; //movimiento en x
  float yflameb=radioy*cos(radians(gradosb));
  //float y=0; //movimiento en y

  //float x=-radio*cos(radians(grados));
  //float y=radio*cos(radians(grados));


  //los grados son 0 y cos 0 es 1, entonces 1*100=100


  gradosb=gradosb+velocidadb;
  //optimizar programa
  if (gradosb>=360||gradosb<=0)
  {

    //grados=0;
    velocidadb=-velocidadb;
  }


  if (onAttack||fly)
  {
    f1=#FA5400;
    f2=#FAE100;
    f3=#feffff;
  } else
  {
    f1=#000dae;
    f2=#0069ff;
    f3=#feffff;
  }


  strokeWeight(2);
  stroke(f1);
  fill(f1);////color 3

  beginShape();

  vertex(posX+-95, posY+yf+-113);
  bezierVertex(posX+-115, posY+yf+-93, posX+-140, posY+yf+-133, posX+-160+xflameb, posY+yf+-133+yflameb);
  bezierVertex(posX+-140, posY+yf+-133, posX+-115, posY+yf+-173, posX+-95, posY+yf+-153);
  vertex(posX+-95, posY+yf+-113);


  endShape(CLOSE);




  strokeWeight(2);
  stroke(f2); //// color 4
  fill(f2);

  beginShape();

  vertex(posX+-95, posY+yf+-122);
  bezierVertex(posX+-115, posY+yf+-112, posX+-120, posY+yf+-133, posX+-130+xflameb, posY+yf+-133+yflameb);
  bezierVertex(posX+-120, posY+yf+-133, posX+-115, posY+yf+-158, posX+-95, posY+yf+-144);
  vertex(posX+-95, posY+yf+-122);


  endShape(CLOSE);




  strokeWeight(2);
  stroke(f3);
  fill(f3); ///color5

  beginShape();

  vertex(posX+-95, posY+yf+-127);
  bezierVertex(posX+-110, posY+yf+-120, posX+-107, posY+yf+-133, posX+-115+xflameb, posY+yf+-133+yflameb);
  bezierVertex(posX+-107, posY+yf+-133, posX+-110, posY+yf+-146, posX+-95, posY+yf+-139);
  vertex(posX+-95, posY+yf+-127);


  endShape(CLOSE);













  strokeWeight(2);
  stroke(#000000);
  fill(#FFFFFF);

  /*
    }
   else
   {
   
   //LEFT DRAW
   strokeWeight(5);
   point(posX,posY);
   triangle(posX,posY,posX,posY+30,posX-30,posY+15);
   
   
   
   
   }
   
   */






  strokeWeight(2);


  popMatrix();

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////user int/////////////


  guidedUser(score, lifes, ammo, arcade, life1, life2, life3, life4, portrait, person, arms, missile);






  if (onAttack && (mouseButton == LEFT)) {
    // Configure aquí el modo de ataque (variables)
    ///disparó 


    //////recoil


    vibx=random(-2, 2);
    viby=random(-2, 2); 
    if (posX>targetX)
    { 
      recoil=5;
    } else
    {

      recoil=-5;
    }
    fire=true;
    int a=1;





    ///////////seeker missile

    /*    
     pushMatrix();
     angle = atan2(xt-posX, yt-posY);
     translate(xt, yt);
     rotate(-angle-HALF_PI);
     rect(0, 0, 40, 2);
     ellipse(0, 0, 10, 10);
     */



    /////////////////////////////////////////////////////////////////

    ///Missile Launch position correction


    if (posX>targetX)
    { 

      missilX=posX;
      missilX=missilX*-1;
      targetX=targetX*-1; 

      a=-1;
    } else
    {
      missilX=posX;
    }



    targetX=targetX-260;
    //posX=posX-260;

    //determinar diferencia





    float dxm=targetX-missilX;
    float dym=targetY-posY;

    /*
  float dxm=posX-targetX;
     float dym=posY-targetY;
     */


    //porcentaje para calculo posicion


    xm=missilX+(dxm*pm);
    ym=posY+(dym*pm);

    /*
  xm=targetX+(dxm*pm);
     ym=targetY+(dym*pm);
     */

    //aplico velocidad al porcentaje

    pm=pm+vpm;

    if (pm==vpm)
    {
      rd=0;
      rd2=0;
      rd3=0;    

      effect.trigger();
    }

    if (pm>=1.0||pm<=0)
    {

      //vpm=-vpm;
      pm=0;
      fire=false;
      arms=arms-1;
      explosion.trigger();
      effect.stop();
      exploit=true;
      
    }






    float xflame=radiox*cos(radians(grados));
    //float x=0; //movimiento en x
    float yflame=radioy*cos(radians(grados));
    //float y=0; //movimiento en y

    //float x=-radio*cos(radians(grados));
    //float y=radio*cos(radians(grados));


    //los grados son 0 y cos 0 es 1, entonces 1*100=100


    grados=grados+velocidad;
    //optimizar programa
    if (grados>=360||grados<=0)
    {

      //grados=0;
      velocidad=-velocidad;
    }




    /////////////////////////MISSIL////////////////////////////////////




    //escale to invert shape

    scale(a, 1);


/*
    //////MISSILE COLLIDER///////
    strokeWeight(2);
    stroke(#000000); //// color 7
    noFill();
    ellipse(xm+280, ym+10, 50, 50);
    ///////////////////////
*/
    c1x=xm+280;
    c1y=ym+10;
    c1r=25;

    if (posX>targetX)
    { 
      c1x=xm+280;
      c1y=ym+10;
      c1r=25;
    }



    boolean hit = circleCircle(c1x, c1y, c1r, c2x, c2y, c2r);
    if (hit) {
      fill(255, 150, 0);

      for (int i=0; i<size; i++)
      {

        ex[i]=(int)random(1000, 3000);
        ey[i]=(int)random(-height/2+100, height/2-100);
      }

      mov=0;
      score=score+1000;
    } else {
    }


    boolean target = circleTango(c1x, c1y, c1r, c3x, c3y, c3r);
    if (target) {
      fill(255, 150, 0);

      for (int i=0; i<size; i++)
      {

        int e2x=(int)random(1000, 3000);
        int e2y=(int)random(-height/2+100, height/2-100);
      }

      mov=0;
      score=score+1000;
    } else {
    }





    ////////////flame2//////////////////////////////////////

    strokeWeight(2);
    stroke(#FA5400);
    fill(#FA5400);////color 6

    beginShape();

    vertex(xm-10+240, ym+0);
    bezierVertex(xm-25+240, ym+-20, xm-50+240, ym+12, xm-70+240+xflame, ym+12+yflame);
    bezierVertex(xm-50+240, ym+12, xm-25+240, ym+44, xm-10+240, ym+24);
    vertex(xm-10+240, ym+0);


    endShape(CLOSE);




    strokeWeight(2);
    stroke(#FAE100); //// color 7
    fill(#FAE100);

    beginShape();

    vertex(xm+-10+240, ym+4);
    bezierVertex(xm+-25*0.8+240, ym+-20*0.8+4, xm+-50*0.8+240, ym+12*0.8+4, xm+-40+240+xflame+5, ym+12+yflame);
    bezierVertex(xm+-50*0.8+240, ym+12*0.8-2, xm+-25*0.8+240, ym+44*0.8-2, xm+-10+240, ym+20);
    vertex(xm+-10+240, ym+4);


    endShape(CLOSE);




    strokeWeight(2);
    stroke(#feffff);
    fill(#feffff); ///color8

    beginShape();

    vertex(xm+-10+240, ym+8);
    bezierVertex(xm+-25*0.4+240, ym+-20*0.4+8, xm+-50*0.4+240, ym+12*0.4+8, xm+-20+240+xflame+10, ym+12+yflame);
    bezierVertex(xm+-50*0.4+240, ym+12*0.4, xm+-25*0.4+240, ym+44*0.4, xm+-10+240, ym+16);
    vertex(xm+-10+240, ym+8);


    endShape(CLOSE);








    ////////////////////thrust me, hehe/////////////////




    strokeWeight(2);
    stroke(#000000);
    fill(#292c3c);


    beginShape();


    vertex(xm+0+240, ym+4);
    quadraticVertex(xm+0+240, ym+20, xm+0+240, ym+20);
    quadraticVertex(xm+-5+240, ym+24, xm+-10+240, ym+24);
    quadraticVertex(xm+-15+240, ym+12, xm+-10+240, ym+0);
    quadraticVertex(xm+-5+240, ym+0, xm+0+240, ym+4);


    endShape();


    /////////BODY/////////////////

    strokeWeight(2);
    stroke(#000000);
    fill(#a8a7a8);


    beginShape();


    vertex(xm+0+240, ym+0);
    quadraticVertex(xm+60+240, ym+0, xm+60+240, ym+0);
    quadraticVertex(xm+65+240, ym+12, xm+60+240, ym+24);
    quadraticVertex(xm+0+240, ym+24, xm+0+240, ym+24);
    quadraticVertex(xm+-5+240, ym+12, xm+0+240, ym+0);


    endShape();


    /////body line////////////

    strokeWeight(2);
    stroke(#626d73);
    fill(#626d73);

    beginShape();


    vertex(xm+50+240, ym+0);
    quadraticVertex(xm+45+240, ym+12, xm+50+240, ym+24);
    quadraticVertex(xm+45+240, ym+24, xm+45+240, ym+24);
    quadraticVertex(xm+40+240, ym+12, xm+45+240, ym+0);
    vertex(xm+50+240, ym+0);


    endShape();

    ///////////head/////////////////

    strokeWeight(2);
    stroke(#000000);
    fill(#ff0000);


    beginShape();


    vertex(xm+60+240, ym+-1);
    quadraticVertex(xm+55+240, ym+12, xm+60+240, ym+25);
    quadraticVertex(xm+67+240, ym+25, xm+75+240, ym+20);
    quadraticVertex(xm+77+240, ym+12, xm+75+240, ym+4);
    quadraticVertex(xm+67+240, ym+-2, xm+60+240, ym+-1);


    endShape();


    strokeWeight(2);
    stroke(#000000);
    fill(#FFFFFF);
  }



  //if (onAttack&& (mouseButton == RIGHT)) {

  if (onAttack&& (mouseButton == RIGHT)) {



    if (posX>targetX)
    { 
      recoil2=5;
    } else
    {

      recoil2=-5;
    }
    fire=true;

    vibx=random(-2, 2);
    viby=random(-2, 2); 



    //line(posX, posY, targetX, targetY);




    ///////////seeker missile


    pushMatrix();
    angle = atan2(xt-targetX, yt-targetY);
    translate(xt, yt);
    rotate(-angle-HALF_PI);





    /////////////////////////////////////////////////////////////////





    //targetX=targetX-260;

    xm=-200;
    ym=0;
    missilX=0;


    ///////return missile to starting position




    if (xt>targetX-50&&xt<targetX+50&&yt<targetY+50&&yt>targetY-50)
    {

      xt=posX+missilX-20;
      yt=posY-100;
    }






    //aplico velocidad al porcentaje

    pm=pm+vpm;

    if (pm>=1.0||pm<=0)
    {

      //vpm=-vpm;
      pm=0;
      fire=false;
    }



    float xflame=radiox*cos(radians(grados));
    //float x=0; //movimiento en x
    float yflame=radioy*cos(radians(grados));
    //float y=0; //movimiento en y

    //float x=-radio*cos(radians(grados));
    //float y=radio*cos(radians(grados));


    //los grados son 0 y cos 0 es 1, entonces 1*100=100


    grados=grados+velocidad;
    //optimizar programa
    if (grados>=360||grados<=0)
    {

      //grados=0;
      velocidad=-velocidad;
    }


    /////////////////////////MISSIL////////////////////////////////////



    ////////////flame2//////////////////////////////////////

    strokeWeight(2);
    stroke(#FA5400);
    fill(#FA5400);////color 6

    beginShape();

    vertex(xm-10+240, ym+0);
    bezierVertex(xm-25+240, ym+-20, xm-50+240, ym+12, xm-70+240+xflame, ym+12+yflame);
    bezierVertex(xm-50+240, ym+12, xm-25+240, ym+44, xm-10+240, ym+24);
    vertex(xm-10+240, ym+0);


    endShape(CLOSE);




    strokeWeight(2);
    stroke(#FAE100); //// color 7
    fill(#FAE100);

    beginShape();

    vertex(xm+-10+240, ym+4);
    bezierVertex(xm+-25*0.8+240, ym+-20*0.8+4, xm+-50*0.8+240, ym+12*0.8+4, xm+-40+240+xflame+5, ym+12+yflame);
    bezierVertex(xm+-50*0.8+240, ym+12*0.8-2, xm+-25*0.8+240, ym+44*0.8-2, xm+-10+240, ym+20);
    vertex(xm+-10+240, ym+4);


    endShape(CLOSE);




    strokeWeight(2);
    stroke(#feffff);
    fill(#feffff); ///color8

    beginShape();

    vertex(xm+-10+240, ym+8);
    bezierVertex(xm+-25*0.4+240, ym+-20*0.4+8, xm+-50*0.4+240, ym+12*0.4+8, xm+-20+240+xflame+10, ym+12+yflame);
    bezierVertex(xm+-50*0.4+240, ym+12*0.4, xm+-25*0.4+240, ym+44*0.4, xm+-10+240, ym+16);
    vertex(xm+-10+240, ym+8);


    endShape(CLOSE);





    ////////////////////thrust me, hehe/////////////////



    strokeWeight(2);
    stroke(#000000);
    fill(#292c3c);


    beginShape();


    vertex(xm+0+240, ym+4);
    quadraticVertex(xm+0+240, ym+20, xm+0+240, ym+20);
    quadraticVertex(xm+-5+240, ym+24, xm+-10+240, ym+24);
    quadraticVertex(xm+-15+240, ym+12, xm+-10+240, ym+0);
    quadraticVertex(xm+-5+240, ym+0, xm+0+240, ym+4);


    endShape();


    /////////BODY/////////////////

    strokeWeight(2);
    stroke(#000000);
    fill(#a8a7a8);


    beginShape();


    vertex(xm+0+240, ym+0);
    quadraticVertex(xm+60+240, ym+0, xm+60+240, ym+0);
    quadraticVertex(xm+65+240, ym+12, xm+60+240, ym+24);
    quadraticVertex(xm+0+240, ym+24, xm+0+240, ym+24);
    quadraticVertex(xm+-5+240, ym+12, xm+0+240, ym+0);


    endShape();


    /////body line////////////

    strokeWeight(2);
    stroke(#626d73);
    fill(#626d73);

    beginShape();


    vertex(xm+50+240, ym+0);
    quadraticVertex(xm+45+240, ym+12, xm+50+240, ym+24);
    quadraticVertex(xm+45+240, ym+24, xm+45+240, ym+24);
    quadraticVertex(xm+40+240, ym+12, xm+45+240, ym+0);
    vertex(xm+50+240, ym+0);


    endShape();

    ///////////head/////////////////

    strokeWeight(2);
    stroke(#000000);
    fill(#00A8FF);


    beginShape();


    vertex(xm+60+240, ym+-1);
    quadraticVertex(xm+55+240, ym+12, xm+60+240, ym+25);
    quadraticVertex(xm+67+240, ym+25, xm+75+240, ym+20);
    quadraticVertex(xm+77+240, ym+12, xm+75+240, ym+4);
    quadraticVertex(xm+67+240, ym+-2, xm+60+240, ym+-1);


    endShape();


    strokeWeight(2);
    stroke(#000000);
    fill(#FFFFFF);


    popMatrix();


    xt += (targetX - xt) * easing;
    yt += (targetY - yt) * easing;
  }

  if (!onAttack)
  {

    recoil=0; 
    recoil2=0;
  }

  //////controls

  if (direction && (key=='a'||key=='A'))
  {


    turn=true;
    //println(turn);

    if (posX>-940)
    {

      posX=posX-speedX;
      //println(posX);
    }
  }


  if (direction && (key=='d'||key=='D'))
  {


    turn=false;
    //println(turn);
    if (posX<940)
    {

      posX=posX+speedX;
    }
  }

  if (direction && (key == ' '))
  {

    fly=true;
    if (posY>-380) {
      posY=posY-speedY;
    }

    if (direction && (key=='a'||key=='A'))
    {


      turn=true;
      //println(turn);

      if (posX>-940)
      {

        posX=posX-speedX;
        // println(posX);
      }



      if (direction && (key=='d'||key=='D'))
      {


        turn=false;
        //println(turn);
        if (posX<940)
        {

          posX=posX+speedX;
        }
      }
    }
  } else
  {
    fly=false;
    posY=posY+speedYN;
  }

  ///////////////////////////controls/////////
}






void guidedUser(int score, int lifes, int ammo, PFont arcade, color life1, color life2, color life3, color life4, PImage portrait, PImage person, int arms, PImage missile)
{

if(lifes>0)
{

  //////////////////////GAME GUIDE USER INTERFACE////////////////////
  String player=" ";



  /////PORTRAIT

  strokeWeight(2);
  stroke(#000000);
  noFill();

  //rect(-900, -490, 150, 150);


  image(person, -905, -495);//character
  image(portrait, -960, -540);




  ////HEALTH BAR

  if (lifes==4)
  {
    life1=#FF7300;
    life2=#FF7300;
    life3=#FF7300;
    life4=#FF7300;
  }
  if (lifes==3)
  {
    life1=#FF7300;
    life2=#FF7300;
    life3=#FF7300;
    life4=#000000;
  }
  if (lifes==2)
  {
    life1=#FF7300;
    life2=#FF7300;
    life3=#000000;
    life4=#000000;
  }
  if (lifes==1)
  {
    life1=#FF7300;
    life2=#000000;
    life3=#000000;
    life4=#000000;
  }



  strokeWeight(4);
  stroke(#000000);
  fill(life1);
  quad(-720, -470, -640, -470, -660, -420, -720, -420);

  strokeWeight(4);
  stroke(#000000);
  fill(life2);
  quad(-630, -470, -630+80, -470, -630+60, -420, -630-20, -420);

  strokeWeight(4);
  stroke(#000000);
  fill(life3);
  quad(-540, -470, -540+80, -470, -540+60, -420, -540-20, -420);

  strokeWeight(4);
  stroke(#000000);
  fill(life4);
  quad(-450, -470, -450+60, -470, -450+60, -420, -450-20, -420);


  ////VIDAS

  fill(#FFFFFF);//white
  textFont(arcade);
  textSize(50);
  if (charac==1)
  {
    player="Soldier 76";
  }
  if (charac==2)
  {
    player="Pharah";
  }
  if (charac==3)
  {
    player="D.va";
  }
  if (charac==4)
  {
    player="Widowmaker";
  }

  text(player, -690, -360);
  text("X "+lifes+" RP!", -690, -300);

  /////MUNITION COUNT


  strokeWeight(4);
  stroke(#FFFFFF);
  noFill();

  rect(-200, -490, 400, 100, 10, 10, 10, 10);

  fill(#FFFFFF);//white
  textFont(arcade);
  textSize(50);
  text("ARMS", 20, -450);
  text(arms, 30, -400);

  image(missile, -150, -465);

  strokeWeight(4);
  stroke(#FFFFFF);
  noFill();

  rect(-150, -475, 120, 70, 10, 10, 10, 10);

  ////SCORE



  fill(#FFFFFF);//white
  textFont(arcade);
  textSize(80);
  text("SCORE "+score, 400, -450);
}

  ////////////////////////////////////////////////////////////////////
}


void checkifAlive(int score, int lifes, int arms)
{




  if (lifes>0)
  {


    fill(#EA0202);//white
    textSize(50);
    text("CAREFUL!", -100, 0);
    posX=-710;
    posY=-190;
  }
  if (lifes==0||arms==0)
  {
    
    dead=true;
    if(dead)
    {
    timer1=0;
    }
    background(#000000);
    image(gameover,-500,-500);
    fill(#EA0202);//white
    textSize(50);
    text("GAME OVER", 200, 0);
    //text("SCORE "+score, -200, -200);
    
  }
}

void explosion()
{


  rd=rd+10;
  rd2=rd2+15;
  rd3=rd3+20;   
  //println(rd);

  if (rd<=radio)
  {
    strokeWeight(2);
    fill(#FF8103);
    stroke(#FF8103);
    ellipse(targetX, targetY, 0+rd3, 0+rd3);
    strokeWeight(2);
    fill(#FFB031);
    stroke(#FFB031);
    ellipse(targetX, targetY, 0+rd2, 0+rd2);
    strokeWeight(2);
    fill(#FFF150);
    stroke(#FFF150);
    ellipse(targetX, targetY, 0+rd, 0+rd);
  }
}

void  enemySpawn(int imgbackX, int timer1, int goAway)
{

  mov=mov-sp;




  for (int i=0; i<ex.length; i++)

  {

    if (ex[i]+mov<=-1000) 
    {
      ex[i]=(int)random(1000, 3000);
      ey[i]=(int)random(-height/2+100, height/2-100);
      mov=0;
    }



    eye=(int)random(0, 255);
    r1=(int)random(-wide, wide);
    r2=(int)random(-wide, wide);
    r3=(int)random(-wide, wide);
    r4=(int)random(-wide, wide);
    r5=(int)random(-wide, wide);

    light=color(random(0, 255), random(0, 255), random(0, 255));
    light2=color(random(0, 255), random(0, 255), random(0, 255));




    ////spike

    strokeWeight(2);
    stroke(#000000);
    fill(#5F5B5B);

    beginShape();


    vertex(35+ex[i]+mov, 35+goAway+ey[i]);
    quadraticVertex(5+ex[i]+mov, 75+goAway+ey[i], 5+ex[i]+mov, 100+goAway+ey[i]);
    vertex(-5+ex[i]+mov, 100+goAway+ey[i]);
    quadraticVertex(-5+ex[i]+mov, 75+goAway+ey[i], -35+ex[i]+mov, 35+goAway+ey[i]);
    quadraticVertex(-75+ex[i]+mov, 5+goAway+ey[i], -100+ex[i]+mov, 5+goAway+ey[i]);
    vertex(-100+ex[i]+mov, -5+goAway+ey[i]);
    quadraticVertex(-75+ex[i]+mov, -5+goAway+ey[i], -35+ex[i]+mov, -35+goAway+ey[i]);
    quadraticVertex(-5+ex[i]+mov, -75+goAway+ey[i], -5+ex[i]+mov, -100+goAway+ey[i]);
    vertex(5+ex[i]+mov, -100+goAway+ey[i]);
    quadraticVertex(5+ex[i]+mov, -75+goAway+ey[i], 35+ex[i]+mov, -35+goAway+ey[i]);
    quadraticVertex(75+ex[i]+mov, -5+goAway+ey[i], 100+ex[i]+mov, -5+goAway+ey[i]);
    vertex(100+ex[i]+mov, 5+goAway+ey[i]);
    quadraticVertex(75+ex[i]+mov, 5+goAway+ey[i], 35+ex[i]+mov, 35+goAway+ey[i]);

    endShape();

    ////mine body



    strokeWeight(3);
    stroke(#000000);
    fill(#595C5D);

    ellipse(0+ex[i]+mov, 0+goAway+ey[i], 120, 120);

    strokeWeight(1);
    stroke(#787E7E);
    fill(#787E7E);

    ellipse(0+ex[i]+mov, 0+goAway+ey[i], 105, 105);

    strokeWeight(1);
    stroke(#1DEA13);
    fill(#1DEA13);
    ellipse(35+ex[i]+mov, 35+goAway+ey[i], 5, 5);
    ellipse(-35+ex[i]+mov, 35+goAway+ey[i], 5, 5);
    ellipse(-35+ex[i]+mov, -35+goAway+ey[i], 5, 5);
    ellipse(35+ex[i]+mov, -35+goAway+ey[i], 5, 5);

    strokeWeight(1);
    stroke(#52C2FC);
    fill(#52C2FC);
    ellipse(0+ex[i]+mov, 10+goAway+ey[i], 100, 10);

    ////eye
    strokeWeight(2);
    stroke(#000000);
    fill(#FFFFFF);

    beginShape();


    vertex(0+ex[i]+mov, 15+goAway+ey[i]);
    vertex(20+ex[i]+mov, -15+goAway+ey[i]);
    quadraticVertex(0+ex[i]+mov, -20+goAway+ey[i], -20+ex[i]+mov, -15+goAway+ey[i]);
    vertex(0+ex[i]+mov, 15+goAway+ey[i]);


    endShape();


    strokeWeight(2);
    stroke(#000000);
    fill(#007FFA);

    ellipse(0+ex[i]+mov, -6+goAway+ey[i], 20, 20);

    strokeWeight(2);
    stroke(0, 0, eye);
    fill(0, 0, eye);

    ellipse(0+ex[i]+mov, -6+goAway+ey[i], 10, 10);


    strokeWeight(3);
    stroke(light);
    fill(light);

    line(80+r1+ex[i]+mov, -80+goAway+ey[i], 80+r2+ex[i]+mov, -40+goAway+ey[i]);
    line(80+r2+ex[i]+mov, -40+goAway+ey[i], 80+r3+ex[i]+mov, 0+goAway+ey[i]);
    line(80+r3+ex[i]+mov, 0+goAway+ey[i], 80+r4+ex[i]+mov, 40+goAway+ey[i]);
    line(80+r4+ex[i]+mov, 40+goAway+ey[i], 80+r5+ex[i]+mov, 80+goAway+ey[i]);

    strokeWeight(3);
    stroke(light);
    fill(light2);

    line(85+r2+ex[i]+mov, -80+goAway+ey[i], 85+r3+ex[i]+mov, -40+goAway+ey[i]);
    line(85+r3+ex[i]+mov, -40+goAway+ey[i], 85+r4+ex[i]+mov, 0+goAway+ey[i]);
    line(85+r4+ex[i]+mov, 0+goAway+ey[i], 85+r5+ex[i]+mov, 40+goAway+ey[i]);
    line(85+r5+ex[i]+mov, 40+goAway+ey[i], 85+r1+ex[i]+mov, 80+goAway+ey[i]);

    strokeWeight(3);
    stroke(light);
    fill(light);

    line(-80+r1+ex[i]+mov, -80+goAway+ey[i], -80+r2+ex[i]+mov, -40+goAway+ey[i]);
    line(-80+r2+ex[i]+mov, -40+goAway+ey[i], -80+r3+ex[i]+mov, 0+goAway+ey[i]);
    line(-80+r3+ex[i]+mov, 0+goAway+ey[i], -80+r4+ex[i]+mov, 40+goAway+ey[i]);
    line(-80+r4+ex[i]+mov, 40+goAway+ey[i], -80+r5+ex[i]+mov, 80+goAway+ey[i]);

    strokeWeight(3);
    stroke(light);
    fill(light2);

    line(-85+r2+ex[i]+mov, -80+goAway+ey[i], -85+r3+ex[i]+mov, -40+goAway+ey[i]);
    line(-85+r3+ex[i]+mov, -40+goAway+ey[i], -85+r4+ex[i]+mov, 0+goAway+ey[i]);
    line(-85+r4+ex[i]+mov, 0+goAway+ey[i], -85+r5+ex[i]+mov, 40+goAway+ey[i]);
    line(-85+r5+ex[i]+mov, 40+goAway+ey[i], -85+r1+ex[i]+mov, 80+goAway+ey[i]);

    ///collider
    /*
    strokeWeight(3);
    stroke(#000000);
    noFill();
    ellipse(0+ex[i]+mov, 0+goAway+ey[i], 150, 150);
    //println(ex[i]+mov);
    
    */
  }



  for (int i=0; i<size; i++)
  {

    c2x=ex[i]+mov;
    c2y=ey[i];
  }

  c2r=100;
}

boolean circleCircle(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance


  float distX = c1x - c2x;
  float distY= c1y - c2y;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  if (posX>targetX)

  {


    distX = c1x + c2x;
    distY= c1y -+c2y;
    distance = sqrt( (distX*distX) - (distY*distY) );
  }

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distance <= c1r+c2r) {
    return true;
  }
  return false;
}


void  mineSpawn(int imgbackX, int timer1, int goAway)
{

  mov=mov-sp2;




  for (int i=0; i<ex.length; i++)

  {

    if (e2x+mov<=-1000) 
    {
      e2x=(int)random(1000, 3000);
      e2y=(int)random(-height/2+100, height/2-100);
      mov=0;
    }



    eye=(int)random(0, 255);
    r1=(int)random(-wide, wide);
    r2=(int)random(-wide, wide);
    r3=(int)random(-wide, wide);
    r4=(int)random(-wide, wide);
    r5=(int)random(-wide, wide);

    light=color(random(0, 255), random(0, 255), random(0, 255));
    light2=color(random(0, 255), random(0, 255), random(0, 255));




    ////spike

    strokeWeight(2);
    stroke(#000000);
    fill(#5F5B5B);

    beginShape();


    vertex(35+e2x+mov, 35+goAway+e2y);
    quadraticVertex(5+e2x+mov, 75+goAway+e2y, 5+e2x+mov, 100+goAway+e2y);
    vertex(-5+e2x+mov, 100+goAway+e2y);
    quadraticVertex(-5+e2x+mov, 75+goAway+e2y, -35+e2x+mov, 35+goAway+e2y);
    quadraticVertex(-75+e2x+mov, 5+goAway+e2y, -100+e2x+mov, 5+goAway+e2y);
    vertex(-100+e2x+mov, -5+goAway+e2y);
    quadraticVertex(-75+e2x+mov, -5+goAway+e2y, -35+e2x+mov, -35+goAway+e2y);
    quadraticVertex(-5+e2x+mov, -75+goAway+e2y, -5+e2x+mov, -100+goAway+e2y);
    vertex(5+e2x+mov, -100+goAway+e2y);
    quadraticVertex(5+e2x+mov, -75+goAway+e2y, 35+e2x+mov, -35+goAway+e2y);
    quadraticVertex(75+e2x+mov, -5+goAway+e2y, 100+e2x+mov, -5+goAway+e2y);
    vertex(100+e2x+mov, 5+goAway+e2y);
    quadraticVertex(75+e2x+mov, 5+goAway+e2y, 35+e2x+mov, 35+goAway+e2y);

    endShape();

    ////mine body



    strokeWeight(3);
    stroke(#000000);
    fill(#595C5D);

    ellipse(0+e2x+mov, 0+goAway+e2y, 120, 120);

    strokeWeight(1);
    stroke(#787E7E);
    fill(#787E7E);

    ellipse(0+e2x+mov, 0+goAway+e2y, 105, 105);

    strokeWeight(1);
    stroke(#1DEA13);
    fill(#1DEA13);
    ellipse(35+e2x+mov, 35+goAway+e2y, 5, 5);
    ellipse(-35+e2x+mov, 35+goAway+e2y, 5, 5);
    ellipse(-35+e2x+mov, -35+goAway+e2y, 5, 5);
    ellipse(35+e2x+mov, -35+goAway+e2y, 5, 5);

    strokeWeight(1);
    stroke(#52C2FC);
    fill(#52C2FC);
    ellipse(0+e2x+mov, 10+goAway+e2y, 100, 10);

    ////eye
    strokeWeight(2);
    stroke(#000000);
    fill(#FFFFFF);

    beginShape();


    vertex(0+e2x+mov, 15+goAway+e2y);
    vertex(20+e2x+mov, -15+goAway+e2y);
    quadraticVertex(0+e2x+mov, -20+goAway+e2y, -20+e2x+mov, -15+goAway+e2y);
    vertex(0+e2x+mov, 15+goAway+e2y);


    endShape();


    strokeWeight(2);
    stroke(#000000);
    fill(#007FFA);

    ellipse(0+e2x+mov, -6+goAway+e2y, 20, 20);

    strokeWeight(2);
    stroke(0, 0, eye);
    fill(0, 0, eye);

    ellipse(0+e2x+mov, -6+goAway+e2y, 10, 10);


    strokeWeight(3);
    stroke(light);
    fill(light);

    line(80+r1+e2x+mov, -80+goAway+e2y, 80+r2+e2x+mov, -40+goAway+e2y);
    line(80+r2+e2x+mov, -40+goAway+e2y, 80+r3+e2x+mov, 0+goAway+e2y);
    line(80+r3+e2x+mov, 0+goAway+e2y, 80+r4+e2x+mov, 40+goAway+e2y);
    line(80+r4+e2x+mov, 40+goAway+e2y, 80+r5+e2x+mov, 80+goAway+e2y);

    strokeWeight(3);
    stroke(light);
    fill(light2);

    line(85+r2+e2x+mov, -80+goAway+e2y, 85+r3+e2x+mov, -40+goAway+e2y);
    line(85+r3+e2x+mov, -40+goAway+e2y, 85+r4+e2x+mov, 0+goAway+e2y);
    line(85+r4+e2x+mov, 0+goAway+e2y, 85+r5+e2x+mov, 40+goAway+e2y);
    line(85+r5+e2x+mov, 40+goAway+e2y, 85+r1+e2x+mov, 80+goAway+e2y);

    strokeWeight(3);
    stroke(light);
    fill(light);

    line(-80+r1+e2x+mov, -80+goAway+e2y, -80+r2+e2x+mov, -40+goAway+e2y);
    line(-80+r2+e2x+mov, -40+goAway+e2y, -80+r3+e2x+mov, 0+goAway+e2y);
    line(-80+r3+e2x+mov, 0+goAway+e2y, -80+r4+e2x+mov, 40+goAway+e2y);
    line(-80+r4+e2x+mov, 40+goAway+e2y, -80+r5+e2x+mov, 80+goAway+e2y);

    strokeWeight(3);
    stroke(light);
    fill(light2);

    line(-85+r2+e2x+mov, -80+goAway+e2y, -85+r3+e2x+mov, -40+goAway+e2y);
    line(-85+r3+e2x+mov, -40+goAway+e2y, -85+r4+e2x+mov, 0+goAway+e2y);
    line(-85+r4+e2x+mov, 0+goAway+e2y, -85+r5+e2x+mov, 40+goAway+e2y);
    line(-85+r5+e2x+mov, 40+goAway+e2y, -85+r1+e2x+mov, 80+goAway+e2y);

    ///collider
    strokeWeight(3);
    stroke(light); ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    noFill();
    ellipse(0+e2x+mov, 0+goAway+e2y, 150, 150);
    //println(ex[i]+mov);
  }



  for (int i=0; i<size; i++)
  {

    c3x=e2x+mov;
    c3y=e2y;
  }

  c3r=100;
}

boolean circleTango(float c1x, float c1y, float c1r, float c3x, float c3y, float c3r) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance


  float distX = c1x - c3x;
  float distY= c1y - c3y;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  if (posX>targetX)

  {


    distX = c1x + c3x;
    distY= c1y -+c3y;
    distance = sqrt( (distX*distX) - (distY*distY) );
  }

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distance <= c1r+c3r) {
    return true;
  }
  return false;
}


void  minebeta(int imgbackX, int timer1, int goAway)
{

  mov=mov-sp2;




  for (int i=0; i<ex.length; i++)

  {

    if (e2x+mov<=-1000) 
    {
      e2x=(int)random(1000, 3000);
      e2y=(int)random(-height/2+100, height/2-100);
      mov=0;
    }



    eye=(int)random(0, 255);
    r1=(int)random(-wide, wide);
    r2=(int)random(-wide, wide);
    r3=(int)random(-wide, wide);
    r4=(int)random(-wide, wide);
    r5=(int)random(-wide, wide);

    light=color(random(0, 255), random(0, 255), random(0, 255));
    light2=color(random(0, 255), random(0, 255), random(0, 255));

 


    ////spike

    strokeWeight(2);
    stroke(#000000);
    fill(#5F5B5B);

    beginShape();


    vertex(minx+35, 35+miny);
    quadraticVertex(minx+5, 75+miny, minx+5, 100+miny);
    vertex(minx+-5, 100+miny);
    quadraticVertex(minx+-5, 75+miny, minx+-35, 35+miny);
    quadraticVertex(minx+-75, 5+miny, minx+-100, 5+miny);
    vertex(minx+-100, -5+miny);
    quadraticVertex(minx+-75, -5+miny, minx+-35, -35+miny);
    quadraticVertex(minx+-5, -75+miny, minx+-5, -100+miny);
    vertex(minx+5, -100+miny);
    quadraticVertex(minx+5, -75+miny, minx+ 35, -35+miny);
    quadraticVertex(minx+75, -5+miny, minx+100, -5+miny);
    vertex(minx+100, 5+miny);
    quadraticVertex(minx+75, 5+miny, minx+ 35, 35+miny);

    endShape();

    ////mine body



    strokeWeight(3);
    stroke(#000000);
    fill(#595C5D);

    ellipse(minx+0, 0+miny, 120, 120);

    strokeWeight(1);
    stroke(#787E7E);
    fill(#787E7E);

    ellipse(minx+0, 0+miny, 105, 105);

    strokeWeight(1);
    stroke(#2CC2D1);
    fill(#2CC2D1);
    ellipse(minx+35, 35+miny, 5, 5);
    ellipse(minx+-35, 35+miny, 5, 5);
    ellipse(minx+-35, -35+miny, 5, 5);
    ellipse(minx+35, -35+miny, 5, 5);

    strokeWeight(1);
    stroke(#E32020);
    fill(#E32020);
    ellipse(minx+0, 10+miny, 100, 10);

    ////eye
    strokeWeight(2);
    stroke(#000000);
    fill(#FFFFFF);

    beginShape();


    vertex(minx+0, 15+miny);
    vertex(minx+20, -15+miny);
    quadraticVertex(minx+0, -20+miny, -20+minx, -15+miny);
    vertex(minx+0, 15+miny);


    endShape();


    strokeWeight(2);
    stroke(#000000);
    fill(#BC0F0F);

    ellipse(minx+0, -6+miny, 20, 20);

    strokeWeight(2);
    stroke(eye, 0, 0);
    fill(eye, 0, 0);

    ellipse(minx+0, -6+miny, 10, 10);



    strokeWeight(3);
    stroke(light);
    noFill();

    beginShape();

    vertex(minx+0, -105+miny);
    vertex(minx+20+r1, -85+miny);
    vertex(minx+50+r2, -55+miny);
    vertex(minx+80+r3, -25+miny);
    vertex(minx+105, 0+miny);
    vertex(minx+80+r4, 25+miny);
    vertex(minx+50+r5, 55+miny);
    vertex(minx+20+r1, 85+miny);
    vertex(minx+0, 105+miny);
    vertex(minx+-20+r2, 85+miny);
    vertex(minx+-50+r3, 55+miny);
    vertex(minx+-80+r4, 25+miny);
    vertex(minx+-105, 0+miny);
    vertex(minx+-80+r5, -25+miny);
    vertex(minx+-50+r1, -55+miny);
    vertex(minx+-20+r2, -85+miny);
    vertex(minx+0, -105+miny);

    endShape();


    strokeWeight(5);
    stroke(#000000);
    noFill();

    point(minx+0, 100+miny);
    point(minx+0, -100+miny);
    point(minx+100, 0+miny);
    point(minx+-100, 0+miny);



    strokeWeight(2);
    stroke(light);
    noFill();

    beginShape();

    vertex(minx+0, -110+miny);
    vertex(minx+20+r1, -90+miny);
    vertex(minx+50+r2, -60+miny);
    vertex(minx+80+r3, -30+miny);
    vertex(minx+110, 0+miny);
    vertex(minx+80+r4, 30+miny);
    vertex(minx+50+r5, 60+miny);
    vertex(minx+20+r1, 90+miny);
    vertex(minx+0, 110+miny);
    vertex(minx+-20+r2, 90+miny);
    vertex(minx+-50+r3, 60+miny);
    vertex(minx+-80+r4, 30+miny);
    vertex(minx+-110, 0+miny);
    vertex(minx+-80+r5, -30+miny);
    vertex(minx+-50+r1, -60+miny);
    vertex(minx+-20+r2, -90+miny);
    vertex(minx+0, -110+miny);

    endShape();
  }


  mvy=mvy+may;//cambiar la velocidad segun aceleración (ay=1) "gravedad"
  miny=miny+mvy;//movement y, posicion y segun velocidad
  minx=minx+mvx;//movimiento en x, posicion x segun velocidad - 1 Movimiento lineal en x



  if (minx>=960-100||minx<=-960+100) 
  {
    mvx=-mvx;
  }
 


  if (miny>=500||miny<=-500) 
  {
   
    mvy=mvy+1;//se pierde 1 por ay se le suma 1 para mantener a la misma altura (elasticidad)
    mvy=-mvy;


    for (int i=0; i<size; i++)
    {

      c3x=e2x+mov;
      c3y=e2y;
    }

    c3r=100;
  }
}


void omnicHalcion(int imgbackX, int timer1, int goAway)
{
  
 mov=mov-sp3;




  for (int i=0; i<hx.length; i++)

  {

    if (hx[i]+mov<=-1000) 
    {
      hx[i]=(int)random(1000, 3000);
      hy[i]=(int)random(-height/2+100, height/2-400);
      mov=0;
    }


  rce=(int)random(0,255);

  float xflameO=radioxa*cos(radians(gradosO));
  //float x=0; //movimiento en x
  float YflameO=radioya*cos(radians(gradosO));
  //float y=0; //movimiento en y

  //float x=-radio*cos(radians(grados));
  //float y=radio*cos(radians(grados));


  //los grados son 0 y cos 0 es 1, entonces 1*100=100


  gradosO=gradosO+velocidadO;
  //optimizar programa
  if (gradosO>=360||gradosO<=0)
  {

    //grados=0;
    velocidadO=-velocidadO;
  }


  //////flame

  strokeWeight(3);
  stroke(#03BEFF);
  fill(#03BEFF);

  beginShape();

  vertex(hx[i]+mov+80, -40+hy[i]);
  quadraticVertex(hx[i]+mov+100+xflameO, 80+hy[i], hx[i]+mov+100, 80+hy[i]);
  quadraticVertex(hx[i]+mov+170, -20+hy[i], hx[i]+mov+170+xflameO, -20+hy[i]);
  quadraticVertex(hx[i]+mov+80, -40+hy[i], hx[i]+mov+80, -40+hy[i]);


  endShape();

  strokeWeight(3);
  stroke(#03D7FF);
  fill(#03D7FF);

  beginShape();

  vertex(hx[i]+mov+80, -20+hy[i]);
  quadraticVertex(hx[i]+mov+100+xflameO, 60+hy[i], hx[i]+mov+100, 60+hy[i]);
  quadraticVertex(hx[i]+mov+150, -20+hy[i], hx[i]+mov+150+xflameO, -10+hy[i]);
  quadraticVertex(hx[i]+mov+80, -40+hy[i], hx[i]+mov+80, -20+hy[i]);


  endShape();

  strokeWeight(3);
  stroke(#FFFFFF);
  fill(#FFFFFF);

  beginShape();

  vertex(hx[i]+mov+80, 0+hy[i]);
  quadraticVertex(hx[i]+mov+90+xflameO, 50+hy[i], hx[i]+mov+90, 50+hy[i]);
  quadraticVertex(hx[i]+mov+130, 0+hy[i], hx[i]+mov+130+xflameO, 0+hy[i]);
  quadraticVertex(hx[i]+mov+80, -20+hy[i], hx[i]+mov+80, 0+hy[i]);
  endShape();

  //////wing01

  strokeWeight(3);
  stroke(#393939);
  fill(#5F5B5B);

  beginShape();

  vertex(hx[i]+mov+0, -20+hy[i]);
  quadraticVertex(hx[i]+mov+-80, -60+hy[i], hx[i]+mov+-80, -60+hy[i]);
  quadraticVertex(hx[i]+mov+-120, -50+hy[i], hx[i]+mov+-120, -50+hy[i]);
  quadraticVertex(hx[i]+mov+-80, 20+hy[i], hx[i]+mov+-80, 90+hy[i]);
  quadraticVertex(hx[i]+mov+0, -20+hy[i], hx[i]+mov+0, -20+hy[i]);

  endShape();
  
  strokeWeight(3);
  stroke(#393939);
  fill(#000000);

  beginShape();

  vertex(hx[i]+mov+0, -20+hy[i]);
  quadraticVertex(hx[i]+mov+-60, -50+hy[i], hx[i]+mov+-60, -50+hy[i]);
  quadraticVertex(hx[i]+mov+-80, -40+hy[i], hx[i]+mov+-80, -40+hy[i]);
  quadraticVertex(hx[i]+mov+-30, 0+hy[i], hx[i]+mov+-30, 0+hy[i]);
  quadraticVertex(hx[i]+mov+0, -20+hy[i], hx[i]+mov+0, -20+hy[i]);

  endShape();
  
  

  ////propulseur///////////


  strokeWeight(3);
  stroke(#000000);
  fill(#000000);

  beginShape();

  vertex(hx[i]+mov+0, 20+hy[i]);
  quadraticVertex(hx[i]+mov+80, +hy[i]-40, hx[i]+mov+80, -40+hy[i]);
  quadraticVertex(hx[i]+mov+120, 0+hy[i], hx[i]+mov+100, 80+hy[i]);
  quadraticVertex(hx[i]+mov+0, 20+hy[i], hx[i]+mov+0, 20+hy[i]);


  endShape();
  
  strokeWeight(3);
  stroke(#FFFFFF);
  fill(#FFFFFF);

  beginShape();

  vertex(hx[i]+mov+70, -20+hy[i]);
  quadraticVertex(hx[i]+mov+100, 30+hy[i],100+hx[i]+mov, 80+hy[i]);
  quadraticVertex(hx[i]+mov+100, 30+hy[i],70+hx[i]+mov, -20+hy[i]);



  endShape();


  

  /////////cockpit/////////

  strokeWeight(3);
  stroke(#393939);
  fill(#5F5B5B);

  beginShape();

  vertex(hx[i]+mov+-100, 140+hy[i]);
  quadraticVertex(hx[i]+mov+-80, 0+hy[i], hx[i]+mov+80, -130+hy[i]);
  quadraticVertex(hx[i]+mov+20, 0+hy[i], hx[i]+mov+120, 80+hy[i]);
  quadraticVertex(hx[i]+mov+140, 100+hy[i], hx[i]+mov+120, 120+hy[i]);
  quadraticVertex(hx[i]+mov+-20, 200+hy[i], hx[i]+mov+-100, 140+hy[i]);


  endShape();


  //////engine

  strokeWeight(4);
  stroke(#000000);
  fill(#FF0000);

  beginShape();

  vertex(hx[i]+mov+-20, 120+hy[i]);
  quadraticVertex(hx[i]+mov+20, 120+hy[i],hx[i]+mov+ 60, 100+hy[i]);
  quadraticVertex(hx[i]+mov+70, 70+hy[i], hx[i]+mov+40, 60+hy[i]);
  quadraticVertex(hx[i]+mov+0, 80+hy[i], hx[i]+mov+-20, 120+hy[i]);


  endShape();



  //////window

  strokeWeight(3);
  stroke(#393939);
  fill(#393939);

  beginShape();

  vertex(hx[i]+mov+0, -20+hy[i]);
  quadraticVertex(hx[i]+mov+20, 100+hy[i], hx[i]+mov+-80, 100+hy[i]);
  quadraticVertex(hx[i]+mov+-40, -20+hy[i], hx[i]+mov+0, -20+hy[i]);



  endShape();


  //////window2

  strokeWeight(3);
  stroke(#000000);
  fill(#000000);

  beginShape();

  vertex(hx[i]+mov+3, 0+hy[i]);
  quadraticVertex(hx[i]+mov+20, 80+hy[i], hx[i]+mov+-60, 90+hy[i]);
  quadraticVertex(hx[i]+mov+-40, 0+hy[i], hx[i]+mov+3, 0+hy[i]);

  endShape();


  /////eye-cam 


  strokeWeight(4);
  stroke(#BF0404);
  fill(rce,0,0);

  beginShape();

  vertex(hx[i]+mov+6, 30+hy[i]);
  quadraticVertex(hx[i]+mov+5, 60+hy[i], hx[i]+mov+-10, 70+hy[i]);
  quadraticVertex(hx[i]+mov+-30, 60+hy[i], hx[i]+mov+6, 30+hy[i]);

  endShape();

  //////wing02

  strokeWeight(3);
  stroke(#393939);
  fill(#5F5B5B);

  beginShape();

  vertex(hx[i]+mov+0, 150+hy[i]);
  quadraticVertex(hx[i]+mov+80, 80+hy[i], hx[i]+mov+160, 60+hy[i]);
  quadraticVertex(hx[i]+mov+260, 130+hy[i], hx[i]+mov+260, 130+hy[i]);
  quadraticVertex(hx[i]+mov+230, 150+hy[i], hx[i]+mov+230, 150+hy[i]);
  quadraticVertex(hx[i]+mov+75, 150+hy[i],hx[i]+mov+ 0, 150+hy[i]);

  endShape();


  //////wing55555

  strokeWeight(3);
  stroke(#393939);
  fill(#000000);

  beginShape();

  vertex(hx[i]+mov+140, 90+hy[i]);
  quadraticVertex(hx[i]+mov+140, 90+hy[i], hx[i]+mov+140, 90+hy[i]);
  quadraticVertex(hx[i]+mov+210, 120+hy[i],hx[i]+mov+ 210, 120+hy[i]);
  quadraticVertex(hx[i]+mov+230, 110+hy[i], hx[i]+mov+230, 110+hy[i]);
  quadraticVertex(hx[i]+mov+180, 75+hy[i], hx[i]+mov+180, 75+hy[i]);
  vertex(hx[i]+mov+140, 90+hy[i]);

  endShape();

  /////triangle

  strokeWeight(3);
  stroke(#00FF01);
  fill(#00FF01);

  triangle(hx[i]+mov+30, 0+hy[i], hx[i]+mov+30, 30+hy[i], hx[i]+mov+50, 20+hy[i]);




  endShape();

////hitbox
/*
  strokeWeight(3);
  noStroke();
  noFill();
  
  ellipse(hx[i]+mov+20,50+hy[i],200,200);
*/
  
  }
  
}
void  halcionalpha(int imgbackX, int timer1, int goAway)
{
rce=(int)random(0, 255);

  float xflameO=radioxa*cos(radians(gradosO));
  //float x=0; //movimiento en x
  float YflameO=radioya*cos(radians(gradosO));
  //float y=0; //movimiento en y

  //float x=-radio*cos(radians(grados));
  //float y=radio*cos(radians(grados));


  //los grados son 0 y cos 0 es 1, entonces 1*100=100


  gradosO=gradosO+velocidadO;
  //optimizar programa
  if (gradosO>=360||gradosO<=0)
  {

    //grados=0;
    velocidadO=-velocidadO;
  }


  //////flame

  strokeWeight(3);
  stroke(#FA5400);
  fill(#FA5400);

  beginShape();

  vertex(80, -40);
  quadraticVertex(100+xflameO, 80, 100, 80);
  quadraticVertex(170, -20, 170+xflameO, -20);
  quadraticVertex(80, -40, 80, -40);


  endShape();

  strokeWeight(3);
  stroke(#FAE100);
  fill(#FAE100);

  beginShape();

  vertex(80, -20);
  quadraticVertex(100+xflameO, 60, 100, 60);
  quadraticVertex(150, -20, 150+xflameO, -10);
  quadraticVertex(80, -40, 80, -20);


  endShape();

  strokeWeight(3);
  stroke(#FFFFFF);
  fill(#FFFFFF);

  beginShape();

  vertex(80, 0);
  quadraticVertex(90+xflameO, 50, 90, 50);
  quadraticVertex(130, 0, 130+xflameO, 0);
  quadraticVertex(80, -20, 80, 0);

  endShape();
  
  
  
  
  ///cannon
  strokeWeight(3);
  stroke(#393939);
  fill(#000000);

  beginShape();

  vertex(-80, 145);
  quadraticVertex(-70, 185, -70, 185);
  quadraticVertex(0, 175, 0, 175);
  quadraticVertex(0, 145, 0, 145);

  endShape();

  strokeWeight(3);
  stroke(#393939);
  fill(#393939);

  ellipse(-50, 165, 50, 25);




  strokeWeight(3);
  stroke(#393939);
  fill(#000000);


  beginShape();

  vertex(-50, 155);
  quadraticVertex(-140, 165, -140, 165);
  quadraticVertex(-140, 185, -140, 185);
  quadraticVertex(-50, 175, -50, 175);
  quadraticVertex(-40, 165, -50, 155);

  endShape();



  strokeWeight(3);
  stroke(#393939);
  fill(#000000);

  ellipse(-140, 175, 20, 20);


  strokeWeight(3);
  stroke(#393939);
  fill(#393939);
  ellipse(-120, 172, 5, 10);

  
  
  
  //////wing01

  strokeWeight(3);
  stroke(#393939);
  fill(#5F5B5B);

  beginShape();

  vertex(0, -20);
  quadraticVertex(-80, -60, -80, -60);
  quadraticVertex(-120, -50, -120, -50);
  quadraticVertex(-80, 20, -80, 90);
  quadraticVertex(0, -20, 0, -20);

  endShape();

  strokeWeight(3);
  stroke(#393939);
  fill(#000000);

  beginShape();

  vertex(0, -20);
  quadraticVertex(-60, -50, -60, -50);
  quadraticVertex(-80, -40, -80, -40);
  quadraticVertex(-30, 0, -30, 0);
  quadraticVertex(0, -20, 0, -20);

  endShape();



  ////propulseur///////////


  strokeWeight(3);
  stroke(#000000);
  fill(#000000);

  beginShape();

  vertex(0, 20);
  quadraticVertex(80, -40, 80, -40);
  quadraticVertex(120, 0, 100, 80);
  quadraticVertex(0, 20, 0, 20);


  endShape();

  strokeWeight(3);
  stroke(#FFFFFF);
  fill(#FFFFFF);

  beginShape();

  vertex(70, -20);
  quadraticVertex(100, 30, 100, 80);
  quadraticVertex(100, 30, 70, -20);



  endShape();




  /////////cockpit/////////

  strokeWeight(3);
  stroke(#393939);
  fill(#5F5B5B);

  beginShape();

  vertex(-100, 140);
  quadraticVertex(-80, 0, 80, -130);
  quadraticVertex(20, 0, 120, 80);
  quadraticVertex(140, 100, 120, 120);
  quadraticVertex(-20, 200, -100, 140);


  endShape();


  //////engine

  strokeWeight(4);
  stroke(#000000);
  fill(#00ACFF);

  beginShape();

  vertex(-20, 120);
  quadraticVertex(20, 120, 60, 100);
  quadraticVertex(70, 70, 40, 60);
  quadraticVertex(0, 80, -20, 120);


  endShape();



  //////window

  strokeWeight(3);
  stroke(#393939);
  fill(#393939);

  beginShape();

  vertex(0, -20);
  quadraticVertex(20, 100, -80, 100);
  quadraticVertex(-40, -20, 0, -20);



  endShape();


  //////window2

  strokeWeight(3);
  stroke(#000000);
  fill(#000000);

  beginShape();

  vertex(3, 0);
  quadraticVertex(20, 80, -60, 90);
  quadraticVertex(-40, 0, 3, 0);

  endShape();


  /////eye-cam 


  strokeWeight(4);
  fill(#00ACFF);
  stroke(0, 0, rce);

  beginShape();

  vertex(6, 30);
  quadraticVertex(5, 60, -10, 70);
  quadraticVertex(-30, 60, 6, 30);

  endShape();



  /////ruckets



  strokeWeight(3);
  stroke(#393939);
  fill(#5F5B5B);

  beginShape();

  vertex(80, 155);
  quadraticVertex(180, 130, 180, 130);
  quadraticVertex(210, 155, 180, 180);
  quadraticVertex(80, 205, 80, 205);

  endShape();


  strokeWeight(3);
  stroke(#393939);
  fill(#5F5B5B);

  ellipse(80, 180, 30, 50);

  strokeWeight(2);
  stroke(#000000);
  fill(#000000);

  ellipse(80, 180, 5, 10);
  ellipse(70, 180, 5, 10);
  ellipse(90, 180, 5, 10);
  ellipse(80, 195, 5, 10);
  ellipse(80, 165, 5, 10);


  strokeWeight(2);
  stroke(#7E0404);
  fill(#FF0000);

  ellipse(150, 165, 5, 10);
  ellipse(140, 168, 5, 10);




  //////wing02

  strokeWeight(3);
  stroke(#393939);
  fill(#5F5B5B);

  beginShape();

  vertex(0, 150);
  quadraticVertex(80, 80, 160, 60);
  quadraticVertex(260, 130, 260, 130);
  quadraticVertex(230, 150, 230, 150);
  quadraticVertex(75, 150, 0, 150);

  endShape();


  //////wing55555

  strokeWeight(3);
  stroke(#393939);
  fill(#000000);

  beginShape();

  vertex(140, 90);
  quadraticVertex(140, 90, 140, 90);
  quadraticVertex(210, 120, 210, 120);
  quadraticVertex(230, 110, 230, 110);
  quadraticVertex(180, 75, 180, 75);
  vertex(140, 90);

  endShape();

  /////triangle

  strokeWeight(3);
  stroke(#FFE200);
  fill(#FFE200);

  triangle(30, 0, 30, 30, 50, 20);

  
////hitbox test
/*
  strokeWeight(3);
  stroke(#000000);
  noFill();
  
  ellipse(20,50,200,200);
  */
}
