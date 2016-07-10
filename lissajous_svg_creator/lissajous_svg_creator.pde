import org.philhosoft.p8g.svg.P8gGraphicsSVG;

P8gGraphicsSVG svg;

int nPointsToDraw;

void setup (){
  size(500,500);
  
  nPointsToDraw = 360;
  svg = (P8gGraphicsSVG) createGraphics(width, height, P8gGraphicsSVG.SVG, "myLissajous.svg");
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
    
    beginShape();
    for (int i=0; i<nPointsToDraw; i++){
      float t = map(i, 0, nPointsToDraw-1, 0, TWO_PI); 
      float x = offsetxScreen + radiusx * cos(phaseA + frequencyA*t);
      float y = offsetyScreen + radiusy * sin(phaseB + frequencyB*t);
      vertex (x, y);
    }
    endShape();
}

void keyPressed(){
  if (key == 's'){
    beginRecord(svg);
    calculatePointsToDraw();
    svg.endRecord();
    println("File saved.");
  }
  else if (key=='q') {
    svg.clear();
    exit();
  }
}
