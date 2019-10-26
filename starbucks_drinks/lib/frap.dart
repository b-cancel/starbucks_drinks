import 'package:flutter/material.dart';
import 'package:starbucks_drinks/mainHelpers.dart';

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
          Card(
            color: Colors.brown,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: Text(
                  "Coffee",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          MyListTile(
            color: Colors.black, 
            title: "Espresso", 
            subtitle: "- always 1 shot expresso",
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
            subtitle: "- [3] DARK caramel\n"
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