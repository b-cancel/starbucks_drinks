import 'package:flutter/material.dart';
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
      content: Text(text),
    );
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackBar);
  };
}

Function makePopUp(BuildContext context, String title, String body){
  return () {
    Scaffold.of(context).hideCurrentSnackBar();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return SimpleDialog(
          title: new Text(title),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(24),
              child: Text(body),
            ),
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
          ColdBrewSection(),
          IcedTeaSection(),
          RefresherSection(),
        ],
      )
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
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
      ],
      onTaps: [
        makeSnackBar(
          context, 
          //"(non fat / sweet creme) blended\n"
          "3 wetter / 4 dryer\n"
          + "1 / 2 / [2/3]\n\n"

          + "Regular\n"
          + "- nonfat milk\n\n"

          + "Pumpkin Cream\n"
          + "- sweet cream\n"
          + "- pumpkin sauce\n\n"

          + "Salted Cream\n"
          + "- sweet cream\n"
          + "- salt packets\n\n"

          + "Cascara\n"
          + "- nonfat milk\n"
          + "- cascara syrup"
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