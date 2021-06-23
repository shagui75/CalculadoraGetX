import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalculatorController extends GetxController {
  final RxString firstNumber = ''.obs;
  final RxString secondNumber = ''.obs;
  final RxString operation = ''.obs;
  final RxString mainResult = '0'.obs;
  String mainResultWithoutFormat = '0';
  double mainResultDouble = 0.0;
  final RxBool operationEnded = false.obs;

  void onNumberPressed(String number) {
    //si la operación está finalizada (es decir, ya se apretó el igual) se borran los números
    if (operationEnded.value) {
      reset();
    }

    if (mainResult.value == '0') {
      mainResultWithoutFormat = number;
      mainResult.value = number;
    } else {
      var f = NumberFormat("###,###.#######", "en_US");
      mainResultWithoutFormat = mainResultWithoutFormat + number;
      mainResultDouble = double.parse(mainResultWithoutFormat);
      mainResult.value = f.format(mainResultDouble);
    }
  }

  void dotPressed() {
    if (mainResult.value.indexOf('.') == -1) {
      mainResultWithoutFormat = mainResultWithoutFormat + '.';
      mainResult.value = mainResult.value + '.';
    }
  }

  void reset() {
    firstNumber.value = '';
    secondNumber.value = '';
    operation.value = '';
    mainResult.value = '0';
    mainResultWithoutFormat = '0';
    operationEnded.value = false;
  }

  void changeSimbol() {
    //sólo permite cambiar el símbolo si se está editando el número, no cuando hay un resultado
    if (operationEnded.value) {
      return;
    }
    if (mainResult.value.startsWith('-')) {
      mainResult.value = mainResult.value.replaceFirst('-', '');
    } else {
      mainResult.value = '-' + mainResult.value;
    }
  }

  void del() {
    //sólo permite borrar si se está editando el número, no cuando hay un resultado
    if (operationEnded.value) {
      return;
    }
    //si hay un sólo caracter o si hay dos pero el primero es el símbolo '-'
    if ((mainResult.value.length == 1) ||
        (mainResult.value.length == 2) && (mainResult.value.startsWith('-'))) {
      mainResult.value = '0';
    } else {
      mainResult.value =
          mainResult.value.substring(0, mainResult.value.length - 1);
    }
  }

  void operatorPressed(String operator) {
    if (mainResult.value == 'infinite') {
      return;
    }
    firstNumber.value = mainResult.value;
    operation.value = operator;
    secondNumber.value = '';
    mainResult.value = '0';
    operationEnded.value = false;
  }

  void equalPressed() {
    if (operation.value != '') {
      secondNumber.value = mainResult.value;
      //se le quita la coma al string del primer y segundo número y se los convierte a double
      double doublePrimerNumero =
          double.parse(firstNumber.value.replaceAll(',', ''));
      double doubleSecondNumber =
          double.parse(secondNumber.value.replaceAll(',', ''));
      String strResultado = '';
      double resultado = 0.0;
      switch (operation.value) {
        case '+':
          resultado = (doublePrimerNumero + doubleSecondNumber);
          break;
        case '-':
          resultado = (doublePrimerNumero - doubleSecondNumber);
          break;
        case '/':
          if (doubleSecondNumber == 0.0) {
            strResultado = 'infinite';
          } else {
            resultado = (doublePrimerNumero / doubleSecondNumber);
          }
          break;
        case 'X':
          resultado = (doublePrimerNumero * doubleSecondNumber);
          break;
        default:
          {
            //resultado = main_result.value;
          }
      }
      if (strResultado != 'infinite') {
        //se limita el número a 8 decimales
        resultado = resultado.toPrecision(8);

        //se pasa el resultado a String
        var f = NumberFormat("###,###.#######", "en_US");
        strResultado = f.format(resultado);

        /* strResultado = resultado.toString();
        if (strResultado.endsWith('.0')) {
          strResultado = strResultado.substring(0, strResultado.length - 2);
        }*/
      }

      mainResult.value = strResultado;
      print(mainResult.value);
      //operación finalizada, queda listo para empezar una nueva pero sigue mostrando los números

      operationEnded.value = true;
    }
  }
}
