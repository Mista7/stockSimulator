import g4p_controls.*;
int stockMoneyBuy;
int amountToSell;
int initialMoney = 50000;
int balance = initialMoney;
String stockType = "Pear"; //initial setting on the drop down menu
int tick = 0;
int monthDuration = 90;
int months = 0;
Stock pear, blueberry, shoeStore;
Chart pearGraph, blueGraph, shoeGraph;
String[] shoeStoreNews;
String[] pearNews;
String[] blueberryNews;
boolean instructionsScreen = false;

void setup() {
  size(1350, 650);
  background(140);
  createGUI();
  shoeStoreNews = loadStrings("shoeStoreNews.txt");
  pearNews = loadStrings("pearNews.txt");
  blueberryNews = loadStrings("blueberryNews.txt");

  // Initializes stock companies
  pear = new Stock("Pear", roundNum(random(170, 190)), color(255, 0, 0), pearNews);
  shoeStore = new Stock("Schattman's Shoe Store", roundNum(random(100, 120)), color(0, 255, 0), shoeStoreNews);
  blueberry = new Stock("Blueberry", roundNum(random(3, 6)), color(0, 0, 255), blueberryNews);

  // Initializes stock value graphs for each company
  pearGraph = new Chart(600, 20, 150, 300, pear);
  blueGraph = new Chart(600, 450, 150, 300, blueberry);
  shoeGraph = new Chart(600, 230, 150, 300, shoeStore);
}

void draw() {
  if (!instructionsScreen) {
    background(140);
    pearGraph.drawMe();
    blueGraph.drawMe();
    shoeGraph.drawMe();
    updateStocks();
    drawStats();

    //  pearGraph.drawMe();
    //blueGraph.drawMe();
    //shoeGraph.drawMe();
    drawStats();
    pear.newsUpdate(500, 10);
    blueberry.newsUpdate(500, 150);
    shoeStore.newsUpdate(500, 300);
    if (tick%90 == 0) {
      pear.randomizeTrend();
      //println(pear.values.get(pear.values.size()-1));
      shoeStore.randomizeTrend();
      blueberry.randomizeTrend();
      tick+=1;
      months+=1;
    } 
    else {
      tick+=1;
    }
  }
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

  fill(255, 0, 0);
  lastPrice(pear, 15, 250);
  lastPrice(shoeStore, 15, 300);
  lastPrice(blueberry, 15, 350);
}

void lastPrice(Stock s, float x, float y) {
  textSize(20);
  text(s.name+" last bought at: "+str(s.lastPrice), x, y);
}


float roundNum(float n) {
  String nString = str(n);
  //println(n,nString);
  if (n>0) {
    float intPart = float(nString.substring(0, nString.indexOf(".")));
    String decimalPart = nString.substring(nString.indexOf("."));
    if (decimalPart.length() > 2) {
      decimalPart = decimalPart.substring(0, 3);
    } 
    else if (decimalPart.length()==1) {
      decimalPart = decimalPart + 0;
    }

    float num = intPart+float(decimalPart);

    return num;
  } else {
    return 0.0;
  }
}

void updateStocks() {
  if (tick%monthDuration == 0) {
    pear.randomizeTrend();
    shoeStore.randomizeTrend();
    blueberry.randomizeTrend();
    tick+=1;
    months+=1;
  } 
  else {
    tick+=1;
  }
}


void stockOwned() {
  String n = stockType;
  if (n.equals("Pear")) {
    stocksOwned.setLimits(0, 0, int(pear.stocksBought));
  } 
  else if (n.equals("Schattman's Shoe Store")) {
    stocksOwned.setLimits(0, 0, int(shoeStore.stocksBought));
  } 
  else if (n.equals("Blueberry")) {
    stocksOwned.setLimits(0, 0, int(blueberry.stocksBought));
  }
}
