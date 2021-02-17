import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String binario = "";
  double total;
  String decimal = "";
  int index;
  String txt = 'initial';

  setZero() {
    if (binario.length < 8) {
      setState(() {
        binario += "0";
      });
    }
  }

  setOne() {
    if (binario.length < 8) {
      setState(() {
        binario += "1";
      });
    }
  }

  setEmpty() {
    setState(() {
      binario = "";
      decimal = "";
    });
  }

  setDecimal() {
    setState(() {
      total = 0;
    });
    index = 0;
    List numbers = binario.split("");
    print(numbers.length);
    for (int i = numbers.length - 1; i >= 0; i--) {
      double number = double.parse(numbers[i]) * 2;
      double numberPow = pow(number, index);
      index++;
      setState(() {
        total += numberPow;
      });
    }
    setState(() {
      decimal = total.toStringAsFixed(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle style1 = ElevatedButton.styleFrom(
        primary: Colors.white, fixedSize: Size(66, 50));
    ButtonStyle style2 = ElevatedButton.styleFrom(
        primary: Colors.redAccent[400], fixedSize: Size(134, 50));
    ButtonStyle style3 = ElevatedButton.styleFrom(
        primary: Colors.greenAccent[400], fixedSize: Size(280, 50));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue,
              Colors.blue[800],
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    width: 135,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      binario,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    width: 135,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      decimal,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () => setZero(),
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: style1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () => setOne(),
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: style1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setEmpty(),
                  child: Text(
                    'LIMPAR',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: style2,
                )
              ],
            ),
            ElevatedButton(
              onPressed: () => setDecimal(),
              child: Text(
                'CONVERTER',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: style3,
            )
          ],
        ),
      ),
    );
  }
}
