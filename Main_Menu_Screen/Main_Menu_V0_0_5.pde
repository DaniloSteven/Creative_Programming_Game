

import ddf.minim.*;

Minim minim;
AudioPlayer music;

int bx, by;
int l=13;
float y1=0;
float y2=0;
float cr;
int a=10;
int speed=10;
int b=5;
int m=5;
int startp[], posx[], posy[];
color la, lb, start;

PImage turner, bullet, copy;
PFont arcade;

int time;

void setup() {
  fullScreen(P2D);

  ///time




  ///





  ///images

  turner=loadImage("turner.png");
  bullet=loadImage("bullet.png");
  copy=loadImage("cr.png");
  arcade = loadFont("ArcadeClassic-50.vlw");



  /////

  float b=random(0, 100);
  float d=random(0, 100);


  la=#262c20;
  lb=#151702;


  posx= new int[10];
  posy= new int[10];

  startp= new int[l];

  for (int i=0; i<startp.length; i++)
  {
    startp[i] = (int)random(-1100, -800);
  }


  for (int i=0; i<posx.length; i++)
  {
    posx[i] = (int)random(50, width-50);
    posy[i] = (int)random(100, height-200);
  }




  minim= new Minim(this);
  music=minim.loadFile("Main.mp3");
  music.loop();
}


