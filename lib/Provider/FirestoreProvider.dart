import 'package:flutter/foundation.dart';
import 'package:flutter_client_1/models/Category.dart';

import '../Helper/FireStoreHelper.dart';
import '../models/ImageSlider.dart';
import '../models/Product.dart';

class FireStoreProvider extends ChangeNotifier{
   FireStoreProvider(){
    getAllCategory();
    getAllsliders();
  }
  List<Category1> categories=[];
  
   List<Product> products=[];
  List<ImageSlider>imagesliderslist=[];
  getAllCategory()async{
    categories = await FirestoreHelper.firestoreHelper.getCategoryFromFireStore();
    notifyListeners();
  }
  getAllProductsa(String catId)async{

     products = await FirestoreHelper.firestoreHelper.getAllProducts(catId);
    notifyListeners();

  }
  getAllsliders()async{
  imagesliderslist=await  FirestoreHelper.firestoreHelper.getAllSliders();
  notifyListeners();
    
  }
}