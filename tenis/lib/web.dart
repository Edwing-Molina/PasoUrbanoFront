import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenis/controller.dart';

class MobileOrWeb extends StatelessWidget {
  const MobileOrWeb({super.key});

  @override
  Widget build(BuildContext context) {
    Controller control = context.watch<Controller>();
    if (kIsWeb) {
      return PreferredSize(
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
      );
    } else {
      return;
    }
  }
}
