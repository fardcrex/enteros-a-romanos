# enteros-a-romanos
Given an integer, convert it to a roman numeral.


puedes probarlo en https://dartpad.dev/ solo copia el código del archivo integer_to_roman.dart.

## solución escalable y con el mapeado mínimo

### solo aumenta los valores para 5 000, 10 000 , etc y modifica el límite de 3999

```
const map = {
  1: 'I',
  5: 'V',
  10: 'X',
  50: 'L',
  100: 'C',
  500: 'D',
  1000: 'M',
};
```
