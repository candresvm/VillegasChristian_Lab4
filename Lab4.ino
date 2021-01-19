#include <SoftwareSerial.h>

// matriz de datos
int matriz[14][2]={
  {170,67},
  {180,80},
  {170,65},
  {178,75},
  {160,55},
  {163,60},
  {165,63},
  {170,70},
  {164,62},
  {176,77},
  {164,60},
  {170,76},
  {170,56},
  {168,60},
};

int col=0; //moverse en columnas
int fil=0; //moverse en filas
int Ex=0; //sumatoria x
int Ey=0; //sumatoria y
long int Exy=0; //sumatoria x*y
long int Ex2=0; //sumatoria x^2
long int Ex_2=0; //sumatoria Ex^2
int n= 14; //tama;o de muestras
float Bo; //ordenada en el origen
float m; //pendiente
String dato; //recibir estatura
int estatura; //convertir dato
float peso;
int m1; //aux
SoftwareSerial ard(2, 3);
#define rxPin 2
#define txPin 3

void setup() {
  Serial.begin(9600);
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);
  ard.begin(9600);
  //creacion del modelo
  for(;fil<n;fil++){
    Ex=Ex+matriz[fil][0];
    Ey=Ey+matriz[fil][1];
    Exy=Exy+(matriz[fil][0]*matriz[fil][1]);
    Ex2=Ex2+pow(matriz[fil][0],2);
  }
  Ex_2=pow(Ex,2);
  Bo=(float(Ex2*Ey)-float(Ex*Exy))/(float(n*Ex2-Ex_2));
  m1=(n*Exy)-(Ex*Ey);
  m=(m1)/(float(n*Ex2-Ex_2));
  Serial.println("REGRESION LINEAL");
  Serial.println("El modelo es: ");
  Serial.println(String("y= ")+String(m)+String("x")+String(Bo));
  
}

void loop() {
  Serial.println("Ingrese su estatura: ");
  delay(4000);
  Serial.println("");
  if(Serial.available()>0){
    delay(1000);
    dato=Serial.readString();
    estatura=dato.toInt();
    peso=m*estatura+Bo;
    ard.write(estatura);
    ard.write(peso);
  }
}
