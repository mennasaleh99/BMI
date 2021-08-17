import 'package:bmi/Widgets/GenderCard.dart';
import 'package:bmi/Widgets/WACard.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var gender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        title: Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    child: GenderCard(
                        gender == Gender.male
                            ? Color(0xff130f60)
                            : Color(0xff1e152f),
                        "Male",
                        Icons.male),
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: GenderCard(
                        gender == Gender.female
                            ? Color(0xff130f60)
                            : Color(0xff1e152f),
                        "Female",
                        Icons.female),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff1e152f),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$height",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " CM",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Slider(
                      min: 100,
                      max: 200,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                      activeColor: Colors.pinkAccent,
                      inactiveColor: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WACard("Weight", weight, () {
                    setState(() {
                      weight++;
                    });
                  }, () {
                    setState(() {
                      weight--;
                    });
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  WACard("Age", age, () {
                    setState(() {
                      age++;
                    });
                  }, () {
                    setState(() {
                      age--;
                    });
                  })
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/ResultScreen',
                      arguments: <String, dynamic>{
                        "weight": weight,
                        "height": height,
                      });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
