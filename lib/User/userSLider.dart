
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../../Provider/firestoreProvider.dart';
import '../models/ImageSlider.dart';

class UserSliderWidget extends StatelessWidget{
  ImageSlider imageSlider;
 UserSliderWidget(this.imageSlider);
  @override
  Widget build(BuildContext context) {
    return 
      Container(child:
        Column(
            children: [
             
              SizedBox(height: 10,),
              
          
   
   Container(
        //  child: Center( child:Container(
        //         decoration: BoxDecoration(  color: Color.fromARGB(255, 222, 208, 217),
        //           borderRadius: BorderRadius.circular(25)),
        //         padding: EdgeInsets.only(top:1,bottom:1,left: 30,right: 30),
              
        //         child: Text(imageSlider.title,style:GoogleFonts.dynalight(fontSize: 27)
        //         //TextStyle(fontWeight:FontWeight.w600,fontSize: 16 ),
        //         ),
        //       ),),
         height: 200.0,
         width: 400,
        // width: MediaQuery.of(context).size.width ,
         decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: Color.fromARGB(255, 219, 225, 230),
         image: DecorationImage(
                image: NetworkImage(imageSlider.imagesliderUrl),
          fit: BoxFit.cover
              ),
              
                 ),
              ),
            ],
          ),
        
      
    );
  }

}