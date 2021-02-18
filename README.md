# enteros-a-romanos
Given an integer, convert it to a roman numeral.

'''
import 'dart:math';

main() {  
  print(intToRoman(1994));//MCMXCIV
  print(intToRoman(333));//CCCXXXIII
  print(intToRoman(444));//CDXLIV
  print(intToRoman(3999));//MMMCMXCIX
}

const map = {
  1: 'I',
  5: 'V',
  10: 'X',
  50: 'L',
  100: 'C',
  500: 'D',
  1000: 'M',
};

String intToRoman(int numer) {
  assert(1 <= numer && numer <= 3999);
  final numerStr = '$numer';
  final listNum = numerStr.split('');

  final listRomanos = List.generate(
    listNum.length,
    (index) => intToRomanFilter(
      numStr: listNum[index],
      multiplicador: pow(10, listNum.length - index - 1),
    ),
  );

  return listRomanos.join('');
}

String intToRomanFilter({int multiplicador, String numStr}) {
  final intParse = int.parse(numStr);
  final numInt = intParse * multiplicador;
  final divisor = 10 * multiplicador;

  var res = 4 * multiplicador;
  if ((numInt - res) % divisor == 0) return map[res / 4] + map[divisor / 2];

  res = 9 * multiplicador;
  if ((numInt - res) % divisor == 0) return map[res / 9] + map[divisor];

  res = 5 * multiplicador;
  if ((numInt - res) % divisor == 0) return map[res];

  if (numInt > res)
    return map[res] +
        List.generate((intParse % 5), (_) => map[multiplicador]).join('');

  return List.generate((intParse % 5), (_) => map[multiplicador]).join('');
}

'''
