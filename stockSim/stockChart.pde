// Graphs the values for all the stock companies
class Chart {
  //fields
  Stock company;
  FloatList xCoor;
  FloatList yCoor;
  PVector xyOrigin;
  float heightValue;
  float widthValue;

  Chart(float x, float y, float h, float w, Stock s) {
    xyOrigin = new PVector(x, y);
    heightValue = h;
    widthValue = w;
    xCoor = new FloatList();
    yCoor = new FloatList();
    company = s;
  }

// Draws the graph on screen
  void drawMe() {
    int maxXlabel = round(company.values.max()*0.2)*10;

    if (company.stockChanged == true) {
      xCoor.append(0);
      yCoor.append(0);
      company.stockChanged = false;
    }
    //fills the xCoor arrayList with values
    float xIncrement = (widthValue-50)/company.values.size();
    for (int i = 0; i < company.values.size(); i++) {
      xCoor.set(i, (i+1) * xIncrement + xyOrigin.x);
    }

    //fills the yCoor arrayList with values
    for (int i = 0; i < company.values.size(); i++) {
      float yCoordinate = xyOrigin.y + getValue(company.values.get(i));
      yCoor.set(i, yCoordinate);
    }

    fill(255);
    line(xyOrigin.x, xyOrigin.y+heightValue, xyOrigin.x+widthValue, xyOrigin.y+heightValue); 
    line(xyOrigin.x, xyOrigin.y, xyOrigin.x, xyOrigin.y+heightValue);

    //drawing text
    textAlign(CENTER);
    fill(0);
    textSize(heightValue/10);
    text(this.company.name, this.xyOrigin.x+150, this.xyOrigin.y);
    textAlign(RIGHT);
    text("0", xyOrigin.x-5, xyOrigin.y+heightValue);
    text(str(maxXlabel), xyOrigin.x-5, xyOrigin.y);
    translate(xyOrigin.x-40, xyOrigin.y+10);
    rotate(PI);
    rotate(HALF_PI);
    textAlign(RIGHT);
    text("Price of Stock (CAD)", 0, 15);
    rotate(HALF_PI);
    translate(-xyOrigin.x+40, -xyOrigin.y-10);

    //draws the dots
    for (int i = 0; i<company.values.size(); i++) {
      fill(194, 24, 7);
      circle(xCoor.get(i), yCoor.get(i), xIncrement*0.3);
      fill(0);
    }
    noFill();
    beginShape();
    stroke(194, 24, 7);
    strokeWeight(2);
    for (int i = 0; i < company.values.size(); i++) {
      vertex(xCoor.get(i), yCoor.get(i));
    }
    endShape();

    fill(0);
    textAlign(CENTER);
    text("Month " + (company.values.size()), xyOrigin.x+(widthValue/2), xyOrigin.y+heightValue+(heightValue/6));
  }

  float getValue(float num) {
    float slope = heightValue/company.values.max()*0.5;
    float yPos = (xyOrigin.y+heightValue) - (slope*num + xyOrigin.y);
    return yPos;
  }
}
