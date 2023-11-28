class Stock{
  String name;
  FloatList values = new FloatList();
  float stability;
  
  Stock(String n, float v, float s){
    this.name = n;
    this.values.append(v);
    this.stability = s;
  }
  
  void addValue(float v){
    this.values.append(v);
  }
  
  
}
