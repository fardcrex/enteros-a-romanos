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
  final listRomanos = List.generate(
    length,
    (index) => intToRomanFilter(
      numStr: listNum[index],
      multiplicador: pow(10, length - index - 1),
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

  if (numInt > res) return map[res] + List.generate((intParse % 5), (_) => map[multiplicador]).join('');

  return List.generate((intParse % 5), (_) => map[multiplicador]).join('');
}
