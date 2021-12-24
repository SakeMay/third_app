import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'HEAVYWEIGHT',
      ),
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/inscryption-screen3.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: const DicePage(),
            ),
          )),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  List<int> DiceNumber = [Random().nextInt(93) + 1, Random().nextInt(93) + 1];

  void changeDiceFace(int i) {
    setState(() {
      DiceNumber[i] = Random().nextInt(93) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: SizedBox(height: 0),
          ),
          Flexible(
            flex: 80,
            fit: FlexFit.tight,
            child: Column(
              children: [
                Flexible(
                  flex: 17,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Text(
                      'My Deck',
                      style: TextStyle(
                        color: Color(0xFFc7611a),
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 73,
                  fit: FlexFit.tight,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          child: Image.asset(
                            'images/cards/card-${DiceNumber[0]}.jpg',
                          ),
                          onPressed: () {
                            changeDiceFace(0);
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: Image.asset(
                            'images/cards/card-${DiceNumber[1]}.jpg',
                          ),
                          onPressed: () {
                            changeDiceFace(1);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child: SizedBox(height: 0),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: SizedBox(width: 0),
          ),
        ],
      ),
    );
  }
}
