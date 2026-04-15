void main() {
  // Ejemplo 1
  print("Resultado Ejemplo 1: ${contarFrutasSinColocar([4, 2, 5], [3, 5, 4])}"); // Salida: 1

  // Ejemplo 2
  print("Resultado Ejemplo 2: ${contarFrutasSinColocar([3, 6, 1], [6, 4, 7])}"); // Salida: 0
}

int contarFrutasSinColocar(List<int> frutas, List<int> cestas) {
  int n = frutas.length;
  // Conjunto para guardar los índices de las cestas que ya están ocupadas
  Set<int> cestasOcupadas = {};
  int frutasColocadas = 0;

  for (int i = 0; i < n; i++) {
    int cantidadFruta = frutas[i];
    
    // Buscar la cesta más a la izquierda disponible
    for (int j = 0; j < n; j++) {
      if (!cestasOcupadas.contains(j) && cestas[j] >= cantidadFruta) {
        // Encontramos cesta: la marcamos y salimos del bucle interno
        cestasOcupadas.add(j);
        frutasColocadas++;
        break; 
      }
    }
  }

  // Las que quedaron sin colocar son el total menos las colocadas
  return n - frutasColocadas;
}
