import 'package:flutter/material.dart';
import 'dart:math';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    int height = args['height'];
    int weight = args['weight'];

    String calc(int height, int weight) {
      double res = (weight / pow(height / 100, 2));
      print(weight);
      return res.toStringAsFixed(1);
    }

    var data = double.parse(calc(height, weight));

    String getResult() {
      if (data > 25) {
        return 'OverWeight';
      } else if (data > 18.5) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    }

    String getInterpretation() {
      if (data >= 25) {
        return 'You have a higher than normal body weight.Try to exercize more :)';
      } else if (data > 18.5) {
        return 'You have a normal body weight. Good job \'_\'';
      } else {
        return 'You have a lower than normal body weight .You can get a bit more !!';
      }
    }

    String result = getResult();
    String ip = getInterpretation();
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text('Result'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "YOUR RESULT",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF4C4F5E),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            result,
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "$data",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            ip,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
