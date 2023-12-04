import g4p_controls.*;
int stockMoneyBuy;
int initialMoney = 50000;
int balance = initialMoney;
String stockType = "Pear"; //initial setting on the drop down menu
int tick = 0;
int years = 0;

Stock pear = new Stock("Pear", roundNum(random(170, 190)));
Stock shoeStore = new Stock("Schattman's Shoe Store", roundNum(random(100, 120)));
Stock blueberry = new Stock("Blueberry", roundNum(random(3, 6)));

void setup() {
  size(900, 600);
  background(255);
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
  text("Pear Shares: "+str(int(pear.sharesBought)), 5, 400);
  text("Schattman's SS Shares: "+str(int(shoeStore.sharesBought)), 5, 450);
  text("BlueBerry Shares: "+str(int(blueberry.sharesBought)), 5, 500);
  text("Stock Price: " + str(pear.values.get(pear.values.size()-1)), 250, 400 );
  text("Stock Price: " + str(shoeStore.values.get(shoeStore.values.size()-1)), 300, 450 );
  text("Stock Price: " + str(blueberry.values.get(blueberry.values.size()-1)), 250, 500 );
  
  lastPrice(pear, 200,50);
  lastPrice(shoeStore, 200,100);
  lastPrice(blueberry, 200,150);
}

 void lastPrice(Stock s, float x, float y){
   textSize(20);
   text(s.name+" Last bought at: "+str(s.lastPrice), x,y);
}


float roundNum(float n){
  String nString = str(n);
  float num = float(nString.substring(0,nString.indexOf(".")+3));
  //println(n);
  
  return num;
}
