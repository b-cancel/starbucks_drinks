import 'package:flutter/material.dart';
import 'package:starbucks_drinks/frap.dart';
import 'package:starbucks_drinks/helper/basic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drinks',
      home: DrinkList(),
    );
  }
}

Function makeSnackBar(BuildContext context, String text){
  return (){
    final snackBar = SnackBar(
      content: InkWell(
        onTap: (){
          Scaffold.of(context).hideCurrentSnackBar();
        },
        child: Text(text),
      ),
    );
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackBar);
  };
}

Function makePopUp(BuildContext context, Widget title, Widget body){
  return () {
    Scaffold.of(context).hideCurrentSnackBar();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return SimpleDialog(
          titlePadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.all(0),
          title: title,
          children: <Widget>[
            body,
          ],
        );
      },
    );
  };
}

class DrinkList extends StatefulWidget {
  DrinkList({
    Key key, 
  }) : super(key: key);

  @override
  _DrinkListState createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TextCard(
            "Grande Shots and Pumps",
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("[+/-] cup size"),
                  Expanded(
                    child: Center(
                      child: Text("EQUALS"),
                    ),
                  ),
                  Text("[+/-] (shots and pumps)"),
                ],
              ),
            ),
          ),
          TextCard(
            "2% milk EXCEPT whole milk for fraps",
          ),
          SpacedCard(
            Column(
              children: <Widget>[
                Text("Skinny Version"),
                Row(
                  children: <Widget>[
                    ActionButton(
                      name: "Sugar Free Syrup",
                      color: Colors.grey,
                      onTap: (){},
                    ),
                    ActionButton(
                      name: "Non Fat Milk",
                      color: Colors.grey,
                      onTap: (){},
                    ),
                    ActionButton(
                      name: "No Whipped Cream",
                      color: Colors.grey,
                      onTap: (){},
                    ),
                  ],
                )
              ],
            )
          ),
          SpacedCard(
            Column(
              children: <Widget>[
                Text("-1 Pump (Subtractive)"),
                Row(
                  children: <Widget>[
                    ActionButton(
                      name: "Blonde Espresso",
                      color: Colors.grey,
                      onTap: (){},
                    ),
                    ActionButton(
                      name: "Macchiatos",
                      color: Colors.grey,
                      onTap: (){},
                    ),
                    ActionButton(
                      name: "Cappuccinos",
                      color: Colors.grey,
                      onTap: (){},
                    ),
                  ],
                )
              ],
            )
          ),
          FrapSection(),
          ColdBrewSection(),
          IcedTeaSection(),
          RefresherSection(),
        ],
      )
    );
  }
}

class TextCard extends StatelessWidget {

  TextCard(
    this.text,
  );

  final String text;

  @override
  Widget build(BuildContext context) {
    return SpacedCard(
      Text(text),
    );
  }
}

class SpacedCard extends StatelessWidget {
  SpacedCard(
    this.child,
  );

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}

