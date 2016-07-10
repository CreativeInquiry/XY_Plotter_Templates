import geomerative.*;

RShape shp;

int nPointsToDraw;
boolean save;

void setup (){
  size(500,500);
  
  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  
  nPointsToDraw = 360;
  save = false;
}

void draw(){
  background(255);
  
  calculatePointsToDraw();
}

void calculatePointsToDraw(){
    
    //change these Lissajous constants as you like
    float radiusx = 150;
    float radiusy = 150;//must be less than sheetH/2;
    float frequencyA = (mouseX/100.0);
    float frequencyB = (mouseY/100.0);
    float offsetxScreen = width/2;
    float offsetyScreen = height/2;
    float phaseA = 0;//mouseX/100.0;
    float phaseB = 0;//mouseY/100.0;
    
    RG.beginShape();
    
    //calculate points to draw based on lissajous equation
    for (int i=0; i<nPointsToDraw; i++){
      float t = map(i, 0, nPointsToDraw-1, 0, TWO_PI); 
      float x = offsetxScreen + radiusx * cos(phaseA + frequencyA*t);
      float y = offsetyScreen + radiusy * sin(phaseB + frequencyB*t);
      RG.vertex (x, y);
    }
    
    //decide whether to save current shape as svg file or to draw it on screen
    if(!save) RG.endShape();
    if(save){
      shp = RG.getShape();
      save = false;
    }
}

void keyPressed(){
  if (key == 's'){
    save = true;
    calculatePointsToDraw();
    RG.saveShape("myLissajous.svg", shp);
    println("File saved.");
  }
  else if (key=='q') {
    exit();
  }
}