import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WACard extends StatefulWidget {
  final String label;
  var data;
  final Function() add;
  final Function() minus;
  WACard(this.label, this.data, this.add, this.minus, {Key? key})
      : super(key: key);

  @override
  _WACardState createState() => _WACardState();
}

class _WACardState extends State<WACard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff1e152f),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${widget.label}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${widget.data}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  fillColor: Color(0xFF4C4F5E),
                  shape: CircleBorder(side: BorderSide.none),
                  onPressed: () {
                    widget.minus();
                  }),
              RawMaterialButton(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  fillColor: Color(0xFF4C4F5E),
                  shape: CircleBorder(side: BorderSide.none),
                  onPressed: () {
                    widget.add();
                  })
            ],
          )
        ],
      ),
    );
  }
}
