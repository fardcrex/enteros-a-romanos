import 'dart:math';

//puedes probarlo en https://dartpad.dev/ solo copia el código de este archivo 
//solución escalable 

main() {  
  print(intToRoman(3)); // III
  print(intToRoman(58)); // LVIII
  print(intToRoman(102)); // CII
  print(intToRoman(1994)); // MCMXCIV
  
// print(intToRoman(25359)); ÑÑWCCCLIX
}

const map = {
  1: 'I',
  5: 'V',
  10: 'X',
  50: 'L',
  100: 'C',
  500: 'D',
  1000: 'M',
 /* 5000: 'W',
    10000:'Ñ'*/
};

String intToRoman(int numero) {
  assert(1 <= numero);
  final listNum = '$numero'.split('');
  final length = listNum.length;
  final listRomanos = <String>[];
  
  for (var i = 0; i < length; i++) {
    final numberMultiple = new NumberMultiple.when(
      numStr: listNum[i],
      multiplicador: pow(10, length - i - 1),
    );
    listRomanos.add(numberMultiple.convertToRoman());
  }
 
  return listRomanos.join('');
}

abstract class NumberMultiple {
  final int multiplicador;
  NumberMultiple(this.multiplicador);
  factory NumberMultiple.when({int multiplicador, String numStr}) {
    final decimalValue = int.parse(numStr);

    if (_isMultipleOf10kPlus4k(multiplicador, decimalValue)) return MultipleOf10kPlus4k(multiplicador);
    if (_isMultipleOf10kPlus5k(multiplicador, decimalValue)) return MultipleOf10kPlus5k(multiplicador);
    if (_isMultipleOf10kPlus9k(multiplicador, decimalValue)) return MultipleOf10kPlus9k(multiplicador);
    if (_isMultipleOf10kPlus6kOr7kOr8k(multiplicador, decimalValue))
      return MultipleOf10kPlus6kOr7kOr8k(multiplicador, decimalValue);
    return MultipleOf10kPlus1kOr2kOr3k(multiplicador, decimalValue);
  }
  String convertToRoman();

  static bool _isMultipleOf10kPlus4k(int multi, int decimalValue) => _isMultipleOf(4, multi, decimalValue);
  static bool _isMultipleOf10kPlus5k(int multi, int decimalValue) => _isMultipleOf(5, multi, decimalValue);
  static bool _isMultipleOf10kPlus9k(int multi, int decimalValue) => _isMultipleOf(9, multi, decimalValue);
  static bool _isMultipleOf10kPlus6kOr7kOr8k(int multi, int decimalValue) =>
      _isMultipleOf(6, multi, decimalValue) ||
      _isMultipleOf(7, multi, decimalValue) ||
      _isMultipleOf(8, multi, decimalValue);
  static bool _isMultipleOf(int numk, int multi, int demalValue) => ((demalValue - numk) * multi) % (10 * multi) == 0;
}

class MultipleOf10kPlus4k extends NumberMultiple {
  MultipleOf10kPlus4k(multiplicador) : super(multiplicador);

  @override
  String convertToRoman() => map[multiplicador] + map[multiplicador * 5];
}

class MultipleOf10kPlus9k extends NumberMultiple {
  MultipleOf10kPlus9k(multiplicador) : super(multiplicador);

  @override
  String convertToRoman() => map[multiplicador] + map[multiplicador * 10];
}

class MultipleOf10kPlus5k extends NumberMultiple {
  MultipleOf10kPlus5k(multiplicador) : super(multiplicador);

  @override
  String convertToRoman() => map[multiplicador * 5];
}

class MultipleOf10kPlus1kOr2kOr3k extends NumberMultiple {
  final int numValue;
  MultipleOf10kPlus1kOr2kOr3k(multiplicador, this.numValue) : super(multiplicador);

  @override
  String convertToRoman() => List.generate((numValue % 5), (_) => map[multiplicador]).join('');
}

class MultipleOf10kPlus6kOr7kOr8k extends NumberMultiple {
  final int numValue;
  MultipleOf10kPlus6kOr7kOr8k(multiplicador, this.numValue) : super(multiplicador);

  @override
  String convertToRoman() => map[multiplicador * 5] + List.generate((numValue % 5), (_) => map[multiplicador]).join('');
}

