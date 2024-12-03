import 'package:flutter/material.dart';

class ScreenWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header with home icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.blue[600]),
                      onPressed: () {
                        // Agrega la lógica de navegación al home si es necesario
                      },
                    ),
                  ],
                ),
                SizedBox(height: 24),
                // Main title
                Text(
                  'Teorema de Pitágoras',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                // Grid of smaller cards
                GridView.count(
                  crossAxisCount: 2, // Número de columnas
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12, // Espaciado vertical entre tarjetas
                  crossAxisSpacing: 12, // Espaciado horizontal entre tarjetas
                  children: [
                    _buildInfoCard(Icons.person, 'Desarrollado por:', 'Jeanhela Nazate'),
                    _buildInfoCard(Icons.book, 'NRC:', '2509'),
                    _buildInfoCard(Icons.edit, 'Examen Parcial 1', ''),
                    _buildInfoCard(Icons.school, 'UFA-ESPE', ''),
                  ],
                ),
                SizedBox(height: 32),
                // Button
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Ejercicio 2',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // Agrega la lógica de navegación aquí
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String subtitle) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 100, // Altura máxima de las tarjetas
        maxWidth: 160,  // Anchura máxima de las tarjetas
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.blue[100]!, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.blue[600], size: 24),
              ),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14, // Tamaño del texto más pequeño
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
                textAlign: TextAlign.center,
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12, // Tamaño del subtítulo más pequeño
                    color: Colors.blue[700],
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
