import 'package:flutter/material.dart';

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

          // changer scaffold() par la bonne page
          getCardFor(context, "Exo2", (context) => Scaffold()),

        ],
      )

    );

  }

  Card getCardFor(BuildContext context, String title, WidgetBuilder f) {
    return Card(
            color: Colors.blue,
            child: ListTile(
              title: Text("Exo 2", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: f)
                );
              },
            ),
          );
  }



}