import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String label;
  final Color colour;
  final IconData icon;

  const GenderCard(this.colour, this.label, this.icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100,
            color: Colors.white,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ],
      ),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(15)),
    );
  }
}
