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

          Card(
            color: Colors.blue,
            child: ListTile(
              // numéro de l'exercice
              title: Text("Exo 2", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              onTap: () {
                Navigator.push(context,
                  // remplacer par la page corresondante
                  MaterialPageRoute(builder: (context) => Scaffold())
                );
              },
            ),
          )

        ],
      )

    );

  }



}