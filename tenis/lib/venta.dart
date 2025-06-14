import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Venta extends StatelessWidget {
  const Venta({super.key});

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
                'Historial de Ventas',
                style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: ImputsVenta(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImputsVenta extends StatefulWidget {
  const ImputsVenta({super.key});

  @override
  State<ImputsVenta> createState() => _ImputsVentaState();
}

class _ImputsVentaState extends State<ImputsVenta> {
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
