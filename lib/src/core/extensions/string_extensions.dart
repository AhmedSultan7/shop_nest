part of 'extensions.dart';

extension StringExtenstions on String? {
  int toInt() {
    return int.parse(this!);
  }

  int? toIntOrNull() {
    return int.tryParse(this ?? '0');
  }

  num? toNum() {
    return num.tryParse(this!);
  }

  num toNumOrZero() {
    return num.tryParse(this ?? '0') ?? 0;
  }
}
