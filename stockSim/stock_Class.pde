class Stock{
  String name, trend;
  FloatList values = new FloatList();
  float stocksBought;
  ArrayList<PVector> points;
  float lastPrice;
  boolean stockChanged;
  
  Stock(String n, float v){
    this.name = n;
    this.values.append(v);
    stockChanged = true;
  }
  
  void addValue(float v){
    this.values.append(v);
  }
  
  void newValue(){
    float percentage;
    if(this.trend.equals("+")){
      percentage = random(0,0.025) + 1;
    }
    else if(this.trend.equals("-")){
      percentage = random(-0.025,0) + 1;
    }
    else{
      percentage = random(-0.025, 0.025) + 1;
    }

    this.values.append(roundNum(this.values.get(this.values.size()-1)* percentage));
    stockChanged = true;
  }
 
 void randomizeTrend(){
  int chance = int(random(0, 2));
  
  if (chance == 1) {
    this.trend = "+";
  } else {
    this.trend ="-";
  }

  this.newValue();
  

}
  
 
 //void graphStock(){
 //  int x = 300;
 //  float y = this.values.get(this.values.size()-1);
 //  int xAxis = 250/years+300;
 //  int yAxis  = 230;
   
 //  line(300,350, 550, 350); // x range = 300-550
 //  line(300,350, 300, 100); // y range = 100-350
   
 //  if(years>=2){
 //    line(x,y, xAxis, yAxis+y, );
 //  }
   
 //}
}
