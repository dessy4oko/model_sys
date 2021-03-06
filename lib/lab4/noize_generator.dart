import 'dart:math';

abstract class NoizeGenerator {
  static generate(int amount, [int? seed]) {
    final noize = <double>[];
    final random = Random(seed);
    for (var i = 0; i < amount; i++) {
      noize.add(random.nextDouble() - .5);
    }
    return noize;
  }

  static List<double> generateNormalized(int amount, [int? seed]) {
    final noize = List<double>.filled(amount, 0);
    final random = Random();
    double v1 = 0;
    double v2 = 0;
    double s = 2;
    for (var i = 0; i < amount - 2; i += 2) {
      do {
        v1 = random.nextDouble() * 2 - 1;
        v2 = random.nextDouble() * 2 - 1;
        s = pow(v1, 2).toDouble() + pow(v2, 2).toDouble();
      } while (s > 1);
      double r = sqrt(-2 * log(s) / s);
      noize[i] = v1 * r;
      noize[i + 1] = v2 * r;
    }
    return noize;
  }
}
