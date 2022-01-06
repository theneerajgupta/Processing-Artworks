int n=50;
int w = 800;
ArrayList<PVector> particles;
PVector temp;




void setup() {
  size(800, 800, P3D);
  particles = new ArrayList<PVector>();
  makePoints();
}

void draw() {
  frameRate(20);
  background(51);
  translate(width/2, height/2);
  stroke(200);
  strokeWeight(2);
  for(int i=0; i<1.5*n; i++) {
    line( particles.get(i).x, particles.get(i).y, particles.get(i+n).x, particles.get(i+n).y);
  }
  temp = particles.get(0);
  particles.remove(0);
  particles.add(temp);
}






void makePoints() {
  noStroke();
  fill(255);
  ellipse(0, 0, 10, 10);
  //Top
  for(int i=0; i<n; i++) {
    ellipse(-w/2 + i*(w/(n-1)), -w/2, 10, 10); 
    particles.add(new PVector(-w/2 + i*(w/(n-1)), -w/2));
  }
  //Right
  for(int i=0; i<n; i++) {
    ellipse(w/2, -w/2 + i*(w/(n-1)), 10, 10); 
    particles.add(new PVector(w/2, -w/2 + i*(w/(n-1))));
  }
  //Bottom
  for(int i=0; i<n; i++) {
    ellipse(w/2 - i*(w/(n-1)), w/2, 10, 10); 
    particles.add(new PVector(w/2 - i*(w/(n-1)), w/2));
  }
  //Left
  for(int i=0; i<n; i++) {
    ellipse(-w/2, w/2 - i*(w/(n-1)), 10, 10); 
    particles.add(new PVector(-w/2, w/2 - i*(w/(n-1))));
  }
}