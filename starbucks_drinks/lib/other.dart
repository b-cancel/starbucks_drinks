import 'package:flutter/material.dart';
import 'package:starbucks_drinks/frap.dart';

class Other extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          "Other",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          MyListTile(
            color: Colors.brown, 
            title: "Iced Coffee", 
            subtitle: "- ice coffee blend\n"
            + "- [4] / 6 pumps classic\n" 
            + "- with milk (splash of 2%)",
            whiteText: true,
          ),
          MyListTile(
            color: Colors.brown, 
            title: "Iced (Regular / Blonde) Caffee Latte", 
            subtitle: "- [2] shots",
            whiteText: true,
          ),
          MyListTile(
            color: Colors.black, 
            title: "Doubleshot on ice", 
            subtitle: "- [3] / 5 shots\n"
            + "- [3] / 5 classic syrup (blonde only -1)\n" 
            + "- splash of 2%",
            whiteText: true,
          ),
          MyListTile(
            color: Colors.white, 
            title: "Flat White (ristretto > whole milk > [steam / ice])", 
            subtitle: "- (Regular / Blonde) Espresso 2 / 2 / [3] / (3 hot / 4 iced) shots",
          ),
          MyListTile(
            color: Colors.red, 
            title: "Caramel apple spice (steamed)", 
            subtitle: "- [4] cinnamon dolce\n"
            + "- caramel drizzle \n"
            + "- whip",
          ),
          MyListTile(
            color: Colors.grey,
            title: "Caffee Misto",
            subtitle: "- 50/50, 2% milk / coffee",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}