import 'package:calculadora/controller/calculator_controller.dart';
import 'package:flutter/material.dart';

import 'package:calculadora/widgets/calc_button.dart';
import 'package:calculadora/widgets/calculation.dart';
import 'package:get/instance_manager.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalculatorController calcCtrl = Get.put(CalculatorController());
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Calculation(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: 'AC',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calcCtrl.reset(),
                ),
                CalculatorButton(
                  text: '+/-',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calcCtrl.changeSimbol(),
                ),
                CalculatorButton(
                  text: 'del',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calcCtrl.del(),
                ),
                CalculatorButton(
                  text: '/',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calcCtrl.operatorPressed('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '7',
                  onPressed: () => calcCtrl.onNumberPressed('7'),
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () => calcCtrl.onNumberPressed('8'),
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () => calcCtrl.onNumberPressed('9'),
                ),
                CalculatorButton(
                  text: 'X',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calcCtrl.operatorPressed('X'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '4',
                  onPressed: () => calcCtrl.onNumberPressed('4'),
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () => calcCtrl.onNumberPressed('5'),
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () => calcCtrl.onNumberPressed('6'),
                ),
                CalculatorButton(
                  text: '-',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calcCtrl.operatorPressed('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '1',
                  onPressed: () => calcCtrl.onNumberPressed('1'),
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () => calcCtrl.onNumberPressed('2'),
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () => calcCtrl.onNumberPressed('3'),
                ),
                CalculatorButton(
                  text: '+',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calcCtrl.operatorPressed('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '0',
                  big: true,
                  onPressed: () => calcCtrl.onNumberPressed('0'),
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => calcCtrl.dotPressed(),
                ),
                CalculatorButton(
                  text: '=',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calcCtrl.equalPressed(),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
