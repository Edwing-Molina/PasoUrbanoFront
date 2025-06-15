import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pedidos extends StatelessWidget {
  const Pedidos({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Historial de Pedidos',
                style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: ImputsPedido(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImputsPedido extends StatefulWidget {
  const ImputsPedido({super.key});

  @override
  State<ImputsPedido> createState() => _ImpustPedidoState();
}

class _ImpustPedidoState extends State<ImputsPedido> {
  final List<Product> _products = [
    Product(
      id: "1",
      name: "Zapatos Nike Air",
      price: 120.00,
      buyerName: "Juan Pérez",
    ),
    Product(
      id: "2",
      name: "Camiseta Adidas",
      price: 25.50,
      buyerName: "María García",
    ),
    Product(
      id: "3",
      name: "Pantalón Levi's",
      price: 45.99,
      buyerName: "Carlos López",
    ),
  ];

  void _markAsReady(String productId) {
    setState(() {
      // Lógica para actualizar el estado del producto
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Producto $productId marcado como listo")),
      );
    });
  }

  // Función para cancelar
  void _cancelProduct(String productId) {
    setState(() {
      _products.removeWhere((product) => product.id == productId);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Producto $productId cancelado")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final product = _products[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Ícono del producto (puedes reemplazar por una imagen)
                    const Icon(
                      Icons.shopping_bag,
                      size: 40,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 12),
                    // Información del producto
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text("\$${product.price.toStringAsFixed(2)}"),
                          const SizedBox(height: 4),
                          Text(
                            "Comprador: ${product.buyerName}",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    // Botones de acción
                    Column(
                      children: [
                        TextButton.icon(
                          icon: const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.green,
                          ),
                          label: const Text(
                            "Listo",
                            style: TextStyle(color: Colors.green),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          onPressed: () => _markAsReady(product.id),
                        ),
                        TextButton.icon(
                          icon: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.red,
                          ),
                          label: const Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.red),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          onPressed: () => _cancelProduct(product.id),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// Modelo de Producto
class Product {
  final String id;
  final String name;
  final double price;
  final String buyerName;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.buyerName,
  });
}
