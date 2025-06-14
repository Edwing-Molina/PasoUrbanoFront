import 'package:flutter/material.dart';

enum Vistas { inventario, compra, venta, productos, pedidos }

class Controller extends ChangeNotifier {
  Vistas estados = Vistas.pedidos;

  void inventario() {
    estados = Vistas.inventario;
    notifyListeners();
  }

  void compra() {
    estados = Vistas.compra;
    notifyListeners();
  }

  void productos() {
    estados = Vistas.productos;
    notifyListeners();
  }

  void venta() {
    estados = Vistas.venta;
    notifyListeners();
  }

  void pedido() {
    estados = Vistas.pedidos;
    notifyListeners();
  }
}
