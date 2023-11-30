import g4p_controls.*;
int stockMoneyBuy;
int initialMoney = 50000;
int balance = initialMoney;
String stockType = "Pear"; //initial setting on the drop down menu
int tick = 0;
int years = 0;

Stock pear = new Stock("Pear", random(100, 230));
Stock shoeStore = new Stock("Schattman's Shoe Store", random(100, 230));
Stock blueberry = new Stock("Blueberry", random(100, 230));

void setup() {
  size(600, 600);
  createGUI();
}

void draw() {
  background(255);
  drawStats();

  if (tick%90 == 0){
    pear.randomizeTrend();
    //println(pear.values.get(pear.values.size()-1));
    shoeStore.randomizeTrend();
    blueberry.randomizeTrend();
    tick+=1;
    years+=1;
  }
  else{
    tick+=1;
  }
  //pear.graphStock();
}


void drawStats() {
  fill(0);
  textSize(21);
  text("Balance: "+str(balance)+" $", 5, 550);
  text("Pear Shares: "+str(pear.sharesBought), 5, 400);
  text("Schattman's SS Shares: "+str(shoeStore.sharesBought), 5, 450);
  text("BlueBerry Shares: "+str(blueberry.sharesBought), 5, 500);
  text("Stock Price: " + str(pear.values.get(pear.values.size()-1)), 250, 400 );
  text("Stock Price: " + str(shoeStore.values.get(shoeStore.values.size()-1)), 300, 450 );
  text("Stock Price: " + str(blueberry.values.get(blueberry.values.size()-1)), 250, 500 );

}
