import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tenis/cargar_imagen.dart';

class Productos extends StatelessWidget {
  const Productos({super.key});

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
                'Ingresar Productos Al Inventario',
                style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(padding: EdgeInsets.all(28), child: Imputs()),
            ),
            CargarImagen(),
            TextButton(
              onPressed: AlertDialog.new,
              child: Text("Presional bro"),
            ),
          ],
        ),
      ),
    );
  }
}

class Imputs extends StatefulWidget {
  const Imputs({super.key});

  @override
  State<Imputs> createState() => _ImputsState();
}

class _ImputsState extends State<Imputs> {
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
                  labelText: 'Nombre',
                  hintText: 'Ingresa el nombre del Producto',
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
                  labelText: 'Precio',
                  hintText: 'Ingresa el precio del prodcuto',
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
                  labelText: 'Stock',
                  hintText: 'Ingresa el stock del producto',
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
