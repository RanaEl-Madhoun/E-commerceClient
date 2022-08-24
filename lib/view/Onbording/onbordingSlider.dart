import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client_1/Router.dart';
import 'package:flutter_client_1/User/userview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Login/login_screen.dart';
import 'CustomOnbording.dart';

class Slideronbordaing extends StatefulWidget {
  @override
  State<Slideronbordaing> createState() => _SlideronbordaingState();
}

class _SlideronbordaingState extends State<Slideronbordaing> {
  final controller =PageController();
  bool isLastPage=false;
    @override
    void dispose(){
      controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
        
      body:    PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            isLastPage=index==2;
          });
          
        },
            children: [
               OnBordaingScreen(picurl: "assets/image/splash4pn.png",title: 'Find the items youv\nbeen looking for',Description:'unlimited choises of\n spaciel handmade stuff' ,),
                OnBordaingScreen(picurl: "assets/image/paint.png",title: 'Save the Earth\nby using our products',Description:'our prodcuts are environmentally\nfriendly with almost zero waste ' ,),
                 OnBordaingScreen(picurl: "assets/image/splash3.webp",title: 'Support growthing\nbusinesses',Description:'people here are making art and in\n the same time make money\nout of it' ,),
                 
            ],
          ),
          
      bottomSheet:isLastPage?Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Spacer(),
              InkWell(
                onTap: ()async{
                    final prefs=await SharedPreferences.getInstance();
                    prefs.setBool('showHome', true);
                   Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>LoginScreen())
                    );
                    
                  },
                child: Container(
                   padding: const EdgeInsets.all(20),
                   child: Text("Get Started"),
                  //height: 90,
                  
                  decoration: BoxDecoration(color: Color.fromARGB(255, 198, 222, 242),
                    borderRadius: BorderRadius.circular(30)),
                  // child: ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //         primary: Colors.purple,
                  //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //         textStyle: TextStyle(
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.bold)),
                  //   onPressed: ()async{
                  //   final prefs=await SharedPreferences.getInstance();
                  //   prefs.setBool('showHome', true);
                  //  Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(builder: (context)=>UserView())
                  //   );
                    
                  // }, child:Text("get Started") ),
                ),
              ),
            ],
          ),
        ),
      )
    :   Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Spacer(),
            Center(
              child:SmoothPageIndicator(
                controller: controller,
               count: 3,
              //  effect: WormEffect(
              //   spacing: 16,
              //  // dotColor: Colors.black
              //   ),
                onDotClicked: ((index) => controller.animateToPage(index,duration: Duration(milliseconds: 500), curve: Curves.easeIn))
                ,)

            ),
            //Spacer(),
            // ElevatedButton(onPressed: (){
            //   controller.nextPage(duration: Duration(milliseconds: 500), 
            //   curve: Curves.easeInOut);
            // }, child: Text("Next"))
          ],),
        ),
      ),
     
    );

  }
}
void main(List<String> args) {
  runApp(MaterialApp(home: Slideronbordaing(),));
}