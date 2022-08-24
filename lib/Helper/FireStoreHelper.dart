import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_client_1/models/Category.dart';

import '../models/ImageSlider.dart';
import '../models/Product.dart';
import '../models/User.dart';
class FirestoreHelper {
  FirestoreHelper._();
static  FirestoreHelper firestoreHelper=FirestoreHelper._();
FirebaseFirestore firestoreinstance=FirebaseFirestore.instance;
addUserToFireStore(user appuser)async{
     firestoreinstance.collection("user").doc(appuser.id!).set(appuser.toMap());
}

  Future<user> getUserFromFireStore(String id)async{
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestoreinstance.collection("user").doc(id).get();
    documentSnapshot.data();
    return user.fromMap(documentSnapshot.data()!);
  }
CollectionReference<Map<String, dynamic>>  firebaseInstancecategory = FirebaseFirestore.instance.collection('categories');
  Future<List<Category1>> getCategoryFromFireStore()async{
    
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await  firebaseInstancecategory.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =querySnapshot.docs;
    List<Category1> categories =  documents.map((e){
      Category1 category = Category1.fromMap(e.data());
      category.catId=e.id;
      return category;
    }).toList();
    return categories;
  }
  Future<List<Product>> getAllProducts(String catId)async{
  QuerySnapshot<Map<String, dynamic>>querySnapshot= await FirebaseFirestore.instance
    .collection("categories")
    .doc(catId)
    .collection("products")
   .get();
  List<Product>products= querySnapshot.docs.map((e){
    
    Map<String,dynamic>data=e.data();
    data['id']=e.id;
    Product product=Product.fromMap(data);
    return product;

   }).toList();
return products;
 }
 CollectionReference<Map<String,dynamic>> imagesliderinstance=FirebaseFirestore.instance.collection('Slider');
 Future<List<ImageSlider>> getAllSliders()async{
  QuerySnapshot<Map<String, dynamic>> querySnapshot =await imagesliderinstance.get();
 List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot= querySnapshot.docs;
 List<ImageSlider> sliderslist=DocumentSnapshot.map((e){
  ImageSlider sliderimage=ImageSlider.fromMap(e.data());
  sliderimage.sliderid=e.id;
  return sliderimage;

 }).toList();

return sliderslist;
  }
}
