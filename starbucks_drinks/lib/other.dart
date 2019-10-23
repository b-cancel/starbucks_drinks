import 'package:flutter/material.dart';
import 'package:starbucks_drinks/frap.dart';
import 'package:starbucks_drinks/main.dart';

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
          TextCard(
            "Hot Tea Stachet: short 1 | grande 2"
          ),
          TextCard(
            "Iced Tea: uses ice and milk"
          ),
          TextCard(
            "Hot Tea: uses water and steamed milk"
          ),
          MyListTile(
            color: Colors.brown, 
            title: "Iced Coffee", 
            subtitle: "- ice coffee blend\n"
            + "- 4 pumps classic\n" 
            + "- with milk (splash of 2%)",
            whiteText: true,
          ),
          MyListTile(
            color: Colors.black, 
            title: "Doubleshot on ice", 
            subtitle: "- 3 shots\n"
            + "- 3 classic syrup (blonde only 2)\n" 
            + "- splash of 2%",
            whiteText: true,
          ),
          MyListTile(
            color: Colors.white, 
            title: "Flat White (ristretto > whole milk > [steam / ice])", 
            subtitle: "- Regular Espresso 2 shots\n"
            + "- Blonde Espresso 3 shots",
          ),
          MyListTile(
            color: Colors.grey, 
            title: "London fog tea latte (no water, steamed milk)", 
            subtitle: "- 4 pumps vanilla",
          ),
          MyListTile(
            color: Colors.lightGreen, 
            title: "[Hot / Iced] Matcha Green Tea Latte (no water, steamed milk)", 
            subtitle: "- 3 matcha powder\n"
            + "- Lemonade Version",
          ),
          MyListTile(
            color: Colors.grey, 
            title: "Chai tea latte (water, steamed milk)", 
            subtitle: "- 4 pumps chai",
          ),
          MyListTile(
            color: Colors.grey, 
            title: "Royal English breakfast tea latte (water, steamed milk)", 
            subtitle: "- 4 pumps liquid cane",
          ),
          MyListTile(
            color: Colors.blue, 
            title: "Blueberry black", 
            subtitle: "- Blueberry flavored juice blend\n"
            + "- black tea\n"
            + "- 4 pumps of liquid cane sugar\n"
            + "- Lemonade Version",
          ),
          MyListTile(
            color: Colors.red, 
            title: "Caramel apple spice (steamed)", 
            subtitle: "- 4 cinnamon dolce\n"
            + "- caramel drizzle \n"
            + "- whip",
          ),
          MyListTile(
            color: Colors.yellow,
            title: "Honey citrus mint tea AND Citrus defender",
            subtitle: "- have 2 packets of honey",
          )
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