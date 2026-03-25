import 'package:flutter/material.dart';
import 'package:working_calculator/splashScreen.dart';
import 'package:working_calculator/widgits/CpltRoundBtn.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(Calculator());
}
class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black
      ),
      home: SplashScreen(),
    );
  }
}
class DashBoardCalcy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}
class DashBoardState extends State<DashBoardCalcy>{

  TextEditingController controller = TextEditingController();
  String expression = "";
  String result = "";

  void updateDisplay (String value){
    setState(() {
      expression += value;
      controller.text = expression;
    });
  }
  void clearDisplay(){
    setState(() {
      expression = "";
      result = "";
      controller.text = "";
    });
  }
  void deleteLast(){
    setState(() {
      if(expression.isNotEmpty){
        expression = expression.substring(0,expression.length - 1);
        controller.text = expression;
      }
    });
  }
  String senatizeExpression (String expr){
    if (expr == null ) {
      return "";
    }

    expr = expr.replaceAll("×","*").replaceAll("÷", "/");
    expr = expr.replaceAllMapped(RegExp(r'(\d+(\.\d+)?)%'), (m) => '(${m[1]}/100)');
    expr = expr.replaceAll(RegExp(r'[+\-*/.]$'), '');
    expr = expr.replaceAll(RegExp(r'[\u200B-\u200D\uFEFF]'), '');

    return expr;
  }
  void calculateResult (){
    if(expression.trim().isEmpty)return;
    try {
      String expr = senatizeExpression(expression);
      if (expr.isEmpty) {
        setState(() => result = 'Error');
        return;
      }
      Parser p = Parser();
      Expression parsed = p.parse(expr);
      ContextModel cm = ContextModel();
      double eval = parsed.evaluate(EvaluationType.REAL, cm);

      String Finalresult;
      Finalresult = eval.toStringAsFixed(2);
      Finalresult = Finalresult.replaceFirst(RegExp(r'\.?0+$'), '');

      setState(() {
        result = Finalresult;
        controller.text = expression;
      });
    } catch (e, st) {
      print('Calc error parsing "$expression" -> ${e.toString()}');
      print(st);

      setState(() {
        result = 'Error';
      });
    }
  }

  double evaluateExpression(String expression) {
    List<String> tokens = expression.split(RegExp(r'([+\-*/])')).map((e) => e.trim()).toList();
    if (tokens.isEmpty) return 0.0;

    double result = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double val = double.parse(tokens[i + 1]);
      if (op == '+') result += val;
      if (op == '-') result -= val;
      if (op == '*') result *= val;
      if (op == '/') result /= val;
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(result.isEmpty ? " " : result,style: TextStyle(color: Colors.white,fontSize: 37,fontWeight: FontWeight.bold),),
            SizedBox(height: 12,),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none
              ),
              controller: controller,
              readOnly: true,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 37
              ),
            ),
            SizedBox(height: 21,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(text: "AC",backgroundColor: Colors.grey.shade900, onPressed: (){
                  clearDisplay();
                }),
                CircularButton(text: "%",backgroundColor: Colors.grey.shade900, onPressed: (){
                  updateDisplay("%");
                }),
                CircularButton(icon: Icons.backspace,backgroundColor: Colors.grey.shade900, onPressed: (){
                  deleteLast();
                }),
                CircularButton(text:"÷",backgroundColor: Colors.grey.shade900, onPressed: (){
                  updateDisplay("÷");
                }),
              ],
            ),
            SizedBox(height: 21,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(text: "1",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("1");
                }),
                CircularButton(text: "2",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("2");
                }),
                CircularButton(text: "3",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("3");
                }),
                CircularButton(icon: Icons.clear_rounded,backgroundColor: Colors.grey.shade900, onPressed: (){
                  updateDisplay("×");
                }),
              ],
            ),
            SizedBox(height: 21,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(text: "4",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("4");
                }),
                CircularButton(text: "5",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("5");
                }),
                CircularButton(text: "6",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("6");
                }),
                CircularButton(icon: Icons.remove,backgroundColor: Colors.grey.shade900, onPressed: (){
                  updateDisplay("-");
                }),
              ],
            ),
            SizedBox(height: 21,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(text: "7",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("7");
                }),
                CircularButton(text: "8",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("8");
                }),
                CircularButton(text: "9",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("9");
                }),
                CircularButton(icon: Icons.add,backgroundColor: Colors.grey.shade900, onPressed: (){
                  updateDisplay("+");
                }),
              ],
            ),
            SizedBox(height: 21,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(text: "00",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("00");
                }),
                CircularButton(text: "0",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay("0");
                }),
                CircularButton(text: ".",backgroundColor: Colors.grey.shade800, onPressed: (){
                  updateDisplay(".");
                }),
                CircularButton(text: "=",backgroundColor: Colors.orange.shade400, onPressed: (){
                  calculateResult();
                }),
              ],
            ),
            SizedBox(height: 45,),
          ],
        ),
      ),
    );
  }
}