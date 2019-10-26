import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starbucks_drinks/mainHelpers.dart';
import 'package:starbucks_drinks/main.dart';

class Intermediate extends StatelessWidget {
  const Intermediate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CoffeeSection(),
        MacchiatoSection(),
        Card(
          color: Colors.brown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Title(
                title: Text(
                  "Frappuccino [3]",
                ),
              ),
              WhiteLine(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "[3] w/ Exceptions [2]/2\n"
                    + "- pumpkin spice\n"
                    + "- salted caramel (mocha/toffee)"
                  ),
                ),
              ),
              FrapSection(
                simple: true,
              ),
            ],
          ),
        ),
        Card(
          color: Colors.brown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Title(
                title: Text(
                  "Cold Brew",
                ),
              ),
              WhiteLine(),
              ColdBrewSection(
                simple: true,
              ),
            ],
          ),
        ),
        Teas(),
      ],
    );
  }
}

class MacchiatoSection extends StatelessWidget {
  const MacchiatoSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title(
            title: Text(
              "Macchiatos",
            ),
          ),
          WhiteLine(),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 8.0,
                                  ),
                                  child: Icon(FontAwesomeIcons.blender),
                                ),
                                Text("[150] 2%"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Icon(FontAwesomeIcons.syringe),
                                ),
                                Text("[2]/2"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Icon(Icons.cloud),
                                ),
                                Text("[3]")
                              ],
                            ),
                          ),
                          Card(
                            color: Colors.brown,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Cocoa (toffe > mocha,caramel)",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xFFFFD59A),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Caramel (vanilla > caramel)"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            color: Color(0xFFFFD59A),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Caramel\n"
                                + "- [3] Vanilla\n"
                                + "- Caramel Drizzle",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
    @required this.title,
  }) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8,
        top: 8,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        child: title,
      ),
    );
  }
}

class Teas extends StatelessWidget {
  const Teas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Title(
            title: Text(
              "Teas",
            ),
          ),
          WhiteLine(),
          Material(
            color: Colors.transparent,
            child: Row(
              children: <Widget>[
                TeaButton(
                  snackbar: "Honey and Lemonade\n"
                  + "- Honey Citrus Mint Tea\n"
                  + "- Citrus Defender", 
                  isHot: true, 
                  subtitle: "B&H: [2]/2", 
                ),
                TeaButton(
                  snackbar: "[4]/6 Liquid Cane Sugar\n"
                  + "1. none/peach/guava/blueberry\n"
                  + "2. black/green/passion tango/white\n"
                  + "3. water/lemonade",
                  isHot: false,
                  subtitle: "LCS: [4]/6",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeaButton extends StatelessWidget {
  const TeaButton({
    Key key,
    @required this.snackbar,
    @required this.isHot,
    @required this.subtitle,
  }) : super(key: key);

  final String snackbar;
  final bool isHot;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: makeSnackBar(
          context, 
          snackbar,
        ),
        child: Card(
          color: (isHot) ? Colors.red : Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CoffeeSection extends StatelessWidget {
  const CoffeeSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Title(
            title: Text(
              "Coffee/Drinks [4]/(6 iced)",
            ),
          ),
          WhiteLine(),
          NoWhip(),
          ShotsAndPumps(),
          LattesDrinksSection(
            simple: true,
          ),
        ],
      ),
    );
  }
}

class WhiteLine extends StatelessWidget {
  const WhiteLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 2,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
      ),
    );
  }
}

class ShotsAndPumps extends StatelessWidget {
  const ShotsAndPumps({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: Icon(FontAwesomeIcons.glassWhiskey),
                  ),
                  Text("[2] / (2 hot)")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: Icon(FontAwesomeIcons.syringe),
                  ),
                  Text("[4] / (6 cold)")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoWhip extends StatelessWidget {
  const NoWhip({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text("NO"),
            Padding(
              padding: EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: Icon(FontAwesomeIcons.poop),
            ),
            Expanded(
              child: Text("(Caffe/Vanilla) Latte"),
            ),
            Expanded(
              child: Text("(Coffee/Espresso) Frap"),
            )
          ],
        ),
      ),
    );
  }
}