import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../login/logical_pitagoras.dart'; // Importamos la lógica

class ScreenPitagoras extends StatefulWidget {
  @override
  _ScreenPitagorasState createState() => _ScreenPitagorasState();
}

class _ScreenPitagorasState extends State<ScreenPitagoras> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _coord1XController = TextEditingController();
  final TextEditingController _coord1YController = TextEditingController();
  final TextEditingController _coord2XController = TextEditingController();
  final TextEditingController _coord2YController = TextEditingController();
  double? _distancia;
  final Pitagoras _pitagoras = Pitagoras(); // Instancia de la lógica

  void _calcularDistancia() {
    if (_formKey.currentState!.validate()) {
      double x1 = double.parse(_coord1XController.text);
      double y1 = double.parse(_coord1YController.text);
      double x2 = double.parse(_coord2XController.text);
      double y2 = double.parse(_coord2YController.text);

      setState(() {
        _distancia = _pitagoras.calcularDistancia(x1, y1, x2, y2);
      });
    }
  }

  void _limpiarResultado() {
    setState(() {
      _coord1XController.clear();
      _coord1YController.clear();
      _coord2XController.clear();
      _coord2YController.clear();
      _distancia = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teorema de Pitágoras',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.house, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade600, Colors.cyan.shade300],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _buildCoordinateInput(
                          'Coordenada 1',
                          _coord1XController,
                          _coord1YController,
                        ),
                        SizedBox(height: 16),
                        _buildCoordinateInput(
                          'Coordenada 2',
                          _coord2XController,
                          _coord2YController,
                        ),
                        SizedBox(height: 24),
                        ElevatedButton.icon(
                          icon: Icon(FontAwesomeIcons.calculator),
                          label: Text('Calcular Distancia'),
                          onPressed: _calcularDistancia,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Color del botón
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton.icon(
                          icon: Icon(FontAwesomeIcons.trashAlt),
                          label: Text('Limpiar Resultado'),
                          onPressed: _limpiarResultado,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan, // Color del botón
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        if (_distancia != null)
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'La distancia es: ${_distancia!.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoordinateInput(
      String label, TextEditingController xController, TextEditingController yController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(FontAwesomeIcons.mapMarkerAlt, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: xController,
                decoration: InputDecoration(
                  labelText: 'X',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un número válido';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingrese un número válido';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: yController,
                decoration: InputDecoration(
                  labelText: 'Y',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un número válido';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingrese un número válido';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
