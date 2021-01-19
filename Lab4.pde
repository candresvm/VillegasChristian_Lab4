import processing.serial.*;
float [][] matriz={
  {(170-155)*30+50,800-67*6.7},
  {(180-155)*30+50,800-80*6.7},
  {(170-155)*30+50,800-65*6.7},
  {(178-155)*30+50,800-75*6.7},
  {(160-155)*30+50,800-55*6.7},
  {(163-155)*30+50,800-60*6.7},
  {(165-155)*30+50,800-63*6.7},
  {(170-155)*30+50,800-70*6.7},
  {(164-155)*30+50,800-62*6.7},
  {(176-155)*30+50,800-77*6.7},
  {(164-155)*30+50,800-60*6.7},
  {(170-155)*30+50,800-76*6.7},
  {(170-155)*30+50,800-56*6.7},
  {(168-155)*30+50,800-60*6.7}
};


int fil1;
int i=0;
int altura=0;
Serial port;
int dato;
int dato1;
int n=0;

void setup () {
  size(1000,830); // (ancho, alto) displayWidth,displayHeight, Tercera dimencion: P3D
  background(255); // color de fondo RGB #7D84FC
  port= new Serial(this,"COM10",9600);
}

void draw() {
  fill(255);
  strokeWeight(3);
  rect(5,5,985,820);
  fill(0);
  rect(370,0,270,90);
  fill(#00E1F7);
  rect(50,200,900,585);
  textSize(25);
  fill(255);
  text("LABORATORIO 4",400,30);
  text("REGRESION LINEAL",390,60);
  textSize(25);
  fill(0);
  text("y = 1.1797x - 133.39",380,130);
  textSize(15);
  fill(0);
  text("0/155",10,800);
  text("160",200,800);
  text("165",350,800);
  text("170",500,800);
  text("175",650,800);
  text("180",800,800);
  text("185",950,800);
  
  text("90",20,200);
  text("80",20,265);
  text("70",20,330);
  text("60",20,395);
  text("50",20,460);
  text("40",20,525);
  text("30",20,590);
  text("20",20,655);
  text("10",20,720);
  
  for(i=200;i<950;i=i+65){
    line(50,i,950,i);
  }
  for(i=50;i<1100;i=i+150){
    line(i,200,i,785);
  }
  
  line((160-155)*30+50,800-55*6.7,(180-155)*30+50,800-80*6.7);
  
  fill(#E83807);
  for(fil1=0;fil1<14;fil1++){
      strokeWeight(1);
      ellipse(matriz[fil1][0],matriz[fil1][1],13,13);
  }
  fill(#2C8109);
  ellipse((dato-155)*30+50,800-dato1*6.7,13,13);
  
  fill(0);
  textSize(25);
  text("Su altura es: ",200,180);
  text("Su peso es:",600,180);
  text(dato, 380, 180);
  text(dato1, 780, 180);
}

void serialEvent(Serial port){
  if(n==0){
  dato=port.read();
  n++;
  }
  else if(n==1){
  dato1=port.read();
  n=0;
  }
}
