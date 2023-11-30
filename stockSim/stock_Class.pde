class Stock{
  String name, trend;
  FloatList values = new FloatList();
  float sharesBought;
  
  Stock(String n, float v){
    this.name = n;
    this.values.append(v);
  }
  
  void addValue(float v){
    this.values.append(v);
  }
  
  void newValue(){
    float percentage;
    if(this.trend.equals("+")){
      percentage = random(0,0.01) + 1;
    }
    else if(this.trend.equals("-")){
      percentage = random(-0.01,0) + 1;
    }
    else{
      percentage = random(-0.01, 0.01) + 1;
    }
    
    this.values.append(this.values.get(this.values.size()-1)* percentage);
  }
 
 void randomizeTrend(){
  int chance = int(random(0, 2));
  if (chance == 1) {
    this.trend = "+";
  } else {
    this.trend ="-";
  }

  this.newValue();
  
  println(this.values.get(this.values.size()-1));
}
 
}
