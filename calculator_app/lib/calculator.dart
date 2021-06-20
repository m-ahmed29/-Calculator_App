import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";

  Widget btn(textt) {
    return ElevatedButton(
        onPressed: () {
          abc(textt);
        },
        child: Text(textt));
  }

  abc(textt) {
    setState(() {
      result = result + textt;
    });
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(child: Text('Calculator')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "$result",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("+"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                btn("4"),
                btn("5"),
                btn("6"),
                btn("-"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                btn("7"),
                btn("8"),
                btn("9"),
                btn("*"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                btn("0"),
                ElevatedButton(onPressed: output, child: Text('=')),
                ElevatedButton(onPressed: clear, child: Text('Clear')),
                btn("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
