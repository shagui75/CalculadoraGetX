import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'package:calculadora/controller/calculator_controller.dart';

import 'sub_result.dart';
import 'line_separator.dart';
import 'main_result.dart';

class Calculation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalculatorController calcCtrl = Get.find<CalculatorController>();
    return Obx(() => Column(
          children: [
            SubResult(text: calcCtrl.firstNumber.value),
            SubResult(text: calcCtrl.operation.value),
            SubResult(text: calcCtrl.secondNumber.value),
            LineSeparator(),
            MainResultText(text: calcCtrl.mainResult.value),
          ],
        ));
  }
}
