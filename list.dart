class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void main() {
  print("--- Ejecutando Pruebas ---");

  // Ejemplo 1: lista1 = [1,2,4], lista2 = [1,3,4]
  ListNode? l1_ex1 = crearLista([1, 2, 4]);
  ListNode? l2_ex1 = crearLista([1, 3, 4]);
  print("Prueba 1: [1,2,4] + [1,3,4]");
  imprimirLista(mergeTwoLists(l1_ex1, l2_ex1));

  // Ejemplo 2: lista1 = [], lista2 = []
  print("\nPrueba 2: [] + []");
  imprimirLista(mergeTwoLists(null, null));

  // Ejemplo 3: lista1 = [], lista2 = [0]
  ListNode? l2_ex3 = crearLista([0]);
  print("\nPrueba 3: [] + [0]");
  imprimirLista(mergeTwoLists(null, l2_ex3));
}

/// Lógica principal del algoritmo
ListNode? mergeTwoLists(ListNode? lista1, ListNode? lista2) {
  ListNode dummy = ListNode(-1);
  ListNode actual = dummy;

  while (lista1 != null && lista2 != null) {
    if (lista1.val <= lista2.val) {
      actual.next = lista1;
      lista1 = lista1.next;
    } else {
      actual.next = lista2;
      lista2 = lista2.next;
    }
    actual = actual.next!;
  }

  actual.next = lista1 ?? lista2;
  return dummy.next;
}

// --- Funciones Auxiliares para las pruebas ---

/// Convierte un Array en una Lista Enlazada
ListNode? crearLista(List<int> valores) {
  if (valores.isEmpty) return null;
  ListNode dummy = ListNode(-1);
  ListNode actual = dummy;
  for (int v in valores) {
    actual.next = ListNode(v);
    actual = actual.next!;
  }
  return dummy.next;
}

/// Imprime la lista en formato legible
void imprimirLista(ListNode? nodo) {
  if (nodo == null) {
    print("Salida: []");
    return;
  }
  List<int> resultado = [];
  while (nodo != null) {
    resultado.add(nodo.val);
    nodo = nodo.next;
  }
  print("Salida: $resultado");
}
