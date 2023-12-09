class Stock {
  String name, trend;
  FloatList values = new FloatList();
  float stocksBought;
  ArrayList<PVector> points;
  float lastPrice;
  boolean stockChanged;
  color col;
  boolean bankrupt = false;
  String[] news;
  String currNews ="";
  color newsCol;

  Stock(String n, float v, color c, String[] nw) {
    this.name = n;
    this.values.append(v);
    stockChanged = true;
    this.col = c;
    this.news = nw;
  }


// Adds new value to the stock everytime the updateStocks function is called
  void newValue() {
    float percentage;
    //Changes the values by multiplying a percentage that is higher or lower based on the trend
    if (this.trend.equals("+")) {
      percentage = random(0.025, 0.07) + 1;
    } else if (this.trend.equals("-")) {
      percentage = random(-0.07, -0.025) + 1;
    } else if (this.trend.equals("++")) {
      percentage = random(0.2, 0.4)+1;
    } else if (this.trend.equals("--")) {
      percentage = random(-0.2, -0.4)+1;
    } else {
      percentage = random(-0.1, 0.1) + 1;
    }

    float nextVal = roundNum(this.values.get(this.values.size()-1)* percentage);
    if (nextVal <=0.0) {
      this.values.append(0.00000000);
      this.bankrupt = true;
    } else {
      this.values.append(nextVal);
    }
    stockChanged = true;
  }

// Randomizes whether the stock increases or decreases
  String randomizeTrend() {
    float chance = random(0, 100);
    float newsChance = random(0, 100);
    if (chance >= 50 && newsChance>5) {
      this.trend = "+";
    } 
    else if (newsChance>5 && chance<50) {
      this.trend ="-";
    } 
    // If the news chance is triggered, then the news percentages are chosen and the stock values change dramatically
    else {
      int randLine = int(random(0, this.news.length-1));
      String newsTrend = this.news[randLine].substring(0, 1);
      String news = this.news[randLine].substring(1);

      if (newsTrend.equals("+")) {
        this.trend = "++";
        this.newsCol = color(0, 255, 0);
      } 
      else if (newsTrend.equals("-")) {
        this.trend = "--";
        this.newsCol = color(255, 0, 0);
      }
      this.newValue();
      this.currNews = news;
      return news;
    }

    this.newValue();
    return "";
  }

//Prints the latest news onto the screen
  void newsUpdate(int x, int y) {
    fill(this.newsCol);
    text(this.currNews, x, y);
  }
}
