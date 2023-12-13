import g4p_controls.*;

// Change these values
int initialMoney = 50000; // How much money you start with
int monthDuration = 75; // Higher value means stocks take longer to change

// Dont't change these values
int stockMoneyBuy;
int amountToSell;
int balance = initialMoney;
String stockType = "Pear"; //initial setting on the drop down menu
int tick = 0;
int months = 0;
Stock pear, blueberry, shoeStore;
Chart pearGraph, blueGraph, shoeGraph;
String[] shoeStoreNews = {"+New Schattman's Sneakers \nreleased! Stock prices \nexplode!","-CEO of Schattman's Shoe Store, \nJason Schattman, revealed to \nlike coding more than shoes! \nStock prices plummet!","+Schattman's Shoe Store parnters \nwith Jordan! Stock prices BOOM!","-Schattman's Sneakers receive \nhorrendous reviews. Stock \nprices take a HUGE hit!","+Mozart seen wearing Schattman's \nSneakers. Stock prices \nSKYROCKET.","+Schattmans SS relases the \nSchattman 2 sneakers with \nsignificant improvements! Stock \nprises rise steadily.","-Schattman's new sneakers found \nto have worse durability than \nthe originals! Stock prices drop.","-Schattman's Sneakers SUED for \ncopying Adidas' designs! Stock \nprices drop significantly.","+Schattman's SS release a \ngroundbreaking sneaker with anti-gravity! \nStock prices go BANANAS"};
String[] pearNews = {"+New PearPhone, \nPearPhone2024.02102 \nreleased! Stock \nprices explode!","-CEO of Pear, \nSteve Occupations revealed \nto like apples \nmore than pears! \nStock prices plummet!","+Pear partners with \nBanana! Stock prices go\nBANANAS!","-PearPhone2025.0213 receive \nhorrendous reviews. \nStock prices take \nHUGE hit!","+Celebrity Mathematician \nJason Schattman seen using \nPearPhone2023 Pro Max Ultra. \nStock prices SKYROCKET!","+Pear releases the \nPearPhone2024.021, a significant \nimprovement! Stock prises rise \nsteadily.","-PearPhone2024.02103 found to \nhave worse durability than \nthe PearPhone2024.02102! \nStock prices drop.","-Pear SUED for copying \nBanana's designs! \nStock prices drop significantly.", "-Pear at an ALL-TIME LOW \nafter losing a lawsuit!"};
String[] blueberryNews = {"+New Blueberry Brick released! \nStock prices explode!","-CEO of Blueberry, I.M. Blu, seen\nspelling raspberry without\nthe P! Stock prices\nplummet!","+Blueberry parnters with\nBricks R Us! Blueberry Bricks\nget significantly more durable!\nStock prices BOOM!","-Blueberry Brick receive\nhorrendous reviews. Stock\nprices take a HUGE hit!","+Blueberry Brick's durability\nreported to be 10x better!\nStock prises rise steadily.","-Blueberry SUED due to injury\ncaused by Blueberry Brick! \nStock prices drop significantly."};
//boolean instructionsScreen = false;

void setup() {
  size(1100, 650);
  background(140);
  createGUI();

  // Initializes stock companies
  pear = new Stock("Pear", roundNum(random(170, 190)), color(255, 0, 0), pearNews);
  shoeStore = new Stock("Schattman's Shoe Store", roundNum(random(100, 120)), color(0, 255, 0), shoeStoreNews);
  blueberry = new Stock("Blueberry", roundNum(random(3, 6)), color(0, 0, 255), blueberryNews);

  // Initializes stock value graphs for each company
  pearGraph = new Chart(475, 20, 150, 275, pear);
  blueGraph = new Chart(475, 450, 150, 275, blueberry);
  shoeGraph = new Chart(475, 230, 150, 275, shoeStore);
}

void draw() {
  if(tick!=-1){ // Checks if screen is paused or not
    background(140);
    pearGraph.drawMe();
    blueGraph.drawMe();
    shoeGraph.drawMe();
    updateStocks();
    drawStats();
  }
}

// Draws the balance, stock prices, your stocks and the last prices you bought each stock
void drawStats() {
  fill(255);
  textSize(21);
  textAlign(LEFT);
  text("Balance: $"+str(balance), 10, 600);
  text("Pear Shares: "+str(int(pear.stocksBought)), 10, 75);
  text("Schattman's SS Shares: "+str(int(shoeStore.stocksBought)), 10, 275);
  text("Blueberry Shares: "+str(int(blueberry.stocksBought)), 10, 500);
  text("Stock Price: " + str(pear.values.get(pear.values.size()-1)), 10, 100 );
  text("Stock Price: " + str(shoeStore.values.get(shoeStore.values.size()-1)), 10, 300 );
  text("Stock Price: " + str(blueberry.values.get(blueberry.values.size()-1)), 10, 525 );

  fill(255, 0, 0);
  lastPrice(pear, 10, 50);
  lastPrice(shoeStore, 10, 250);
  lastPrice(blueberry, 10, 480);
  
  updateNews();
}

// Draws the last price you bought a stock at
void lastPrice(Stock s, float x, float y) {
  textSize(20);
  text(s.name+" last bought at: "+str(s.lastPrice), x, y);
}

// Used to round values to the nearest 1 or 2 decimal places
float roundNum(float n) {
  String nString = str(n);
  //println(n,nString);
  if (n>0) {
    float intPart = float(nString.substring(0, nString.indexOf(".")));
    String decimalPart = nString.substring(nString.indexOf("."));
    if (decimalPart.length() > 2) {
      decimalPart = decimalPart.substring(0, 3);
    } else if (decimalPart.length()==1) {
      decimalPart = decimalPart + 0;
    }
    float num = intPart+float(decimalPart);

    return num;
  } else {
    return 0.0;
  }
}

// Updates stock every time the tick variable reaches a multiple of month duration
void updateStocks() {
  if (tick%monthDuration == 0) {
    pear.randomizeTrend();
    shoeStore.randomizeTrend();
    blueberry.randomizeTrend();
    tick+=1;
    months+=1;
  } else {
    tick+=1;
  }
}

// Sets the limit on the stock sell slider for the GUI so user can sell all stocks easily
void stockOwned() {
  String n = stockType;
  if (n.equals("Pear")) {
    stocksOwned.setLimits(0, 0, int(pear.stocksBought));
    stocksOwned.setNbrTicks(int(pear.stocksBought/2));
  } else if (n.equals("Schattman's Shoe Store")) {
    stocksOwned.setLimits(0, 0, int(shoeStore.stocksBought));
    stocksOwned.setNbrTicks(int(shoeStore.stocksBought/2));
  } else if (n.equals("Blueberry")) {
    stocksOwned.setLimits(0, 0, int(blueberry.stocksBought));
    stocksOwned.setNbrTicks(int(blueberry.stocksBought/2));
  }
}

// Updates the news for each of the stock companies
void updateNews() {
  fill(0);
  text("Pear News: ", 770, 45); 
  text("Schattman's Shoe Store News: ", 770, 235);
  text("Blueberry News: ",770, 425);
  pear.newsUpdate(770, 70);
  blueberry.newsUpdate(770, 450);
  shoeStore.newsUpdate(770, 260);
}
