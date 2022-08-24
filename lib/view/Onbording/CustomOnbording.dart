import 'package:flutter/material.dart';

class OnBordaingScreen extends StatelessWidget{
  String picurl;
  String title;
  String Description;
  OnBordaingScreen({
    required this.picurl,
    required this.Description,
    required this.title
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
   // backgroundColor: Color.fromARGB(255, 216, 169, 185),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0,right: 18,left: 18),
        child: Column(
          children: [
            //const Spacer(),
             Container(
          //  child: Center( child:Container(
          //         decoration: BoxDecoration(  color: Color.fromARGB(255, 222, 208, 217),
          //           borderRadius: BorderRadius.circular(25)),
          //         padding: EdgeInsets.only(top:1,bottom:1,left: 30,right: 30),
                
          //         child: Text(imageSlider.title,style:GoogleFonts.dynalight(fontSize: 27)
          //         //TextStyle(fontWeight:FontWeight.w600,fontSize: 16 ),
          //         ),
          //       ),),
           height: 500.0,
           width: 400,
          // width: MediaQuery.of(context).size.width ,
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
           color: Color.fromARGB(255, 219, 225, 230),
           image: DecorationImage(
                  image: AssetImage(picurl),
            fit: BoxFit.cover
                ),
                
                   ),
                ),
SizedBox(height: 30,)      ,
        Row(
          children: [
            Text(
                   textAlign:TextAlign.left,
                    title,
                    style:Theme.of(context)
                    .textTheme.headline5!
                    .copyWith(fontWeight:FontWeight.w500 )
                  ),
          ],
        ),
              const SizedBox(height: 16,),
              Row(
                children: [
                 
                   Text(Description,style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,),
                  
                ],
              ),
               const Spacer(),
            
          ]
          ),
      ),
    ),
   );
  }

}void main(List<String> args) {
  runApp(MaterialApp(home: OnBordaingScreen(picurl: "assets/image/testtestpn.png",title: 'Find you what thatsf kkg',Description:'fgfhghfdhfrbvgfhgdhvbdhshbf' ,),));
}