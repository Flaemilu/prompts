class IdGenerator{
  static int _id = 0;
  static nextId(){
    _id++;
    return _id;
  }

  static int _max(int i1, int i2){
    if(i1  < i2) return i2;
        return i1;
  }
}