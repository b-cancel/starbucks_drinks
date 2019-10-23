import 'package:flutter/material.dart';

class BasicSection extends StatelessWidget {
  const BasicSection({
    Key key,
    @required this.name,
    @required this.onTap,
    @required this.items,
    @required this.colors,
    @required this.onTaps,
  }) : super(key: key);
  
  final String name;
  final Function onTap;
  final List<String> items;
  final List<Color> colors;
  final List<Function> onTaps;

  @override
  Widget build(BuildContext context) {
    List<Widget> itemsInRow = List<Widget>();

    //add title
    itemsInRow.add(
      Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

    //add items
    for(int i = 0; i < items.length; i++){
      itemsInRow.add(
        ActionButton(
          color: colors[i],
          name: items[i],
          onTap: onTaps[i],
        ),
      );
    }

    //build
    return Card(
      child: InkWell(
        onTap: () => onTap(),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: itemsInRow,
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    this.color,
    this.name,
    this.onTap,
    this.zeroPadding: false,
    Key key,
  }) : super(key: key);

  final Color color;
  final String name;
  final Function onTap;
  final bool zeroPadding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(
          zeroPadding ? 0 : 4,
        ),
        child: RaisedButton(
          padding: EdgeInsets.all(4),
          onPressed: () => onTap(),
          color: color,
          child: Text(
            name,
            style: TextStyle(
              color: (color == Colors.white || color == Colors.yellow) ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}