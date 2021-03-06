RShape circle; 
RPoint [] cPoints;

void circle() {
  noStroke();
  fill(255);
  int cs = 200;

  circle = RShape.createEllipse(width/2, height/2, cs, cs);
  circle.getPoints();
  circle.draw();

  //RCommand.setSegmentLength(100);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //RPolygon circlePolly = circle.toPolygon();
  //for(int i = 0; i < circlePolly.contours[0].points.length; i++){
  //RPoint curPoint = circlePolly.contours[0].points[i];
  //  ellipse(curPoint.x, curPoint.y, 5, 5);
  //}

  //Options
  RG.setPolygonizer(RG.UNIFORMSTEP);
  RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));

  //RG.setPolygonizer(RG.UNIFORMLENGTH);
  //RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));

  cPoints = circle.getPoints();

  // If there are any points
  if (cPoints != null) {
    noFill();
    stroke(0, 200, 0);
    beginShape();
    for (int i=0; i<cPoints.length; i++) {
      vertex(cPoints[i].x, cPoints[i].y);
    }
    endShape();

    fill(0);
    stroke(0);
    for (int i=0; i<cPoints.length; i++) {
      ellipse(cPoints[i].x, cPoints[i].y, 5, 5);
    }
  }
}


// ----------------------------------

float a=0.0;
float freq = 8;
float inc=TWO_PI/freq;

int r = 100;
float nS = 0.0;


void circleVertex() {
  noStroke();
  //strokeWeight(3);
  fill(255);

  nS += 0.01;
  float n = noise(nS);

  beginShape();
  curveVertex(width/2+cos(a)*r, height/2+sin(0)*r); //Start guide point of curveVertex
  for (int i=0; i<freq; i++) { //for every division of TWO_PI
    float x = width/2+cos(a)*r; 
    float y = height/2+sin(a)*r;
    a+=inc+n; //increase angle by a division of TWO_PI
    curveVertex(x, y);
  }
  curveVertex(width/2+cos(a)*r, height/2+sin(0)*r); //End guide point of curveVertex
  endShape(CLOSE);
  println(n);
}
