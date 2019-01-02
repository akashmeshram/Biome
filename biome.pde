//coding Challenge Complete by AKASH MESHRAM (IIT Kharagpur)
//# Biome #

float scl=10;
float w = 1000, h =500;
float[][] terrain;
float[][] biome;
float flying=0;

void setup(){
  size(640,320,P3D);
  noFill();
  frameRate(10);
  stroke(255,10);
  background(96,186,210);
  terrain = new float[floor(w/scl)][floor(h/scl)];
  biome = new float[floor(w/scl)][floor(h/scl)];
}

void draw(){
  background(96,186,210);
  flying-=0.1;
  
  float yoff=flying;
  for(int j = 0; j<floor(h/scl);j++){
    float xoff =0 ;
    for(int i =0;i<floor(w/scl);i++){
      float val = 1 * noise(1 * xoff, 1 * yoff)
                +  0.5 * noise(2 * xoff, 2 * yoff)
                + 0.25 * noise(4 * xoff, 2 * yoff);
      //terrain[i][j] = map(noise(xoff,yoff),0,1,-75,75);
      biome[i][j] = val;
      terrain[i][j] = map(pow(val,3),0,5.3,-150,150);
      xoff+=0.1;
    }
    yoff+=0.1;
  }
  
  
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  
  for(int j = 0; j<floor(h/scl)-1;j++){
    beginShape(TRIANGLE_STRIP);
    for(int i =0;i<floor(w/scl);i++){
      fill(mapfill(biome[i][j]));
      vertex(i*scl,j*scl,terrain[i][j]);
      vertex(i*scl,(j+1)*scl,terrain[i][j+1]);
    }
    endShape();
  }
}

color mapfill(float e){
  e = map(e,  0, 1.75, 0, 1);
  if (e < 0.1) return color(96,186,210);
  else if (e < 0.2) return color(96,186,210);
  else if (e < 0.3) return color(92,80,141);
  else if (e < 0.5) return color(66, 113, 82);
  else if (e < 0.6) return color(145, 161, 86);
  else if (e < 0.65) return color(105,51,44);
  else return color(222, 223, 227);
  
}
