import g4p_controls.*;
int stockMoneyBuy;
int amountToSell;
int initialMoney = 50000;
int balance = initialMoney;
String stockType = "Pear"; //initial setting on the drop down menu
int tick = 0;
int years = 0;

Stock pear = new Stock("Pear", roundNum(random(170, 190)));
Stock shoeStore = new Stock("Schattman's Shoe Store", roundNum(random(100, 120)));
Stock blueberry = new Stock("Blueberry", roundNum(random(3, 6)));

Chart pearGraph = new Chart(600,20,150,300,pear);
Chart blueGraph = new Chart(600,230,150,300,blueberry);
Chart shoeGraph = new Chart(600,450,150,300,shoeStore);

void setup() {
  size(1200, 650);
  background(140);
  createGUI();
}

void draw() {
  background(140);
  pearGraph.drawMe();
  blueGraph.drawMe();
  shoeGraph.drawMe();
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
  fill(255);
  textSize(21);
  textAlign(LEFT);
  text("Balance: $"+str(balance), 15, 600);
  text("Pear Shares: "+str(int(pear.stocksBought)), 15, 450);
  text("Schattman's SS Shares: "+str(int(shoeStore.stocksBought)), 15, 500);
  text("Blueberry Shares: "+str(int(blueberry.stocksBought)), 15, 550);
  text("Stock Price: " + str(pear.values.get(pear.values.size()-1)), 300, 450 );
  text("Stock Price: " + str(shoeStore.values.get(shoeStore.values.size()-1)), 300, 500 );
  text("Stock Price: " + str(blueberry.values.get(blueberry.values.size()-1)), 300, 550 );
  
  fill(255,0,0);
  lastPrice(pear, 15,250);
  lastPrice(shoeStore, 15,300);
  lastPrice(blueberry, 15,350);
}

 void lastPrice(Stock s, float x, float y){
   textSize(20);
   text(s.name+" last bought at: "+str(s.lastPrice), x,y);
}


float roundNum(float n){
  String nString = str(n);
  float num = float(nString.substring(0,nString.indexOf(".")+3));
  //println(n);
  
  return num;
}



//void stockOwned(String n){
//  if(n.equals("Pear")){
//    stocksOwned.setLimits(0, 0, int(pear.stocksBought)); 
//  }
//  else if(n.equals("Schattman's Shoe Store")){
//    stocksOwned.setLimits(0, 0, int(shoeStore.stocksBought));
//  }
//  else if(n.equals("Blueberry")){
//    stocksOwned.setLimits(0, 0, int(blueberry.stocksBought));
//  }
//}
