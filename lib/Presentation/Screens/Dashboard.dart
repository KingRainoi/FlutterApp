import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Importa el paquete fl_chart

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Simulación de datos para el gráfico
  final List<double> data = [25, 15, 30, 20, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Register"),
      ),
      body: Center(
        child: FutureBuilder(
          // Suponiendo que estás obteniendo los datos de alguna fuente asíncrona
          future:
              fetchData(), // Reemplaza 'fetchData()' con tu función para obtener datos
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Usar un PieChart con los datos obtenidos o simulados
              return PieChart(
                PieChartData(
                  sections: List.generate(data.length, (i) {
                    return PieChartSectionData(
                      value: data[i],
                      color: getRandomColor(),
                      title:
                          '${data[i]}%', // Opcional: muestra los valores en el gráfico
                    );
                  }),
                ),
                swapAnimationDuration: const Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              );
            }
          },
        ),
      ),
    );
  }

  // Simula una función para obtener datos asíncronos
  Future<void> fetchData() async {
    // Simulación de retraso de 2 segundos para obtener datos
    await Future.delayed(Duration(seconds: 2));
    // Puedes implementar aquí la lógica para obtener los datos reales
  }

  // Método para obtener colores aleatorios para las secciones del gráfico
  Color getRandomColor() {
    return Color.fromRGBO(
      255,
      (DateTime.now().millisecond * DateTime.now().microsecond) % 255,
      (DateTime.now().millisecond * DateTime.now().microsecond) % 255,
      1,
    );
  }
}
