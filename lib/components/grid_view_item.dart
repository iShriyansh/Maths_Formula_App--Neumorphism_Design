import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class GridViewItem extends StatelessWidget {
   final String  name ;
   GridViewItem({this.name});

  @override
  Widget build(BuildContext context) {
  

    return  Column(
      children: <Widget>[

        Stack(
          children: <Widget>[
            Card(
              color: Color(0xFF121212),
              elevation: 2,

              child: Container(


              ),

            ),
            Card(
              elevation: 0,
              color:Color(0xFFFFFFF).withOpacity(0.07),


              child: Container(
             height: 200,
                width: double.infinity,

                child:  Column(

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          alignment : Alignment.bottomLeft,
                          child: Neumorphic(
                              boxShape: NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.circular(12)), 
  style: NeumorphicStyle(
    
    depth: 2,
    intensity: 0.4,
    lightSource: LightSource.topLeft,
    color: Color(0x0d121212)
  ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(name,style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 18,fontWeight: FontWeight.w400),),
                            ))),
                    ),
                    Image.asset("images/maths/${name.toString().toLowerCase().substring(0,5)}.png",height: 90,color: Colors.deepPurple,),
                    SizedBox(height: 10,),

                  ],
                ),

              ),),


          ],
        )
        ,






      ],
    );
  }
  }
