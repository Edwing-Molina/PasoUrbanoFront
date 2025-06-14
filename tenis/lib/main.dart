import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenis/controller.dart';
import 'package:tenis/pedidos.dart';
import 'productos.dart';
import 'compra.dart';
import 'inventario.dart';
import 'venta.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Controller>(
      create: (context) => Controller(),
      child: MaterialApp(
        title: 'Tienda de tenis',
        theme: ThemeData(),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Controller control = context.watch<Controller>();

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'imagenes/running-shoe.svg',
              width: 32,
              height: 32,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Tienda de tenis"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),

            child: LayoutBuilder(
              builder: (context, constraints) {
                final isCompact = constraints.maxWidth < 700;

                return TabBar(
                  isScrollable: false,
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        control.pedido();
                        break;
                      case 1:
                        control.compra();
                        break;
                      case 2:
                        control.productos();
                        break;
                      case 3:
                        control.venta();
                        break;
                      case 4:
                        control.inventario();
                        break;
                    }
                  },
                  tabs: [
                    Tooltip(
                      message: 'Historial de Pedidos',
                      child: Tab(
                        icon: Icon(Icons.local_shipping),
                        text: isCompact ? null : 'Pedidos',
                      ),
                    ),
                    Tooltip(
                      message: 'Registrar Compra',
                      child: Tab(
                        icon: Icon(Icons.add_shopping_cart_rounded),
                        text: isCompact ? null : 'Compra',
                      ),
                    ),
                    Tooltip(
                      message: 'Agregar Productos',
                      child: Tab(
                        icon: Icon(Icons.add_circle_rounded),
                        text: isCompact ? null : 'Productos',
                      ),
                    ),
                    Tooltip(
                      message: 'Ventas',
                      child: Tab(
                        icon: Icon(Icons.attach_money_rounded),
                        text: isCompact ? null : 'Ventas',
                      ),
                    ),
                    Tooltip(
                      message: 'Inventario',
                      child: Tab(
                        icon: Icon(Icons.inventory_rounded),
                        text: isCompact ? null : 'Inventario',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            switch (control.estados) {
              case Vistas.pedidos:
                return Pedidos();
              case Vistas.compra:
                return Compra();
              case Vistas.inventario:
                return Inventario();
              case Vistas.venta:
                return Venta();
              case Vistas.productos:
                return Productos();
            }
          },
        ),
      ),
    );
  }
}
