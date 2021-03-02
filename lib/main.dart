import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(0, 153, 0, 0.4),
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Color.fromRGBO(0, 153, 0, 0.4),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

//Static language but 'dynamic' keyword makes it dynamic

class _DicePageState extends State<DicePage> {
  //State of stateless widgets are not meant to change
  //State is the way how things are or displayed
  //Updates or changes? Stateful Widget.
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int diceTotal = 0;

  @override
  //Build method refreshes every time the page is saved.
  Widget build(BuildContext context) {
    Random random = new Random();
    void randomDice() {
      setState(() {
        leftDiceNumber = random.nextInt(6) + 1;
        rightDiceNumber = random.nextInt(6) + 1;
        diceTotal = leftDiceNumber + rightDiceNumber;
      });
    }

    // void diceAmount() {
    //   setState(() {
    //     var diceTotal = leftDiceNumber + rightDiceNumber;
    //     // print(diceTotal);
    //   });
    // }

    print(diceTotal);

    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 130.0),
                child: Text(
                  "$diceTotal",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                //Expanded uses flex like Bootstrap
                //Expanded widget automatically fills up the screen space
                child: FlatButton(
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                  onPressed: () {
                    randomDice();
                    // diceAmount();
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                  onPressed: () {
                    randomDice();
                    // diceAmount();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
