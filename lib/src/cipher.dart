typedef AlterCodeUnit = int Function(int codeUnit);

// algorithm used to encode one character
int encodeCodeUnit(int codeUnit) => codeUnit + 1;

// algorithm used to decode one character
int decodeCodeUnit(int codeUnit) => codeUnit - 1;

String alter(String msg, {AlterCodeUnit operation}) =>
  new String.fromCharCodes(msg.codeUnits.map(operation));
