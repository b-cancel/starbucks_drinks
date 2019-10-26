import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starbucks_drinks/frap.dart';
import 'package:starbucks_drinks/helper/basic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starbucks_drinks/intermediate.dart';
import 'package:starbucks_drinks/mainHelpers.dart';
import 'package:starbucks_drinks/other.dart';

//STRANGE
//- Starbucks Blonde Caffe Latte
//- Starbucks Blonde Vanilla Latte
//- iced coffee

void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drinks',
      home: DrinkList(),
    );
  }
}

class DrinkList extends StatefulWidget {
  DrinkList({
    Key key, 
  }) : super(key: key);

  @override
  _DrinkListState createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  bool beginer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (beginer) ? new Beginner() : Intermediate(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          beginer = !beginer;
          setState(() {
            
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class Beginner extends StatelessWidget {
  const Beginner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Card(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextCard(
                      "all iced lattes take whip except (caffe latte, vanilla latte)",
                    ),
                    TextCard("all iced mochas take whip"),
                    LattesDrinksSection(),
                  ],
                ),
              ),
              MacchiatosSection(),
            ],
          ),
        ),
        FrapSection(),
        Card(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextCard("Anything using tea bags [2]/2"),
              HotTeaSection(),
              TeaLatteSection(),
            ],
          ),
        ),
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