class FrapSection extends StatelessWidget {
  const FrapSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BasicSection(
      name: "Fraps",
      onTap: makeSnackBar(
        context, 
        "Any othery syrup 2 pumps\n"
        + "Whip EXCEPT coffee and expresso frap\n"
        + '(Roast) > whole milk to 1st > syrups > ice > (coffee / creme)',
      ),
      items: [
        "Coffee and Creme", 
        //only creme multilined
        "ONLY Creme\n"
        + "- Strawberry\n"
        + "- Chai\n"
        + "- Match Green Tea",
      ],
      colors: [Colors.brown, Colors.yellow],
      onTaps: [
        (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoffeeAndCreme(),
            ),
          );
        },
        makePopUp(
          context, 
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.yellow,
            child: Text("Only Creme"),
          ), 
          Column(
            children: <Widget>[
              MyListTile(
                color: Colors.red, 
                title: "Strawberry", 
                subtitle: "- strawberry purre in mix, and on top",
              ),
              MyListTile(
                color: Colors.amber, 
                title: "Chai", 
                subtitle: "- 2 pumps chai\n"
                  + "- cinnamon powder",
              ),
              MyListTile(
                color: Colors.lightGreen, 
                title: "Match Green Tea", 
                subtitle: "- 3 pumps classic\n"
                  + "- 3 scoops matcha powder"
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RefresherSection extends StatelessWidget {
  const RefresherSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BasicSection(
      name: "Refreshers",
      onTap: makeSnackBar(context, 'Tea > (water / lemonade / coconut milk) > ice'),
      items: ["Mango Dragon Fruit", "Strawberry Acai", "Very Berry Hibiscus"],
      colors: [Colors.red, Colors.pink, Colors.purple],
      onTaps: [
        makeSnackBar(context, "Dragon Drink"),
        makeSnackBar(context, "Pink Drink"),
        makeSnackBar(context, "Violet Drink"),
      ],
    );
  }
}

class IcedTeaSection extends StatelessWidget {
  const IcedTeaSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BasicSection(
      name: "Iced Tea",
      onTap: makeSnackBar(context, 
      "4 pumps liquid cane sugar\n"
      "Juice Blend (none / peach / guava) > Tea > (water / lemonade)",
      ),
      //black, green, passion tango, white
      items: ["Black", "Green", "Passion Tango", "White"],
      colors: [Colors.black, Colors.green, Colors.red, Colors.white],
      onTaps: [
        (){Scaffold.of(context).hideCurrentSnackBar();},
        (){Scaffold.of(context).hideCurrentSnackBar();},
        (){Scaffold.of(context).hideCurrentSnackBar();},
        (){Scaffold.of(context).hideCurrentSnackBar();},
      ],
    );
  }
}

class ColdBrewSection extends StatelessWidget {
  const ColdBrewSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BasicSection(
      name: "Cold Brew",
      onTap: makeSnackBar(context, 
      "Cold Brew (iced) / Nitro Cold Brew (not iced)"
      + "\nX pumps (E venti X+2, X+3) > brew > (ice) > (splash / cold foam)",
      ),
      //black, green, passion tango, white
      items: [
        "Cold Foam",
        "Pump..\n2V",
        "Casc..\n2V",
        "Vanilla\n4V",
        "Salted\n4C",
      ],
      colors: [
        Colors.black, 
        Colors.orange,
        Colors.brown,
        Colors.white,
        Colors.grey,
      ],
      onTaps: [
        makePopUp(
          context, 
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.yellow,
            child: Text(
              "Cream Formulas\n"
              + "3 wetter / 4 dryer\n"
              + "1 / 2 / [2/3]",
            ),
          ), 
          Column(
            children: <Widget>[
            //Cream Formulas
              MyListTile(
                color: Colors.white, 
                title: "Regular", 
                subtitle: "- non fat milk",
              ),
              MyListTile(
                color: Colors.amber, 
                title: "Pumpkin", 
                subtitle: "- sweet cream\n"
                + "- pumpkin sauce",
              ),
              MyListTile(
                color: Colors.grey, 
                title: "Salted", 
                subtitle: "- sweet cream\n"
                + "- salt packets"
              ),
              MyListTile(
                color: Colors.brown, 
                title: "Cascara", 
                subtitle: "- nonfat milk\n"
                + "- cascara syrup",
                whiteText: true,
              ),
            ],
          ),
        ),
        /*
        "Pumpkin 2V"
        "Cascara 2V",
        "Vanilla 4V",
        "Salted  4C",
        */
        makeSnackBar(
          context, 
          "w/ Pumpkin Cream Cold Brew\n"
          + "- [2] Vanilla\n"
          + "- Pumpkin cream cold foam\n"
          + "- Pumpkin spice topping"
        ),
        makeSnackBar(
          context, 
          "w/ Cascara Creme Cold Foam\n" 
          + "- [2] Vanilla\n"
          + "- Cascara cold foam\n"
          + "- Cascara topping"
        ),
        makeSnackBar(
          context, 
          "w/ Salted Cream Cold Foam\n"
          + "- [4] Caramel\n"
          + "- Salted cold foam"
        ),
        makeSnackBar(
          context, 
          "w/ Vanilla Sweet Cream Cold Brew\n" 
          + "- [4] Vanilla\n"
          + "- Splash of sweet cream"
        ),
      ],
    );
  }
}