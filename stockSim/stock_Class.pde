class Stock{
  String name, trend;
  FloatList values = new FloatList();
  float stocksBought;
  ArrayList<PVector> points;
  float lastPrice;
  boolean stockChanged;
  color col;
  
  Stock(String n, float v, color c){
    this.name = n;
    this.values.append(v);
    stockChanged = true;
    this.col = c;
  }
  
  void addValue(float v){
    this.values.append(v);
  }
  
  void newValue(){
    float percentage;
    if(this.trend.equals("+")){
      percentage = random(0.025,0.07) + 1;
    }
    else if(this.trend.equals("-")){
      percentage = random(-0.7,-0.6) + 1;
    }
    else if(this.trend.equals("++")){
      percentage = random(0.7,0.6)+1;
    }
    else if(this.trend.equals("--")){
      percentage = random(-0.6,-7)+1;
    }
    else{
      percentage = random(-0.7, 0.7) + 1;
    }

    this.values.append(roundNum(this.values.get(this.values.size()-1)* percentage));
    stockChanged = true;
  }
 
 String randomizeTrend(){
  float chance = random(0, 2);
  float newsChance = random(0,100);
  if (chance >= 0.5 && newsChance>5) {
    this.trend = "+";
  } else if(newsChance>5 && chance<=0.5) {
    this.trend ="-";
  }
  else{
    String newsTrend = shoeStoreNews[int(random(0,shoeStoreNews.length-1))].substring(0,1);
    String news = shoeStoreNews[int(random(0,shoeStoreNews.length-1))].substring(1);
    //text(news,500,30);
    
    if(newsTrend == "+"){
      this.trend = "++";
    }
    else{
      this.trend = "--";
    }
    this.newValue();
    return news;
  }

  this.newValue();
  return "";

}
  
  
void newsUpdate(){
  
  
  
}
 
 //void graphStock(){
 //  int x = 10;
 //  float y = this.values.get(this.values.size()-2);
 //  float y1 = this.values.get(this.values.size()-1);
 //  int xAxis = 250/years+300;
 //  int yAxis  = 230;
   
 //  fill(this.col);
 //  line(10,250, 260, 250); // x range = 300-550
 //  line(10,250, 10, 10); // y range = 100-350
   
 //  for(int i = 1; i<this.values.size(); i++){
 //    if(years>=2){
 //      float x2 = map(x,0,width,0,250);
 //      float y2 = map(y,0,height,0,250);
 //      float y3 = map(y1,0,height, 0,250);
 //      line(x2,y2, 260/this.values.size(), y3);
  
 //      x+=50;
 //      y = this.values.get(i-1);
 //      y1  = this.values.get(i);
 //    }
 //  }
   
 //  if(years>=2){
 //    line(x,y, x+xAxis, yAxis+y);
 //  }
 //}
}
