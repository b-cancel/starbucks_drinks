import 'package:flutter/material.dart';
import 'package:starbucks_drinks/frap.dart';
import 'package:starbucks_drinks/helper/basic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starbucks_drinks/other.dart';

void main() => runApp(MyApp());
//venti hot SHOTS same as grande (Except americanos)
//cold grande to venti +2 pump jump

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
          CupSizeChanges(),
          TextCard(
            "Anything Iced is poured to the 3rd line > ice is added",
          ),
          TextCard(
            "2% milk EXCEPT whole milk for fraps",
          ),
          ShotsAndSyrups(),
          SkinnyVersion(),
          MinusPumps(),
          LattesDrinksSection(),
          MacchiatosSection(),
          FrapSection(),
          TeaLatteSection(),
          ColdBrewSection(),
          IcedTeaSection(),
          RefresherSection(),
          SpacedCard(
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Other(),
                  ),
                );
              },
              child: Text("Other"),
            )
          ),
        ],
      )
    );
  }
}

class MinusPumps extends StatelessWidget {
  const MinusPumps({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacedCard(
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
    );
  }
}

class SkinnyVersion extends StatelessWidget {
  const SkinnyVersion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacedCard(
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
    );
  }
}

class CupSizeChanges extends StatelessWidget {
  const CupSizeChanges({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

class ShotsAndSyrups extends StatelessWidget {
  const ShotsAndSyrups({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacedCard(
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Icon(FontAwesomeIcons.glassWhiskey),
                  ),
                  Text(
                    "2 shots\n"
                    + "- venti hot 2\n"
                    + "- Americanos +1",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Icon(FontAwesomeIcons.syringe),
                  ),
                  Text(
                    "4 pumps\n"
                    + "- venti cold 6/7\n"
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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

class TeaLatteSection extends StatelessWidget {
  const TeaLatteSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BasicSection(
      name: "Tea Latte",
      onTap: makeSnackBar(
        context, 
        "[Hot / Iced]\n"
        + "all with steamed milk"
      ),
      items: [
        "London\nFog",
        "Matcha\nGreen",
        "Chai",
        "Royal\nEnglish\nBreakfast"
      ],
      colors: [
        Colors.grey, 
        Colors.lightGreen,
        Colors.yellow,
        Colors.brown,
      ],
      onTaps: [
        makeSnackBar(
          context, 
          "- 4 pumps vanilla\n"
          + "- 2 tea bags [black]",
        ),
        makeSnackBar(
          context, 
          "- 3 matcha powder\n"
          + "- Lemonade Version",
        ),
        makeSnackBar(
          context, 
          "- [4] / (hot 5 | cold 6) pumps chai\n"
          + "- water",
        ),
        makeSnackBar(
          context, 
          "- 4 pumps liquid cane\n"
          + "- 2 tea bags [black]\n"
          + "- water",
        ),
      ],
    );
  }
}

class LattesDrinksSection extends StatelessWidget {
  const LattesDrinksSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BasicSection(
      name: "Lattes / Drinks\n"
      + "(coffee / none)\n"
      + "[hot / iced]\n"
      + "w/ whip",
      onTap: makeSnackBar(context, 'syrups > shots > milk to 87 degrees'),
      items: ["Mocha", "Pumpkin", "Cinnamon Dolce", "Vanilla", "Salted Caramel"],
      colors: [Colors.black, Colors.orange, Colors.brown, Colors.white, Colors.grey],
      onTaps: [
        makeSnackBar(
          context, 
          "[regular / white] (mocha / chocolate)\n"
          + "- 4 [regular / white] mocha sauce\n"
          + "- only for regular chocolate\n"
          + "\t\t\t- 1 vanilla\n"
          + "\t\t\t- mocha drizzle",
        ),
        makeSnackBar(
          context, 
          "Pumpkin spice (latte / creme)\n"
          + "- 4 Pumpkin syrup\n"
          + "- Pumpkin spice topping",
        ),
        makeSnackBar(
          context, 
          "Cinnamon dolce (latte / creme)\n"
          + "- 4 Cinnamon dolce syrup\n"
          + "- Cinnamon dolce sprinkles",
        ),
        makeSnackBar(
          context, 
          "Vanilla (latte / creme)\n"
          + "- 4 Vanilla syrup",
        ),
        makeSnackBar(
          context, 
          "Salted Caramel (mocha / chocolate)\n"
          + "- 4 mocha sauce\n"
          + "- 4 toffee nut syrup\n"
          + "- 1 vanilla syrup (only for chocolate)\n"
          + "- caramel drizzle\n"
          + "- sea salt",
        ),
      ],
    );
  }
}

class MacchiatosSection extends StatelessWidget {
  const MacchiatosSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new BasicSection(
      name: "Macchiatos\n"
      + "[hot / iced]",
      onTap: makeSnackBar(
        context,
        "Cloud Formulas\n"
        + "- 100 / 150 / 200 ml 2%\n"
        + "- 1 / 2 / [2/3] vanilla pumps\n"
        + "- 2 / 3 / 4 scoops of cloud powder\n"
        + "syrups > milk to 87 degrees > shots",
      ),
      items: ["Espresso", "Caramel", "Cocoa Cloud", "Caramel Cloud"],
      colors: [Colors.black, Color(0xFFFFD59A), Colors.brown, Color(0xFFFFD59A)],
      onTaps: [
        makeSnackBar(
          context, 
          "Espresso\n"
          + "- nothing extra added",
        ),
        makeSnackBar(
          context, 
          "Caramel\n"
          + "- 3 vanilla pumps\n"
          + "- caramel drizzle",
        ),
        makeSnackBar(
          context, 
          "Cocoa Cloud\n"
          + "- 2 toffee nut (blonde 1)\n"
          + "- caramel drizzle\n"
          + "- mocha drizzle",
        ),
        makeSnackBar(
          context, 
          "Caramel Cloud\n"
          + "- 2 vanilla (blonde 1)\n"
          + "- caramel drizzle",
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
      onTap: makeSnackBar(
        context, 'Tea > (water / lemonade / coconut milk) > ice > fruit (trenta 2)'),
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
      "[4] / 6 pumps liquid cane sugar\n"
      "Juice Blend (none / peach / guava / blueberry) > Tea > (water / lemonade)",
      ),
      //black, green, passion tango, white
      items: ["Black", "Green", "Passion Tango", "White"],
      colors: [Colors.black, Colors.green, Colors.red, Colors.white],
      onTaps: [
        makeSnackBar(
          context, 
          "Blueberry Black",
        ),
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
              "Cold Foam Formulas\n"
              + "- 100 / 150 / 200 ml\n"
              + "- 1 / 2 / [2/3] pumps\n"
              + "- (3 wetter / 4 dryer)",
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
          "w/ Vanilla Sweet Cream Cold Brew\n" 
          + "- [4] Vanilla\n"
          + "- Splash of sweet cream"
        ),
        makeSnackBar(
          context, 
          "w/ Salted Cream Cold Foam\n"
          + "- [4] Caramel\n"
          + "- Salted cold foam"
        ),
      ],
    );
  }
}