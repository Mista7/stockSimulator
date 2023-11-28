import g4p_controls.*;
int stockMoneyBuy;
int initialMoney = 5000;
int startingMoney = initialMoney;
String stockType = "Pear"; //initial setting on the drop down menu

void setup() {
  size(600,600);
  createGUI();
}

void draw() {
  background(255);
  drawStats();
}

void drawStats(){
  fill(0);
  textSize(21);
  text("Balance: "+str(startingMoney)+" $",5,550);
}
