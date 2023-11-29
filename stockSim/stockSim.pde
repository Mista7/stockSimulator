import g4p_controls.*;
int stockMoneyBuy;
int initialMoney = 5000;
int balance = initialMoney;
String stockType = "Pear"; //initial setting on the drop down menu

Stock pear = new Stock("Pear", random(100,230));
Stock shoeStore = new Stock("Schattman's Shoe Store", random(100,230));
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
  text("Balance: "+str(balance)+" $",5,550);
  text("Pear Shares: "+str(pear.sharesBought),5,500);
  text("Schattman's SS Shares: "+str(shoeStore.sharesBought),5,450);
  text("BlueBerry Shares: "+str(blueberry.sharesBought),5,400);
}
