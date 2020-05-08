import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'databaseHelper.dart';
import 'components/grid_view_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xFF121212),
      systemNavigationBarDividerColor: Colors.transparent,
    ));


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF121212)
      )

      ,home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
class _HomePageState extends State<HomePage> {

  DatabaseHelper databaseHelper = new  DatabaseHelper();
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseHelper.copyDatabase().then((va){
      setState(() {

        data = databaseHelper.subCategoryData;



      });
    });




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      key: _scaffoldKey,
      appBar: AppBar(
         backgroundColor: Color(0xff333333),
        leading: Neumorphic(
          
          
          margin: EdgeInsets.all(6),
      boxShape: NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.circular(12)), 
  style: NeumorphicStyle(
    
    
    depth: 2,
    intensity: 0.4,
    lightSource: LightSource.topLeft,
    color:Color(0xff333333),
  
    
  ),
  child: IconButton(
    
    icon: Icon(Icons.view_list,size: 20,color: Colors.white60),onPressed: ()=>_scaffoldKey.currentState.openDrawer(),)),
      
  
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:4.0),
            child: Neumorphic(
          
          
          margin: EdgeInsets.all(6),
      boxShape: NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.circular(12)), 
  style: NeumorphicStyle(
    
    
    depth: 2,
    intensity: 0.4,
    lightSource: LightSource.topLeft,
    color:Color(0xff333333),
  
    
  ),child: Padding(
    padding: const EdgeInsets.all(12),
    child: Icon(Icons.search,size: 20,color: Colors.white60,),
  )),
          )
        ],

        title: Neumorphic(
                              boxShape: NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.circular(20)), 
  style: NeumorphicStyle(
    
    depth: 2,
    intensity: 0.4,
    lightSource: LightSource.topLeft,
    color: Color(0x0d121212)
  ),child: Padding(
    padding: const EdgeInsets.only(left:12,right:12,top:8,bottom:8),
    child: Text("Math X",style: TextStyle(color: Colors.deepPurple,fontSize: 25,fontWeight: FontWeight.bold ),),
  )),
      ),

        body:Column(
          children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              child:data== null? Text("Loading") :
              
              AnimationLimiter(
                              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,

                  itemCount:data.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0,childAspectRatio: (500/550) ),
                  itemBuilder: (BuildContext context, int index){
                    return AnimationConfiguration.staggeredList(
                       position: index,
                     duration: const Duration(milliseconds: 375),
                      
                      
                      child: ScaleAnimation(
                       
                        child:  FadeInAnimation(child: GridViewItem(name: data[index]['sub_category'],))));
                  },
                ),
              ),
            ),
          ),
        ),
          ],
        )


    );

  }


}

