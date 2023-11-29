class Stock{
  String name, trend;
  FloatList values = new FloatList();
  
  Stock(String n, float v){
    this.name = n;
    this.values.append(v);
  }
  
  void addValue(float v){
    this.values.append(v);
  }
  
  void newValue(){
    float percentage;
    if(trend.equals("+")){
      percentage = random(0,0.01) + 1;
    }
    else if(trend.equals("-")){
      percentage = random(-0.01,0) + 1;
    }
    else{
      percentage = random(-0.01, 0.01) + 1;
    }
    
    this.values.append(this.values.get(this.values.size()-1)* percentage);
  }
  
}
