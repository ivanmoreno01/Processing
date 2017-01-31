

//variables
int bolaX=150; //posición de la bola
int bolay=150;
int velx=2;   //velocidad de la bola
int vely=2;
int pal1=150;  //posición en eje y de la paleta1
int pal2=150;    //posición en eje y de la paleta2
int ballpos1=pal1+90;
int ballpos2=pal2+90;
boolean w, s, a, b; //variable booleana
int nivel=0;
int marcadorlocal=0;
int marcadorvisitante=0;

void setup(){
  size (800,400);

}

void draw(){
  switch (nivel) {
  case 0:
  presentacion();
  break;
  case 1:
  nivel1();
  break;
case 2:
nivel2();
break;
}
}
//funciones del juego
void nivel1() {
 dibujar();
  movimientopelota();
  contactoconpadel();
  rebote();
  movimientopadel();
 scores();
siguientenivel2();
}
void nivel2(){
dibujarnivel2();
movimientopelota();
  contactoconpadel();
  rebote();
  movimientopadel();
 scores();


}
  void dibujar() {
 background(0,255,0);

  // Dibujar
  fill(255, 255, 255); //interfaz bola
  ellipse(bolaX, bolay, 30, 30);
  fill(0, 255, 255); //interfaz de las palas
  rect(10, pal1, 10, 90); //posición pala 1
  rect(780, pal2, 10, 90); //posición de la pala 2
  stroke(255,255,255);
  //linea del mediocentro
  strokeWeight(10);
  line(400,0,400,400);
//area de la izquierda

//linea a
stroke(255,255,255);
strokeWeight(10);
line(0,100,200,100);

//linea b
stroke(255,255,255);
strokeWeight(10);
line(0,300,200,300);

//linea c
stroke(255,255,255);
strokeWeight(10);
line(200,100,200,300);
//area de la derecha

//linea a
stroke(255,255,255);
strokeWeight(10);
line(800,100,600,100);

//linea b
stroke(255,255,255);
strokeWeight(10);
line(800,300,600,300);

//linea c
stroke(255,255,255);
strokeWeight(10);
line(600,300,600,100);

//textos
fill(255,0,0);
textSize(20);
text("Level 1",350,50);
textSize(20);
text("EUROPA", 300,370);
}



void movimientopelota() {
  //mover pelota
  bolaX=bolaX+velx; //veloc de la bola para el eje x
  bolay=bolay+vely;  //veloc de la bola para eje y
}

void contactoconpadel() {
  if (bolay>pal1 && bolay<ballpos1 && bolaX<35) {       //contacto de la bola con el padel1
  velx=-velx;
  }
  if (bolay>pal2 && bolay<ballpos2 && bolaX>765) {     //contacto de la bola con el padel2
  velx=-velx;
  }
}

void rebote() {


if ( bolaX > width) {
    setup();
   bolaX=400;
marcadorlocal = marcadorlocal + 1;
}
   else if ( bolaX < 0 ) {
    setup();
  bolaX=400;
  marcadorvisitante = marcadorvisitante + 1;
   }
 
  if ( bolay<15) {     //rebote en la parte izquierda
  vely=-vely;
 
  }
if (bolay>385){
 vely=-vely;
                   //parte derecha         
}
}
void scores(){
 
  fill (250);
text (marcadorlocal, 100, 50);
text (marcadorvisitante, 500, 50);

}

void movimientopadel() {
  if (a) {
  pal2=pal2-3;
  }
  if (b) {              //movimientos de la pala1
  pal2=pal2+3;
  }
  if (w) {
  pal1=pal1-3;
  }
  if (s) {            //movimientos de la pala2
  pal1=pal1+3;
  }
}
void movimientopadelsalavez() {
  //si la variable es verdadera
}
//portadadeljuego
 void presentacion() {
background(0);
  fill(200,150,150);
  textSize(70);
  text("Pong game", 250, 200);
 textSize(20);
 text("pulse espacio para empezar", 250,370);
depresentacionanivel1();
 }

void depresentacionanivel1(){

 if ( key==' ') {
    nivel=nivel +1;
    if (nivel==1) nivel=1;
  nivel1();
}
}

void dibujarnivel2(){
background(242,223,7);

  // Dibujar
  fill(255, 255, 255); //interfaz bola
  ellipse(bolaX, bolay, 30, 30);
  fill(0, 255, 255); //interfaz de las palas
  rect(10, pal1, 10, 90); //posición pala 1
  rect(780, pal2, 10, 90); //posición de la pala 2
  stroke(255,255,255);
  //linea del mediocentro
  strokeWeight(10);
  line(400,0,400,400);
//area de la izquierda

//linea a
stroke(255,255,255);
strokeWeight(10);
line(0,100,200,100);

//linea b
stroke(255,255,255);
strokeWeight(10);
line(0,300,200,300);

//linea c
stroke(255,255,255);
strokeWeight(10);
line(200,100,200,300);
//area de la derecha

//linea a
stroke(255,255,255);
strokeWeight(10);
line(800,100,600,100);

//linea b
stroke(255,255,255);
strokeWeight(10);
line(800,300,600,300);

//linea c
stroke(255,255,255);
strokeWeight(10);
line(600,300,600,100);

//textos
fill(255,0,0);
textSize(20);
text("Level 2",350,50);
textSize(20);
text("ÁFRICA", 300,370);
}

void siguientenivel2(){
if (marcadorlocal>5 && marcadorvisitante>5){
 nivel=nivel+2;
nivel2();
}

}
void keyPressed() {
  if (key=='s') {
  s=true;       //control pala debajo pala 1
  }
  if (key=='w') {
  w=true;        //control pala hacia arriba pala1
  }  
  if (keyCode==DOWN) {
  b=true;                 //control hacia abajo pala2
  }
  if (keyCode==UP) {
  a=true;                   //control hacia arriba pala2
  }
}

//para poder controlar los dos padels a la vez //si la variable es falsa
void keyReleased() {

  if (key=='s') {
  s=false;           //control pala debajo pala 1
  }
  if (key=='w') {
  w=false;             //control pala hacia arriba pala1
  }  
  if (keyCode==DOWN) {     //control hacia abajo pala2
  b=false;
  }
  if (keyCode==UP) {    //control hacia arriba pala2
  a=false;
  }
}




