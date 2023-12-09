/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw2(PApplet appc, GWinData data) { //_CODE_:window1:951546:
  appc.background(230);
} //_CODE_:window1:951546:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:708575:
  //println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield1:708575:

public void textarea2_change1(GTextArea source, GEvent event) { //_CODE_:textarea2:753584:
  //println("textarea2 - GTextArea >> GEvent." + event + " @ " + millis());
} //_CODE_:textarea2:753584:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window:639850:
  appc.background(230);
} //_CODE_:window:639850:

public void stockMoneyChanged(GSlider source, GEvent event) { //_CODE_:stockMoneySlider:465912:
  stockMoneyBuy = stockMoneySlider.getValueI();
} //_CODE_:stockMoneySlider:465912:
public void stockBought(GButton source, GEvent event) { //_CODE_:buyStock:944013:
  if(stockMoneyBuy == 0) {
    return;
  }
  else {
    if(balance >= stockMoneyBuy){
      balance -= stockMoneyBuy;
      if(stockType.equals("Pear")){
        pear.stocksBought += stockMoneyBuy/(pear.values.get(pear.values.size()-1));
        pear.lastPrice = pear.values.get(pear.values.size()-1);
      }
      else if(stockType.equals("Schattman's Shoe Store")){
        shoeStore.stocksBought += stockMoneyBuy/shoeStore.values.get(shoeStore.values.size()-1);
        shoeStore.lastPrice = shoeStore.values.get(shoeStore.values.size()-1);
      }
      else {
        blueberry.stocksBought += stockMoneyBuy/blueberry.values.get(blueberry.values.size()-1);
        blueberry.lastPrice = blueberry.values.get(blueberry.values.size()-1);
      }
    }
    stockMoneySlider.setLimits(0.0, 0.0, balance);
  }
  stockOwned();
} //_CODE_:buyStock:944013:
public void stockMenuClicked(GDropList source, GEvent event) { //_CODE_:StockMenu:499289:
  stockType = StockMenu.getSelectedText();

} //_CODE_:StockMenu:499289:
public void stockSoldChanged(GSlider source, GEvent event) { //_CODE_:stocksOwned:471301:
  amountToSell = stocksOwned.getValueI();
} //_CODE_:stocksOwned:471301:
public void stockSold(GButton source, GEvent event) { //_CODE_:sellStock:329209:
  if(stockType.equals("Pear") && amountToSell <= pear.stocksBought){
    pear.stocksBought -= amountToSell;
    balance += amountToSell*pear.values.get(pear.values.size()-1);
  }
  else if(stockType.equals("Schattman's Shoe Store") && amountToSell <= shoeStore.stocksBought){
    shoeStore.stocksBought -= amountToSell;
    balance += amountToSell*shoeStore.values.get(shoeStore.values.size()-1);
  }
  else if(stockType.equals("Blueberry") && amountToSell <= blueberry.stocksBought){
    blueberry.stocksBought -= amountToSell;
    balance += amountToSell*blueberry.values.get(blueberry.values.size()-1);
  }
  
  } //_CODE_:sellStock:329209:


// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window = GWindow.getWindow(this, "Stock Simulator Controls", 0, 0, 300, 250, JAVA2D);
  window.noLoop();
  window.setActionOnClose(G4P.KEEP_OPEN);
  window.addDrawHandler(this, "win_draw1");
  label1 = new GLabel(window, 4, 2, 92, 19);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Stock Options:");
  label1.setLocalColorScheme(GCScheme.RED_SCHEME);
  label1.setOpaque(false);
  StockMenu = new GDropList(window, 6, 29, 165, 64, 3, 10);
  StockMenu.setItems(loadStrings("list_418905"), 0);
  StockMenu.setLocalColorScheme(GCScheme.RED_SCHEME);
  StockMenu.addEventHandler(this, "stockMenuClicked");
  StockBuyLabel = new GLabel(window, 2, 116, 113, 39);
  StockBuyLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  StockBuyLabel.setText("Select Amount of Money to spend");
  StockBuyLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  StockBuyLabel.setOpaque(false);
  stockMoneySlider = new GSlider(window, 10, 157, 100, 40, 10.0);
  stockMoneySlider.setShowValue(true);
  stockMoneySlider.setShowLimits(true);
  stockMoneySlider.setLimits(0.0, 0.0, balance);
  stockMoneySlider.setNumberFormat(G4P.DECIMAL, 0);
  stockMoneySlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  stockMoneySlider.setOpaque(false);
  stockMoneySlider.addEventHandler(this, "stockMoneyChanged");
  stockSell = new GLabel(window, 125, 116, 106, 38);
  stockSell.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  stockSell.setText("Select Amount of Stocks to Sell");
  stockSell.setLocalColorScheme(GCScheme.RED_SCHEME);
  stockSell.setOpaque(false);
  stocksOwned = new GSlider(window, 130, 157, 100, 40, 10.0);
  stocksOwned.setShowValue(true);
  stocksOwned.setShowLimits(true);
  stocksOwned.setLimits(0.0, 0.0, 0.0);
  stocksOwned.setNumberFormat(G4P.DECIMAL, 2);
  stocksOwned.setLocalColorScheme(GCScheme.RED_SCHEME);
  stocksOwned.setOpaque(false);
  stocksOwned.addEventHandler(this, "stockSoldChanged");
  buyStock = new GButton(window, 21, 199, 80, 30);
  buyStock.setText("Buy");
  buyStock.setLocalColorScheme(GCScheme.RED_SCHEME);
  buyStock.addEventHandler(this, "stockBought");
  sellStocks = new GButton(window, 139, 200, 80, 30);
  sellStocks.setText("Sell");
  sellStocks.setLocalColorScheme(GCScheme.RED_SCHEME);
  sellStocks.addEventHandler(this, "stockSold");
  window.loop();
  window1 = GWindow.getWindow(this, "How to Use", 0, 0, 250, 230, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.CLOSE_WINDOW);
  window1.addDrawHandler(this, "win_draw2");
  textfield1 = new GTextField(window1, 2, 5, 238, 22, G4P.SCROLLBARS_NONE);
  textfield1.setText("Welcome to Stock Simulator");
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  textarea2 = new GTextArea(window1, 3, 28, 242, 197, G4P.SCROLLBARS_NONE);
  textarea2.setText("To play, start by buying a stock from the companies found in the dropdown menu. This is done by dragging the slider above the buy button indicating how much money you want to put into the stock. Once you have some stocks, try selling them by sliding the other slider and clicking sell. See how much bank you can make!");
  textarea2.setOpaque(true);
  textarea2.addEventHandler(this, "textarea2_change1");
  //window.loop();
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window;
GLabel label1; 
GDropList StockMenu; 
GLabel StockBuyLabel; 
GSlider stockMoneySlider; 
GLabel stockSell; 
GSlider stocksOwned; 
GButton buyStock; 
GButton sellStocks; 
GWindow window1;
GTextField textfield1; 
GTextArea textarea2; 
