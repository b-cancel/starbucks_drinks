import 'package:flutter/material.dart';
import 'package:starbucks_drinks/main.dart';

class OnlyCreme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        automaticallyImplyLeading: false,
        title: Text(
          "Only Creme Frap",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          MyListTile(
            color: Colors.red, 
            title: "Strawberry", 
            subtitle: "- strawberry purre in mix, and on top",
          ),
          MyListTile(
            color: Colors.amber, 
            title: "Chai", 
            subtitle: "- [2]/2 pumps chai\n"
              + "- cinnamon powder",
          ),
          MyListTile(
            color: Colors.lightGreen, 
            title: "Match Green Tea", 
            subtitle: "- [3] pumps classic\n"
              + "- [3] scoops matcha powder"
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key key,
    @required this.color,
    @required this.title,
    @required this.subtitle,
    this.whiteText: false,
  }) : super(key: key);

  final Color color;
  final String title;
  final String subtitle;
  final bool whiteText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: (whiteText) ? Colors.white : Colors.black,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: (whiteText) 
              ? Colors.white.withOpacity(.75) 
              : Colors.black.withOpacity(.75),
            ),
          ),
        ),
      ),
    );
  }
}

class CoffeeAndCreme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        title: Text(
          "Coffee and Creme Frap",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          TextCard(
            "Coffee 2/[3]/4 roast & Creme creme"
          ),
          MyListTile(
            color: Colors.orange, 
            title: "Pumpkin Spice (Creme)", 
            subtitle: "- [2] / 2 pumpkin pumps\n"
            + "- pumpkin spice topping",
          ),
          MyListTile(
            color: Color(0xFFFFD59A), 
            title: "Salted Caramel Mocha (Creme)", 
            subtitle: "- [2] / 2 mocha pumps\n"
            + "- [2] / 2 toffee pumps\n"
            + "- caramel drizzle\n"
            + "- smooked sea salt",
          ),
          MyListTile(
            color: Color(0xFFF3E5AB), 
            title: "Caffee Vanilla [coffee] / Vanilla Bean [creme]", 
            subtitle: "- [3] scoop vanilla bean powder",
          ),
          MyListTile(
            color: Colors.brown,
            title: "(White) Mocha [coffee] / (White) Chocolate [creme]",
            subtitle: "- [3] (white) mocha sauce\n"
            + "(Java [coffee] / Double Chocolaty [creme]) Chip\n"
            + "- ADD [3] scoops frap chips\n"
            + "- ADD mocha drizzle\n"
            + "(Mocha [coffee] / Chocolate [creme]) Cookie Crumble\n"
            + "- ADD cookie crumble topping",
            whiteText: true,
          ),
          TextCard(
            "Only Coffee [roast > coffee]"
          ),
          MyListTile(
            color: Colors.brown,
            title: "Coffee", 
            subtitle: "- No Pumps\n"
            + "- NO WHIP",
            whiteText: true,
          ),
          MyListTile(
            color: Colors.black, 
            title: "Espresso", 
            subtitle: "- No Pumps\n"
            + "- always 1 shot expresso\n"
            + "- NO WHIP",
            whiteText: true,
          ),
          MyListTile(
            color: Color(0xFFFFD59A), 
            title: "Caramel", 
            subtitle: "- [3] pumps caramel\n"
            + "- caramel drizzle"
          ),
          MyListTile(
            color: Color(0xFFF3E5AB), 
            title: "Caramel Ribbon Crunch", 
            subtitle: "- NO PUMPS CARAMEL\n"
            + "- caramel drizzle\n"
            + "- caramel crunch topping",
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