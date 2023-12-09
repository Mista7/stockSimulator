import g4p_controls.*;
int stockMoneyBuy;
int amountToSell;
int initialMoney = 50000;
int balance = initialMoney;
String stockType = "Pear"; //initial setting on the drop down menu
int tick = 0;
int monthDuration = 75;
int months = 0;
Stock pear, blueberry, shoeStore;
Chart pearGraph, blueGraph, shoeGraph;
String[] shoeStoreNews = {"+New Schattman's Sneakers released! \nStock prices explode!","-CEO of Schattman's Shoe Store, \nJason Schattman, revealed to like \ncoding more than shoes! \nStock prices plummet!","+Schattman's Shoe Store parnters \nwith Jordan! Stock prices BOOM!","-Schattman's Sneakers receive horrendous reviews. \nStock prices take a HUGE hit!","+Mozart seen wearing Schattman's Sneakers. \nStock prices SKYROCKET.","+Schattmans SS relase the \nSchattman 2 sneakers with significant \nimprovements! Stock prises rise steadily.","-Schattman's new sneakers found \nto have worse durability than \nthe originals! Stock prices drop.","-Schattman's Sneakers SUED for copying \nAdidas' designs! \nStock prices drop significantly.","+Schattman's SS release a groundbreaking \nsneaker with anti-gravity! Stock prices go BANANAS"
};
String[] pearNews = {"+New PearPhone, PearPhone2024.02102 \nreleased! Stock prices explode!","-CEO of Schattman's Shoe Store, \nSteve Occupations revealed to like \napples more than pears! \nStock prices plummet!","+Pear partners with Banana! \nStock prices BANANAS!","-PearPhone2025.0213 receive \nhorrendous reviews. \nStock prices take HUGE hit!","+Celebrity Mathematician Jason Schattman \nseen using PearPhone2023 Pro Max Ultra. \nStock prices SKYROCKET!","+Pear releases the PearPhone2024.02103, \na significant improvement! \nStock prises rise steadily.","-PearPhone2024.02103 found to have \nworse durability than the PearPhone2024.02102! \nStock prices drop.","-Pear SUED for copying Banana's designs! \nStock prices drop significantly.","-Pear at an ALL-TIME LOW \nafter losing a lawsuit!"
};
String[] blueberryNews = {"+New Blueberry Brick released! Stock prices\nexplode!","-CEO of Blueberry, I.M. Blu, seen\nspelling raspberry without\nthe P! Stock prices\nplummet!","+Blueberry parnters with\nBricks R Us! Blueberry Bricks\nget significantly more durable!\nStock prices BOOM!","-Blueberry Brick receive\nhorrendous reviews. Stock\nprices take a HUGE hit!","+Blueberry Brick's durability\nreported to be 10x better!\nStock prises rise steadily.","-Blueberry SUED due to injury\ncaused by Blueberry Brick! Stock\nprices drop significantly."
};
boolean instructionsScreen = false;

void setup() {
  size(1350, 650);
  background(140);
  createGUI();
  //shoeStoreNews = loadStrings("shoeStoreNews.txt");
  //pearNews = loadStrings("pearNews.txt");
  //blueberryNews = loadStrings("blueberryNews.txt");

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
    newsUpdate();
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
  text("Balance: $"+str(balance), 220, 600);
  text("Pear Shares: "+str(int(pear.stocksBought)),235, 75);
  text("Schattman's SS Shares: "+str(int(shoeStore.stocksBought)), 75, 275);
  text("Blueberry Shares: "+str(int(blueberry.stocksBought)), 220, 500);
  text("Stock Price: " + str(pear.values.get(pear.values.size()-1)), 235, 100 );
  text("Stock Price: " + str(shoeStore.values.get(shoeStore.values.size()-1)), 75, 300 );
  text("Stock Price: " + str(blueberry.values.get(blueberry.values.size()-1)), 220, 525 );

  fill(255, 0, 0);
  lastPrice(pear, 235, 50);
  lastPrice(shoeStore, 75, 250);
  lastPrice(blueberry, 220, 480);
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
    stocksOwned.setNbrTicks(int(pear.stocksBought/2));
  } 
  else if (n.equals("Schattman's Shoe Store")) {
    stocksOwned.setLimits(0, 0, int(shoeStore.stocksBought));
    stocksOwned.setNbrTicks(int(shoeStore.stocksBought/2));
  } 
  else if (n.equals("Blueberry")) {
    stocksOwned.setLimits(0, 0, int(blueberry.stocksBought));
    stocksOwned.setNbrTicks(int(blueberry.stocksBought/2));
  }
}


void newsUpdate(){
  fill(0);
  text("Pear News: ", 900, 45); 
  text("Schattman's Shoe Store News: ", 900, 235);
  text("Blueberry News: ", 900, 380);
  pear.newsUpdate(900, 70);
  blueberry.newsUpdate(900, 405);
  shoeStore.newsUpdate(900, 260);

  
}
