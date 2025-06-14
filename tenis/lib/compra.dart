import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Compra extends StatelessWidget {
  const Compra({super.key});

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
                'Venta Manual',
                style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(28),
                child: ImputsCompra(),
              ),
            ),
            TextButton(
              onPressed: AlertDialog.new,
              child: Text("Confirmar Compra"),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Text('Total de la compra:'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImputsCompra extends StatefulWidget {
  const ImputsCompra({super.key});

  @override
  State<ImputsCompra> createState() => _ImputsCompraState();
}

class _ImputsCompraState extends State<ImputsCompra> {
  final imputsKey = GlobalKey<FormState>();
  final double pad = 10;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: imputsKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(pad),
            child: SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre o numero(Opcional)',
                  hintText:
                      'Ingresa el nombre o numero del cliente de ser necesario',
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(),
                ),
                //validator: ,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(pad),
            child: SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingresa el nombre del producto',
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(pad),
            child: SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Codigo',
                  hintText: 'Ingresa el codigo del producto',
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(pad),
            child: SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Talla',
                  hintText: 'Ingresa la talla',
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(pad),
            child: SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Color o Estilo',
                  hintText: 'Ingresa el color o estilo del producto',
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(pad),
            child: SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cantidad',
                  hintText: 'Ingresa la cantidad de productos a comprar',
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
