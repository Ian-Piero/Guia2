void main() {
  // Ejemplo 1
  print("Prueba 1: ${intersect([1, 2, 2, 1], [2, 2])}"); // Salida: [2, 2]

  // Ejemplo 2
  print("Prueba 2: ${intersect([4, 9, 5], [9, 4, 9, 8, 4])}"); // Salida: [9, 4]
}

List<int> intersect(List<int> nums1, List<int> nums2) {
  Map<int, int> conteo = {};
  List<int> resultado = [];

  // 1. Llenar el Map con las frecuencias de nums1
  for (int n in nums1) {
    conteo[n] = (conteo[n] ?? 0) + 1;
  }

  // 2. Buscar coincidencias en nums2
  for (int n in nums2) {
    if (conteo.containsKey(n) && conteo[n]! > 0) {
      resultado.add(n);
      // Reducir la frecuencia para no usarlo de más
      conteo[n] = conteo[n]! - 1;
    }
  }

  return resultado;
}
