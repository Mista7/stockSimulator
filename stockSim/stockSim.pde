import g4p_controls.*;
int stockMoneyBuy;
int startingMoney = 5000;
String stockType = "Pear"; //initial setting on the drop down menu

Stock pear = new Stock("Pear", random(100,230));
Stock shoeStore = new Stock("Schatmann's Shoe Store", random(100,230));
Stock blueberry = new Stock("Blueberry", random(100,230));
void setup() {
  size(600,600);
  createGUI();
}

void draw() {
  background(255);
  drawStats();
  
  int chance = int(random(0,2));
  if(chance == 1){pear.trend = "+";} else{pear.trend ="-";}
  
  pear.newValue();
}


void drawStats(){
  fill(0);
  textSize(21);
  text("Balance: "+str(startingMoney)+" $",5,550);
}
