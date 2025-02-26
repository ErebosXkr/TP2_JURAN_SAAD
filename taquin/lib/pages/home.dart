import 'package:flutter/material.dart';
import 'package:taquin/pages/exo4.dart';
import 'package:taquin/pages/exo2.dart';

class Home extends StatelessWidget{
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("TP2", style: TextStyle(color: Colors.white),),
      ),

      body: ListView(
        children: [

          Card(
            color: Colors.blue,
            child: ListTile(
              title: Text("Exo 2", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageTransformer())
                );
              },
            ),
          ),


          Card(
            color: Colors.blue,
            child: ListTile(
              title: Text("Exo 4", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              onTap: () {
                Navigator.push(context,
                // remplacer Scaffold() par la bonne page
                  MaterialPageRoute(builder: (context) => DisplayTileWidget())
                );
              },
            ),
          ),



        ],
      )

    );

  }



}