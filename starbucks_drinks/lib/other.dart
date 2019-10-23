import 'package:flutter/material.dart';
import 'package:starbucks_drinks/frap.dart';
import 'package:starbucks_drinks/main.dart';

//---------------Hot Teas
//tea bags 1/1/[2]/2---------------
//- Teavana Chai Tea
//- Earl Grey Black Tea
//- Royal English Breakfast Black Tea
//- Rev Up Wellness Brewed Tea
//- Emperor's Cloud and Mist Green Tea
//- Jade Citrus Mint Brewed Tea
//- Mint Majesty Herbal Tea
//- Peach Tranquility Herbal Tea
//- Comfort Wellness Brewed Tea
//- Defense Wellness Brewed Tea
//w/ honey 1/1/[2]/2---------------
//- Honey Citrus Mint Tea (with Honey AND Lemonade)
//- Citrus Defender (with Honey AND Lemonade)



//SEPERATE (no tea bags)
//- Chai Tea Latte
//- Match Green Tea Latte
//SEPERATE (with tea bags [from above])
//- London Fog Tea Latte ([4] vanilla syrup)
//- Royal English Breakfast Tea Latte ([4] liquid cane syrup)

//iced teas
//liquid cane sugar 3/[4]/6/7

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
            "Tea Bags: [2] / 2"
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
            color: Colors.yellow,
            title: "Honey citrus mint tea AND Citrus defender",
            subtitle: "- 1 / 1 / [2] / 2 honey",
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