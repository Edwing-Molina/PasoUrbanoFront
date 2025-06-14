import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CargarImagen extends StatefulWidget {
  const CargarImagen({super.key});

  @override
  State<CargarImagen> createState() => _CargarImagenState();
}

class _CargarImagenState extends State<CargarImagen> {
  Uint8List? _imagenBytes;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _urlController = TextEditingController();

  Future<void> _seleccionarImagen(ImageSource origen) async {
    final XFile? archivo = await _picker.pickImage(source: origen);
    if (archivo != null) {
      final bytes = await archivo.readAsBytes();
      setState(() {
        _imagenBytes = bytes;
      });
    }
  }

  Future<void> _cargarDesdeUrl(String url) async {
    try {
      final respuesta = await http.get(Uri.parse(url));
      if (respuesta.statusCode == 200) {
        setState(() {
          _imagenBytes = respuesta.bodyBytes;
        });
      } else {
        _mostrarError("No se pudo cargar la imagen desde la URL.");
      }
    } catch (e) {
      _mostrarError("URL inválida o sin conexión.");
    }
  }

  void _mostrarError(String mensaje) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () => _seleccionarImagen(ImageSource.gallery),
          icon: Icon(Icons.photo_library),
          label: Text('Subir Imagen'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _urlController,
                  decoration: InputDecoration(
                    labelText: 'URL de imagen',
                    hintText: 'Ingresa la URL de la imagen del producto',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _cargarDesdeUrl(_urlController.text),
                child: Text("Cargar"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        if (_imagenBytes != null)
          Image.memory(
            _imagenBytes!,
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          )
        else
          Text('No se ha seleccionado ninguna imagen'),
      ],
    );
  }
}
