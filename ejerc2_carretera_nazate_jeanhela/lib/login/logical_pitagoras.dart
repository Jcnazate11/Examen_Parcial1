import 'dart:math';

class Pitagoras {
  // Método para calcular la distancia euclidiana entre dos puntos
  double calcularDistancia(double x1, double y1, double x2, double y2) {
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }
}
