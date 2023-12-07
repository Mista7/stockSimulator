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

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window:639850:
  appc.background(230);
} //_CODE_:window:639850:

public void stockMenuClicked(GDropList source, GEvent event) { //_CODE_:StockMenu:418905:
  stockType = StockMenu.getSelectedText();} //_CODE_:StockMenu:418905:

public void stockMoneyChanged(GSlider source, GEvent event) { //_CODE_:stockMoneySlider:638553:
  stockMoneyBuy = stockMoneySlider.getValueI();
} //_CODE_:stockMoneySlider:638553:

public void stockSoldChanged(GSlider source, GEvent event) { //_CODE_:stocksOwned:897158:
  amountToSell = stocksOwned.getValueI();
} //_CODE_:stocksOwned:897158:

public void stockBought(GButton source, GEvent event) { //_CODE_:buyStocks:282418:
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
  }
} //_CODE_:buyStocks:282418:

public void stockSold(GButton source, GEvent event) { //_CODE_:sellStocks:695993:
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
  } //_CODE_:sellStocks:695993:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window = GWindow.getWindow(this, "Window title", 0, 0, 300, 250, JAVA2D);
  window.noLoop();
  window.setActionOnClose(G4P.KEEP_OPEN);
  window.addDrawHandler(this, "win_draw1");
  label1 = new GLabel(window, 4, 2, 92, 19);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Stock Options:");
  label1.setLocalColorScheme(GCScheme.RED_SCHEME);
  label1.setOpaque(false);
  StockMenu = new GDropList(window, 6, 29, 112, 80, 3, 10);
  StockMenu.setItems(loadStrings("list_418905"), 0);
  StockMenu.setLocalColorScheme(GCScheme.RED_SCHEME);
  StockMenu.addEventHandler(this, "stockMenuClicked");
  label2 = new GLabel(window, 6, 74, 113, 39);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Select Amount of Money to spend");
  label2.setLocalColorScheme(GCScheme.RED_SCHEME);
  label2.setOpaque(false);
  stockMoneySlider = new GSlider(window, 12, 123, 100, 40, 10.0);
  stockMoneySlider.setLimits(0.0, 0.0, initialMoney);
  stockMoneySlider.setShowValue(true);
  stockMoneySlider.setShowLimits(true);

  stockMoneySlider.setNumberFormat(G4P.DECIMAL, 0);
  stockMoneySlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  stockMoneySlider.setOpaque(false);
  stockMoneySlider.addEventHandler(this, "stockMoneyChanged");
  label3 = new GLabel(window, 131, 75, 106, 38);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Select Amount of Stocks to Sell");
  label3.setLocalColorScheme(GCScheme.RED_SCHEME);
  label3.setOpaque(false);
  stocksOwned = new GSlider(window, 133, 123, 100, 40, 10.0);
  stocksOwned.setLimits(0.0, 0.0, 100);
  stocksOwned.setShowValue(true);
  stocksOwned.setShowLimits(true);

  stocksOwned.setNumberFormat(G4P.DECIMAL, 2);
  stocksOwned.setLocalColorScheme(GCScheme.RED_SCHEME);
  stocksOwned.setOpaque(false);
  stocksOwned.addEventHandler(this, "stockSoldChanged");
  buyStocks = new GButton(window, 23, 172, 80, 30);
  buyStocks.setText("Buy");
  buyStocks.setLocalColorScheme(GCScheme.RED_SCHEME);
  buyStocks.addEventHandler(this, "stockBought");
  sellStocks = new GButton(window, 142, 172, 80, 30);
  sellStocks.setText("Sell");
  sellStocks.setLocalColorScheme(GCScheme.RED_SCHEME);
  sellStocks.addEventHandler(this, "stockSold");
  window.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window;
GLabel label1; 
GDropList StockMenu; 
GLabel label2; 
GSlider stockMoneySlider; 
GLabel label3; 
GSlider stocksOwned; 
GButton buyStocks; 
GButton sellStocks; 
