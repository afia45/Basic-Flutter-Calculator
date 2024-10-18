import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "0";      // To display the result
  String operation = "";    // To display the whole operation
  String value = "0";
  double number1 = 0.0;
  double number2 = 0.0;
  String operand = "";

  //function
  calculate(dynamic buttonText) {
    if (buttonText == "C") {
      result = "0";
      value = "0";
      number1 = 0.0;
      number2 = 0.0;
      operand = "";
      operation = "";    // Reset the operation when cleared
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      number1 = double.parse(result);
      operand = buttonText;
      value = "0";
      operation += buttonText;  // Append operand to the operation string
    } else if (buttonText == "=") {
      number2 = double.parse(result);
      if (operand == "+") {
        value = (number1 + number2).toStringAsFixed(2);
      } else if (operand == "-") {
        value = (number1 - number2).toStringAsFixed(2);
      } else if (operand == "/") {
        value = (number1 / number2).toStringAsFixed(2);
      } else if (operand == "x") {
        value = (number1 * number2).toStringAsFixed(2);
      }

      number1 = 0.0;
      number2 = 0.0;
      operand = "";
      operation += "=";  // Append '=' to show the operation completion
      //operation += double.parse(value).toString();
    } else {
      value = value + buttonText;
      operation += buttonText;  // Append number to the operation string
    }

    setState(() {
      result = double.parse(value).toString();  // Update result display
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 12, 86),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 65, 52, 255),
        title: Text(
          "Basic Flutter Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: SizedBox()),
          // Display the full operation
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                operation,   // Show the operation string here
                style: TextStyle(
                  fontSize: 24,       // Smaller font for operation
                  //fontWeight: FontWeight.w500,
                  color: Colors.grey, // Lighter color for operation text
                ),
              ),
            ),
          ),
          // Display the result below the operation
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                result,  // Show the result here
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("x"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("0"),
                    buildButton("C"),
                    buildButton("="),
                    buildButton("/"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    bool isOperand = buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/" ||
        buttonText == "=";

    bool isClear = buttonText == "C";

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isClear
                ? const Color.fromARGB(255, 143, 52, 255)  // Color for 'C' button
                : isOperand
                    ? Colors.orange  // Color for operand buttons
                    : Color.fromARGB(255, 65, 52, 255),   // Color for numbers
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onPressed: () {
            print(buttonText);
            calculate(buttonText);
          },
        ),
      ),
    );
  }
}
//Afia Tabassum