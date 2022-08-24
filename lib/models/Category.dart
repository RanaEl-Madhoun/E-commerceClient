class Category1{
   String ?catId;
  late String name;
  late String imageUrl;
  Category1({required this.name,required this.imageUrl});
  Category1.fromMap(Map<String,dynamic> map){
    catId=map['catId'];
    name=map['name'];
    imageUrl=map['imageUrl'];
  }
  toMap(){
    return{
      
      'name':name,
      'imageUrl':imageUrl
    };
  }
}