void draw() {

  background(#323132);
  //background(#FFFFFF);


  ///the time

  time = millis()/1000;
  float timebullet;
  timebullet = millis()/1000;

  if (time%2==0)
  {

    start=#FFFFFF;
  } else
  {
    start=#323132;
  }

  /////

  for (int i=0; i<posx.length; i++)
  {
    image(bullet, posx[i], posy[i]);
    
   
  }

  //change starting position

  for (int i=0; i<startp.length; i++)
  {
    if (startp[i]<0)
    {
      startp[i] = startp[i]+speed;
      println(startp[1]);
    }
  }



  stroke(#FF8400);
  /*
  cr=(int)random(74,160);
   stroke(255,cr,0);
   */

  for (int i = 0; i < music.bufferSize() - 1; i++)
  {


    float x1 = map( i, 0, music.bufferSize(), 0, width );
    float x2 = map( i+1, 0, music.bufferSize(), 0, width );
    line( x1, 1100+y1 + music.left.get(i)*50, x2, 1120 + music.left.get(i+1)*50 );
    line( x1, -20+y2 + music.right.get(i)*50, x2, -40 + music.right.get(i+1)*50 );
  }

  // draw a line to show where in the song playback is currently located
  float posx = map(music.position(), 0, music.length(), 0, width);

  stroke(#0D83DB);
  //line(posx, 0, posx, height);

  if (y1>=-80&&y2<=80)
  {
    y1=y1-1;
    y2=y2+1;
  }




  //line(0, height/2, width, height/2);
  //line(100, 0, 100, height);
  //line(width-100, 0, width-100, height);
  //line(0, height/2-150, width, height/2-150);
  //line(0, height/2+150, width, height/2+150);


  stroke(#FF5E00);




  ///THE "X"




  strokeWeight(3);
  stroke(#393939);
  fill(#393939);


  beginShape();


  vertex(1580-startp[12], height/2+90);
  vertex(1720-startp[12], height/2+380);
  vertex(1690-startp[12], height/2+380);
  vertex(1550-startp[12], height/2+90);
  vertex(1580-startp[12], height/2+90);


  endShape();

  strokeWeight(3);
  stroke(#393939);
  fill(#393939);


  beginShape();


  vertex(1720-startp[12], height/2-380);
  vertex(1580-startp[12], height/2-90);
  vertex(1550-startp[12], height/2-90);
  vertex(1670-startp[12], height/2-330);
  vertex(1720-startp[12], height/2-380);

  endShape();


/*

  strokeWeight(5);
  stroke(#000000);
  fill(#FFFFFF);

  point(1860-startp[12], height/2+380);
  point(1720-startp[12], height/2);
  point(1860-startp[12], height/2-380);
  point(1720-startp[12], height/2-380);
  point(1580-startp[12], height/2-90);
  point(1440-startp[12], height/2-380);
  point(1300-startp[12], height/2-380);
  point(1440-startp[12], height/2);
  point(1300-startp[12], height/2+380);
  point(1440-startp[12], height/2+380);
  point(1580-startp[12], height/2+90);

*/


  strokeWeight(3);
  stroke(#6A6A6A);
  fill(#6A6A6A);


  beginShape();

  vertex(1860-startp[12], height/2+380);
  vertex(1680-startp[12], height/2);
  vertex(1860-startp[12], height/2-380);
  vertex(1720-startp[12], height/2-380);
  vertex(1580-startp[12], height/2-90);
  vertex(1440-startp[12], height/2-380);
  vertex(1300-startp[12], height/2-380);
  vertex(1480-startp[12], height/2);
  vertex(1300-startp[12], height/2+380);
  vertex(1440-startp[12], height/2+380);
  vertex(1580-startp[12], height/2+90);
  vertex(1720-startp[12], height/2+380);
  vertex(1860-startp[12], height/2+380);

  endShape();



  strokeWeight(3);
  stroke(#393939);
  fill(#393939);


  beginShape();


  vertex(1300-startp[12], height/2-380);
  vertex(1480-startp[12], height/2);
  vertex(1300-startp[12], height/2+380);
  vertex(1270-startp[12], height/2+380);
  vertex(1450-startp[12], height/2);
  vertex(1290-startp[12], height/2-330);
  vertex(1300-startp[12], height/2-380);

  endShape();

  strokeWeight(3);
  stroke(#989898);
  fill(#989898);


  beginShape();

  vertex(1860-40-startp[12], height/2+380-30);
  vertex(1680-30-startp[12], height/2);
  vertex(1860-40-startp[12], height/2-380+30);
  vertex(1720+10-startp[12], height/2-380+30);
  vertex(1580-startp[12], height/2-90+40);
  vertex(1440-10-startp[12], height/2-380+30);
  vertex(1300+40-startp[12], height/2-380+30);
  vertex(1480+30-startp[12], height/2);
  vertex(1300+40-startp[12], height/2+380-30);
  vertex(1440-10-startp[12], height/2+380-30);
  vertex(1580-startp[12], height/2+90-40);
  vertex(1720+10-startp[12], height/2+380-30);
  vertex(1860-40-startp[12], height/2+380-30);

  endShape();



  ////images

  image(turner, 1860-40-startp[12], height/2+380-30);
  image(turner, 1860-40-startp[12], height/2-380);
  image(turner, 1720-startp[12], height/2-380);
  image(turner, 1440-30-startp[12], height/2-380);
  image(turner, 1300+10-startp[12], height/2-380);
  image(turner, 1300+10-startp[12], height/2+380-30);
  image(turner, 1440-30-startp[12], height/2+380-30);
  image(turner, 1720-startp[12], height/2+380-30);



  ////  LETTER O

  strokeWeight(2);
  stroke(#0e0b06);
  fill(#0e0b06);

  beginShape();


  vertex(240, height/2-90+startp[1]);
  vertex(160, height/2-90+startp[1]);
  vertex(130, height/2+60+startp[1]);
  vertex(60, height/2+120+startp[1]);
  vertex(100, height/2+130+startp[1]);
  vertex(160, height/2+80+startp[1]);
  vertex(190, height/2-60+startp[1]);
  vertex(240, height/2-60+startp[1]);

  endShape();


  strokeWeight(2);
  stroke(#0e0b06);
  fill(#0e0b06);

  beginShape();


  vertex(240, height/2-90+startp[1]);
  vertex(160, height/2-90+startp[1]);
  vertex(190, height/2-60+startp[1]);
  vertex(240, height/2-60+startp[1]);

  endShape(); 

  strokeWeight(2);
  stroke(#151702);
  fill(#262c20);


  beginShape();

  vertex(270, height/2-150+startp[1]);
  quadraticVertex(310, height/2-140+startp[1], 320, height/2-100+startp[1]);
  vertex(300, height/2+150+startp[1]);
  quadraticVertex(285, height/2+180+startp[1], 260, height/2+180+startp[1]);
  vertex(100, height/2+180+startp[1]);
  vertex(70, height/2+150+startp[1]);
  vertex(250, height/2+150+startp[1]);



  endShape(); 


  strokeWeight(4);
  stroke(#000000); 


  //line(120, height/2-150, 290, height/2-150);//O


  beginShape();

  fill(#ffe500);
  vertex(60, height/2+120+startp[1]);
  vertex(100, height/2-120+startp[1]);
  quadraticVertex(100, height/2-140+startp[1], 120, height/2-150+startp[1]);
  vertex(140, height/2-150+startp[1]);
  vertex(270, height/2-150+startp[1]);
  quadraticVertex(290, height/2-140+startp[1], 290, height/2-120+startp[1]);
  fill(#b53701);
  vertex(270, height/2+120+startp[1]);
  quadraticVertex(270, height/2+145+startp[1], 250, height/2+150+startp[1]);
  vertex(70, height/2+150+startp[1]);
  vertex(140, height/2+90+startp[1]);

  vertex(210, height/2+90+startp[1]);
  fill(#ff6801);
  vertex(230, height/2-90+startp[1]);
  vertex(160, height/2-90+startp[1]);
  vertex(130, height/2+60+startp[1]);
  vertex(60, height/2+120+startp[1]);

  endShape();


  ///letter V
  //line(300, height/2-80, 480, height/2-80);//V


  ///trangle++

  strokeWeight(3);
  stroke(#151702);
  fill(#262c20);


  beginShape();


  vertex(360+a, height/2-90+b+startp[2]);
  vertex(440+a, height/2-90+b+startp[2]);
  vertex(400+a, height/2-150+b+startp[2]);
  vertex(360+a, height/2-90+b+startp[2]);

  endShape();


  //triangle a

  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);

  beginShape();

  fill(#ff6801);//orange
  vertex(360, height/2-90+startp[2]);
  vertex(440, height/2-90+startp[2]);
  fill(#ffe500);//yellow
  vertex(400, height/2-150+startp[2]);
  vertex(360, height/2-90+startp[2]);

  endShape();

  //v++


  strokeWeight(3);
  stroke(lb);
  fill(la);

  beginShape();

  fill(#262c20);
  vertex(320+a, height/2-20+b+startp[3]);
  vertex(300+a, height/2-20+b+startp[3]);
  vertex(300+a, height/2-80+b+startp[3]);
  vertex(360+a, height/2-80+b+startp[3]);
  vertex(375+a, height/2+40+b+startp[3]);
  vertex(440+a, height/2-80+b+startp[3]);
  fill(#151702);
  vertex(480+a, height/2-80+b+startp[3]);
  vertex(480+a, height/2-20+b+startp[3]);
  vertex(460+a, height/2-20+b+startp[3]);
  fill(#262c20);
  vertex(380+a, height/2+150+b+startp[3]);
  vertex(330+a, height/2+150+b+startp[3]);
  vertex(320+a, height/2-20+b+startp[3]);

  endShape();


  //letter v


  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);

  beginShape();

  fill(#ffe500);
  vertex(320, height/2-20+startp[3]);
  vertex(300, height/2-20+startp[3]);
  vertex(300, height/2-80+startp[3]);
  vertex(360, height/2-80+startp[3]);
  vertex(375, height/2+40+startp[3]);
  vertex(440, height/2-80+startp[3]);
  fill(#ff6801);
  vertex(480, height/2-80+startp[3]);
  vertex(480, height/2-20+startp[3]);
  vertex(460, height/2-20+startp[3]);
  fill(#b53701);
  vertex(380, height/2+150+startp[3]);
  vertex(330, height/2+150+startp[3]);
  vertex(320, height/2-20+startp[3]);

  endShape();
  //E++

  strokeWeight(3);
  stroke(#000000);
  fill(#b53701);

  beginShape();

  fill(la);//yellow
  vertex(490+a, height/2-20+b+startp[4]);
  vertex(490+a, height/2-80+b+startp[4]);
  vertex(670+a, height/2-80+b+startp[4]);
  vertex(670+a, height/2-20+b+startp[4]);
  vertex(600+a, height/2-20+b+startp[4]);
  vertex(600+a, height/2-30+b+startp[4]);
  vertex(570+a, height/2-30+b+startp[4]);
  vertex(570+a, height/2+b+startp[4]);
  vertex(600+a, height/2+b+startp[4]);
  fill(lb);//orange
  vertex(600+a, height/2+60+b+startp[4]);
  vertex(570+a, height/2+60+b+startp[4]);
  fill(lb);//dark o
  vertex(570+a, height/2+90+b+startp[4]);
  vertex(600+a, height/2+90+b+startp[4]);
  vertex(600+a, height/2+80+b+startp[4]);
  vertex(670+a, height/2+80+b+startp[4]);
  vertex(670+a, height/2+150+b+startp[4]);
  vertex(490+a, height/2+150+b+startp[4]);
  vertex(490+a, height/2+80+b+startp[4]);
  vertex(510+a, height/2+80+b+startp[4]);
  fill(la);//yellow
  vertex(510+a, height/2-20+b+startp[4]);
  vertex(490+a, height/2-20+b+startp[4]);

  endShape();

  //LRTTER E
  //line(490, height/2-80, 670, height/2-80);//E



  strokeWeight(3);
  stroke(#000000);
  fill(#b53701);

  beginShape();

  fill(#ffe500);//yellow
  vertex(490, height/2-20+startp[4]);
  vertex(490, height/2-80+startp[4]);
  vertex(670, height/2-80+startp[4]);
  vertex(670, height/2-20+startp[4]);
  vertex(600, height/2-20+startp[4]);
  vertex(600, height/2-30+startp[4]);
  vertex(570, height/2-30+startp[4]);
  vertex(570, height/2+startp[4]);
  vertex(600, height/2+startp[4]);
  fill(#ff6801);//orange
  vertex(600, height/2+60+startp[4]);
  vertex(570, height/2+60+startp[4]);
  fill(#b53701);//dark o
  vertex(570, height/2+90+startp[4]);
  vertex(600, height/2+90+startp[4]);
  vertex(600, height/2+80+startp[4]);
  vertex(670, height/2+80+startp[4]);
  vertex(670, height/2+150+startp[4]);
  vertex(490, height/2+150+startp[4]);
  vertex(490, height/2+80+startp[4]);
  vertex(510, height/2+80+startp[4]);
  fill(#ffe500);//yellow
  vertex(510, height/2-20+startp[4]);
  vertex(490, height/2-20+startp[4]);

  endShape();


  // R++

  strokeWeight(3);
  stroke(lb);
  fill(la);

  beginShape();

  fill(la);//dark o
  vertex(680+a, height/2-20+b+startp[5]);
  vertex(680+a, height/2-80+b+startp[5]);
  fill(lb);//yellow
  quadraticVertex(830+a, height/2-80+b+startp[5], 830+a, height/2-80+b+startp[5]);
  quadraticVertex(870+a, height/2-30+b+startp[5], 830+a, height/2+20+b+startp[5]);
  vertex(780+a, height/2+20+b+startp[5]);
  fill(la);//orange 
  vertex(830+a, height/2+90+b+startp[5]);
  vertex(860+a, height/2+90+b+startp[5]);
  vertex(860+a, height/2+150+b+startp[5]);
  vertex(810+a, height/2+150+b+startp[5]);
  vertex(750+a, height/2+70+b+startp[5]);
  vertex(750+a, height/2+150+b+startp[5]);
  fill(lb);//dark o
  vertex(680+a, height/2+150+b+startp[5]);
  vertex(680+a, height/2+90+b+startp[5]);
  vertex(700+a, height/2+90+b+startp[5]);
  fill(la);//yellow
  vertex(700+a, height/2-20+b+startp[5]);
  vertex(680+a, height/2-20+b+startp[5]);
  endShape();

  ///lettre R


  //line(680, height/2-80, 860, height/2-80);//R



  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);

  beginShape();

  fill(#b53701);//dark o
  vertex(680, height/2-20+startp[5]);
  vertex(680, height/2-80+startp[5]);
  fill(#ffe500);//yellow
  quadraticVertex(830, height/2-80+startp[5], 830, height/2-80+startp[5]);
  quadraticVertex(870, height/2-30+startp[5], 830, height/2+20+startp[5]);
  vertex(780, height/2+20+startp[5]);
  fill(#ff6801);//orange 
  vertex(830, height/2+90+startp[5]);
  vertex(860, height/2+90+startp[5]);
  vertex(860, height/2+150+startp[5]);
  vertex(810, height/2+150+startp[5]);
  vertex(750, height/2+70+startp[5]);
  vertex(750, height/2+150+startp[5]);
  fill(#b53701);//dark o
  vertex(680, height/2+150+startp[5]);
  vertex(680, height/2+90+startp[5]);
  vertex(700, height/2+90+startp[5]);
  fill(#ffe500);//yellow
  vertex(700, height/2-20+startp[5]);
  vertex(680, height/2-20+startp[5]);

  endShape();

  //letter R hole


  strokeWeight(3);
  stroke(#000000);
  fill(#323132);

  beginShape();

  vertex(750, height/2-10+startp[5]);
  vertex(750, height/2-50+startp[5]);
  vertex(800, height/2-50+startp[5]);
  quadraticVertex(820, height/2-30+startp[5], 800, height/2-10+startp[5]);
  vertex(750, height/2-10+startp[5]);


  endShape();
  strokeWeight(3);
  stroke(#0e0b06);
  fill(#0e0b06);

  beginShape();

  vertex(750, height/2-10+startp[5]);
  vertex(750, height/2-50+startp[5]);
  vertex(800, height/2-50+startp[5]);
  vertex(808, height/2-40+startp[5]);
  vertex(760, height/2-40+startp[5]);
  vertex(760, height/2-10+startp[5]);


  endShape();

  //W++

  strokeWeight(3);
  stroke(lb);
  fill(la);

  beginShape();

  fill(la);//yellow
  vertex(870+a, height/2-20+b+startp[6]);
  vertex(870+a, height/2-80+b+startp[6]);
  vertex(960+a, height/2-80+b+startp[6]);
  vertex(960+a, height/2-20+b+startp[6]);
  fill(lb);//orange
  vertex(950+a, height/2-20+b+startp[6]);
  vertex(950+a, height/2+40+b+startp[6]);
  vertex(990+a, height/2-80+b+startp[6]);
  fill(la);//yellow
  vertex(1030+a, height/2-80+b+startp[6]);
  vertex(1040+a, height/2+40+b+startp[6]);
  vertex(1070+a, height/2-80+b+startp[6]);
  fill(lb);//orange 
  vertex(1140+a, height/2-80+b+startp[6]);
  vertex(1130+a, height/2-20+b+startp[6]);
  vertex(1110+a, height/2-20+b+startp[6]);
  vertex(1080+a, height/2+90+b+startp[6]);
  vertex(1090+a, height/2+90+b+startp[6]);
  vertex(1080+a, height/2+150+b+startp[6]);
  vertex(1010+a, height/2+150+b+startp[6]);
  fill(la);//dark o
  vertex(990+a, height/2+70+b+startp[6]);
  vertex(950+a, height/2+150+b+startp[6]);
  vertex(870+a, height/2+150+b+startp[6]);
  vertex(870+a, height/2+90+b+startp[6]);
  vertex(890+a, height/2+90+b+startp[6]);
  fill(lb);//yellow
  vertex(890+a, height/2-20+b+startp[6]);
  vertex(870+a, height/2-20+b+startp[6]);

  endShape();




  ///letter W

  //line(870, height/2-80, 1140, height/2-80);//W


  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);

  beginShape();

  fill(#ffe500);//yellow
  vertex(870, height/2-20+startp[6]);
  vertex(870, height/2-80+startp[6]);
  vertex(960, height/2-80+startp[6]);
  vertex(960, height/2-20+startp[6]);
  fill(#ff6801);//orange
  vertex(950, height/2-20+startp[6]);
  vertex(950, height/2+40+startp[6]);
  vertex(990, height/2-80+startp[6]);
  fill(#ffe500);//yellow
  vertex(1030, height/2-80+startp[6]);
  vertex(1040, height/2+40+startp[6]);
  vertex(1070, height/2-80+startp[6]);
  fill(#ff6801);//orange 
  vertex(1140, height/2-80+startp[6]);
  vertex(1130, height/2-20+startp[6]);
  vertex(1110, height/2-20+startp[6]);
  vertex(1080, height/2+90+startp[6]);
  vertex(1090, height/2+90+startp[6]);
  vertex(1080, height/2+150+startp[6]);
  vertex(1010, height/2+150+startp[6]);
  fill(#b53701);//dark o
  vertex(990, height/2+70+startp[6]);
  vertex(950, height/2+150+startp[6]);
  vertex(870, height/2+150+startp[6]);
  vertex(870, height/2+90+startp[6]);
  vertex(890, height/2+90+startp[6]);
  fill(#ffe500);//yellow
  vertex(890, height/2-20+startp[6]);
  vertex(870, height/2-20+startp[6]);

  endShape();


  ///letter A

  //line(1150, height/2-80, 1290, height/2-80);//A
  //line(300, height/2-80, 480, height/2-80);//V

  //triangle b ++

  strokeWeight(3);
  stroke(lb);
  fill(la);

  beginShape();

  fill(la);//yellow
  vertex(1140-a, height/2+160+b+startp[11]);
  vertex(1240-a, height/2+160+b+startp[11]);
  fill(lb);//orange
  vertex(1190-a, height/2+210+b+startp[11]);
  vertex(1140-a, height/2+160+b+startp[11]);

  endShape();

  //triangle b

  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);

  beginShape();

  fill(#ffe500);//yellow
  vertex(1140, height/2+160+startp[11]);
  vertex(1240, height/2+160+startp[11]);
  fill(#ff6801);//orange
  vertex(1190, height/2+210+startp[11]);
  vertex(1140, height/2+160+startp[11]);

  endShape();
  ///A++ //vertical shadow only

  strokeWeight(3);
  stroke(lb);
  fill(la);

  beginShape();



  fill(la);//yellow
  vertex(1165, height/2-80+b+startp[7]);
  vertex(1290, height/2-80+b+startp[7]);
  vertex(1290, height/2-20+b+startp[7]);
  vertex(1270, height/2-20+b+startp[7]);
  fill(lb);//orange 
  vertex(1270, height/2+90+b+startp[7]);
  vertex(1290, height/2+90+b+startp[7]);
  vertex(1290, height/2+150+b+startp[7]);
  vertex(1180, height/2+150+b+startp[7]);
  vertex(1195, height/2+90+b+startp[7]);
  vertex(1215, height/2+90+b+startp[7]);
  fill(la);//dark o
  vertex(1215, height/2-20+b+startp[7]);
  vertex(1170, height/2+150+b+startp[7]);
  vertex(1090, height/2+150+b+startp[7]);
  vertex(1100, height/2+90+b+startp[7]);
  vertex(1120, height/2+90+b+startp[7]);
  fill(lb);//yellow
  vertex(1165, height/2-80+b+startp[7]);



  endShape();

  ///a
  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);

  beginShape();



  fill(#ffe500);//yellow
  vertex(1165, height/2-80+startp[7]);
  vertex(1290, height/2-80+startp[7]);
  vertex(1290, height/2-20+startp[7]);
  vertex(1270, height/2-20+startp[7]);
  fill(#ff6801);//orange 
  vertex(1270, height/2+90+startp[7]);
  vertex(1290, height/2+90+startp[7]);
  vertex(1290, height/2+150+startp[7]);
  vertex(1180, height/2+150+startp[7]);
  vertex(1195, height/2+90+startp[7]);
  vertex(1215, height/2+90+startp[7]);
  fill(#b53701);//dark o
  vertex(1215, height/2-20+startp[7]);
  vertex(1170, height/2+150+startp[7]);
  vertex(1090, height/2+150+startp[7]);
  vertex(1100, height/2+90+startp[7]);
  vertex(1120, height/2+90+startp[7]);
  fill(#ffe500);//yellow
  vertex(1165, height/2-80+startp[7]);



  endShape();

  //T ++


  strokeWeight(3);
  stroke(lb);
  fill(la);

  beginShape();

  fill(la);//yellow
  vertex(1355-a, height/2-20+b+startp[8]);
  vertex(1300-a, height/2-20+b+startp[8]);
  vertex(1300-a, height/2-80+b+startp[8]);
  vertex(1480-a, height/2-80+b+startp[8]);
  vertex(1480-a, height/2-20+b+startp[8]);
  vertex(1425-a, height/2-20+b+startp[8]);
  vertex(1420-a, height/2-30+b+startp[8]);
  fill(lb);//orange 
  vertex(1420-a, height/2+90+b+startp[8]);
  fill(la-a);//dark o
  vertex(1450-a, height/2+90+b+startp[8]);
  vertex(1450-a, height/2+150+b+startp[8]);
  vertex(1330-a, height/2+150+b+startp[8]);
  vertex(1330-a, height/2+90+b+startp[8]);
  vertex(1360-a, height/2+90+b+startp[8]);
  fill(lb);//yellow
  vertex(1360-a, height/2-30+b+startp[8]);
  vertex(1355-a, height/2-20+b+startp[8]);
  endShape();

  ///letter T

  //line(1300, height/2-80, 1480, height/2-80);//T




  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);

  beginShape();

  fill(#ffe500);//yellow
  vertex(1355, height/2-20+startp[8]);
  vertex(1300, height/2-20+startp[8]);
  vertex(1300, height/2-80+startp[8]);
  vertex(1480, height/2-80+startp[8]);
  vertex(1480, height/2-20+startp[8]);
  vertex(1425, height/2-20+startp[8]);
  vertex(1420, height/2-30+startp[8]);
  fill(#ff6801);//orange 
  vertex(1420, height/2+90+startp[8]);
  fill(#b53701);//dark o
  vertex(1450, height/2+90+startp[8]);
  vertex(1450, height/2+150+startp[8]);
  vertex(1330, height/2+150+startp[8]);
  vertex(1330, height/2+90+startp[8]);
  vertex(1360, height/2+90+startp[8]);
  fill(#ffe500);//yellow
  vertex(1360, height/2-30+startp[8]);
  vertex(1355, height/2-20+startp[8]);



  endShape();

  //C++

  strokeWeight(3);
  stroke(lb);
  fill(la);

  beginShape();

  fill(la);//orange 
  vertex(1550-a, height/2+10+b+startp[9]);//
  quadraticVertex(1550-a, height/2+10+b+startp[9], 1550-a, height/2+10+b+startp[9]);//
  quadraticVertex(1550-a, height/2-15+b+startp[9], 1580-a, height/2-20+b+startp[9]);
  vertex(1620-a, height/2-20+b+startp[9]);
  fill(lb);//yellow
  vertex(1620-a, height/2-10+b+startp[9]);
  vertex(1670-a, height/2-10+b+startp[9]);
  vertex(1670-a, height/2-80+b+startp[9]);
  vertex(1530-a, height/2-80+b+startp[9]);
  quadraticVertex(1490-a, height/2-70+b+startp[9], 1490-a, height/2-40+b+startp[9]);//
  fill(la);//dark o
  vertex(1490-a, height/2+110+b+startp[9]);
  quadraticVertex(1490-a, height/2+140+b+startp[9], 1530-a, height/2+150+b+startp[9]);//
  vertex(1670-a, height/2+150+b+startp[9]);
  vertex(1670-a, height/2+80+b+startp[9]);
  vertex(1620-a, height/2+80+b+startp[9]);
  vertex(1620-a, height/2+90+b+startp[9]);
  vertex(1580-a, height/2+90+b+startp[9]);
  quadraticVertex(1550-a, height/2+85+b+startp[9], 1550-a, height/2+60+b+startp[9]);//
  vertex(1550-a, height/2+10+b+startp[9]);

  endShape();

  //LETTER C
  //line(1490, height/2-80, 1670, height/2-80);//C


  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);

  beginShape();

  fill(#ff6801);//orange 
  vertex(1550, height/2+10+startp[9]);//
  quadraticVertex(1550, height/2+10+startp[9], 1550, height/2+10+startp[9]);//
  quadraticVertex(1550, height/2-15+startp[9], 1580, height/2-20+startp[9]);
  vertex(1620, height/2-20+startp[9]);
  fill(#ffe500);//yellow
  vertex(1620, height/2-10+startp[9]);
  vertex(1670, height/2-10+startp[9]);
  vertex(1670, height/2-80+startp[9]);
  vertex(1530, height/2-80+startp[9]);
  quadraticVertex(1490, height/2-70+startp[9], 1490, height/2-40+startp[9]);//
  fill(#b53701);//dark o
  vertex(1490, height/2+110+startp[9]);
  quadraticVertex(1490, height/2+140+startp[9], 1530, height/2+150+startp[9]);//
  vertex(1670, height/2+150+startp[9]);
  vertex(1670, height/2+80+startp[9]);
  vertex(1620, height/2+80+startp[9]);
  vertex(1620, height/2+90+startp[9]);
  vertex(1580, height/2+90+startp[9]);
  quadraticVertex(1550, height/2+85+startp[9], 1550, height/2+60+startp[9]);//
  vertex(1550, height/2+10+startp[9]);

  endShape();


  //H++
  strokeWeight(3);
  stroke(lb);
  fill(la);


  beginShape();

  fill(la);//orange
  vertex(1700-a, height/2+30+b+startp[10]);//
  vertex(1700, height/2-20+b+startp[10]);//
  fill(lb);//yellow
  vertex(1680-a, height/2-20+b+startp[10]);//
  vertex(1680-a, height/2-80+b+startp[10]);//
  vertex(1750-a, height/2-80+b+startp[10]);//
  vertex(1750-a, height/2+10+b+startp[10]);//
  vertex(1790-a, height/2+10+b+startp[10]);//
  vertex(1790-a, height/2-80+b+startp[10]);//
  vertex(1860-a, height/2-80+b+startp[10]);
  vertex(1860-a, height/2-20+b+startp[10]);
  fill(la);//orange 
  vertex(1840, height/2-20+b+startp[10]);
  vertex(1840, height/2+30+b+startp[10]);
  vertex(1840, height/2+90+b+startp[10]);
  fill(lb);//dark o
  vertex(1860-a, height/2+90+b+startp[10]);
  vertex(1860-a, height/2+150+b+startp[10]);
  vertex(1790-a, height/2+150+b+startp[10]);
  vertex(1790-a, height/2+70+b+startp[10]);
  vertex(1750-a, height/2+70+b+startp[10]);
  vertex(1750-a, height/2+150+b+startp[10]);
  vertex(1680-a, height/2+150+b+startp[10]);
  vertex(1680-a, height/2+90+b+startp[10]);
  vertex(1700-a, height/2+90+b+startp[10]);
  vertex(1700-a, height/2+30+b+startp[10]);
  endShape();

  //LETTER H
  //line(1680, height/2-80, 1860, height/2-80);//H


  fill(#ffe500);//yellow
  fill(#ff6801);//orange 
  fill(#b53701);//dark o


  strokeWeight(3);
  stroke(#000000);
  fill(#FFFFFF);


  beginShape();

  fill(#ff6801);//orange
  vertex(1700, height/2+30+startp[10]);//
  vertex(1700, height/2-20+startp[10]);//
  fill(#ffe500);//yellow
  vertex(1680, height/2-20+startp[10]);//
  vertex(1680, height/2-80+startp[10]);//
  vertex(1750, height/2-80+startp[10]);//
  vertex(1750, height/2+10+startp[10]);//
  vertex(1790, height/2+10+startp[10]);//
  vertex(1790, height/2-80+startp[10]);//
  vertex(1860, height/2-80+startp[10]);
  vertex(1860, height/2-20+startp[10]);
  fill(#ff6801);//orange 
  vertex(1840, height/2-20+startp[10]);
  vertex(1840, height/2+30+startp[10]);
  vertex(1840, height/2+90+startp[10]);
  fill(#b53701);//dark o
  vertex(1860, height/2+90+startp[10]);
  vertex(1860, height/2+150+startp[10]);
  vertex(1790, height/2+150+startp[10]);
  vertex(1790, height/2+70+startp[10]);
  vertex(1750, height/2+70+startp[10]);
  vertex(1750, height/2+150+startp[10]);
  vertex(1680, height/2+150+startp[10]);
  vertex(1680, height/2+90+startp[10]);
  vertex(1700, height/2+90+startp[10]);
  vertex(1700, height/2+30+startp[10]);

  endShape();




  ///texts
  textMode(SHAPE);
  fill(start);//white
  textFont(arcade);
  textSize(80);
  text("PRESS ENTER!", 690, 900);
  fill(#C10A0D);//white
  textFont(arcade);
  textSize(80);
  text("THE OMNIC CRISIS 001", 260, 770);
  fill(#FFFFFF);//white
  textFont(arcade);
  textSize(50);
  text("2019 D7 CORPORATION", 670, 1000);
  image(copy, 630, 970);

  ////
}



void keyPressed() {


  if (keyCode==ENTER)
  {

    fill(#EA0202);//white
    textFont(arcade);
    textSize(50);
    text("2019 D7 CORPORATION", 670, 1000);
    image(copy, 630, 970);
    
    //Game Start
  }
}