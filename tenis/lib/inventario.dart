import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inventario extends StatelessWidget {
  const Inventario({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Inventario',
                  style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                width:
                    MediaQuery.of(context).size.width *
                    0.95, // cambia según tu layout
                child: ImputsInventario(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImputsInventario extends StatefulWidget {
  const ImputsInventario({super.key});

  @override
  State<ImputsInventario> createState() => _ImputsInventarioState();
}

class _ImputsInventarioState extends State<ImputsInventario> {
  final TextEditingController tallasController = TextEditingController();
  Tallas? tallaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 5,
      horizontalMargin: 5,
      columns: <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Nombre',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 50,
            child: Text(
              'Color o Estilo',
              style: TextStyle(fontStyle: FontStyle.italic),
              softWrap: true,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Stock',
            style: TextStyle(fontStyle: FontStyle.italic),
            softWrap: true,
          ),
        ),
        DataColumn(
          label: Text('Codigo', style: TextStyle(fontStyle: FontStyle.italic)),
        ),
        DataColumn(
          label: Text('Precio', style: TextStyle(fontStyle: FontStyle.italic)),
        ),
        DataColumn(
          label: SizedBox(
            width: 95,
            child: DropdownMenu<Tallas>(
              dropdownMenuEntries: Tallas.entries,
              initialSelection: Tallas.t20,
              controller: tallasController,
              enableFilter: true,
              requestFocusOnTap: true,
              label: const Text('Talla'),
              onSelected: (Tallas? talla) {
                setState(() {
                  tallaSeleccionada = talla;
                });
              },
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Jordan1')),
            DataCell(Text('Rojo')),
            DataCell(Text('5')),
            DataCell(Text('JD1-20')),
            DataCell(Text("3500")),
            DataCell(Text('20')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Jordan1')),
            DataCell(Text('Rojo')),
            DataCell(Text('5')),
            DataCell(Text('JD1-20')),
            DataCell(Text("3500")),
            DataCell(Text('20')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Jordan1')),
            DataCell(Text('Rojo')),
            DataCell(Text('5')),
            DataCell(Text('JD1-20')),
            DataCell(Text("3500")),
            DataCell(Text('20')),
          ],
        ),
      ],
    );
  }
}

typedef TallasEntry = DropdownMenuEntry<Tallas>;

enum Tallas {
  t20('20'),
  t21('21'),
  t22('22'),
  t23('23');

  const Tallas(this.label);
  final String label;

  static final List<TallasEntry> entries = UnmodifiableListView<TallasEntry>(
    values.map<TallasEntry>(
      (talla) => TallasEntry(value: talla, label: talla.label),
    ),
  );
}
