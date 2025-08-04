import 'package:flutter/material.dart';
import 'EditarReporteScreen.dart';

class ReporteDetalleScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  final String docId;

  const ReporteDetalleScreen({
    Key? key,
    required this.data,
    required this.docId,
  }) : super(key: key);

  Widget buildInfoTile(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value.isNotEmpty ? value : 'Sin información'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fecha = data['fecha_reporte']?.toString().split('T').first ?? 'Sin fecha';

    return Scaffold(
      appBar: AppBar(
        title: Text('Reporte del $fecha'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarReporteScreen(
                    docId: docId,
                    data: data,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children:

        /*
        [
          buildInfoTile(Icons.local_activity, 'Tipo de servicio', data['tipo_servicio'] ?? ''),
          buildInfoTile(Icons.description, 'Descripción del servicio', data['descripcion_servicio'] ?? ''),
          buildInfoTile(Icons.person, 'Reportante', data['reportante'] ?? ''),
          buildInfoTile(Icons.location_city, 'Ciudad', data['ciudad'] ?? ''),
          buildInfoTile(Icons.house, 'Colonia', data['colonia'] ?? ''),
          buildInfoTile(Icons.aod, 'Carretera', data['carretera'] ?? ''),
          buildInfoTile(Icons.directions_car, 'Unidad', data['unidad'] ?? ''),
          buildInfoTile(Icons.person_pin, 'Operador', data['operador'] ?? ''),
          buildInfoTile(Icons.notes, 'Observaciones', data['observaciones'] ?? ''),
          const SizedBox(height: 10),
        ],

         */

        [
          const Text('Información general',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildInfoTile(Icons.local_activity, 'Tipo de servicio', data['tipo_servicio']),
          buildInfoTile(Icons.description, 'Descripción del servicio', data['descripcion_servicio']),
          buildInfoTile(Icons.phone,'Tipo de llamada', data['tipo_llamada']),
          buildInfoTile(Icons.cast, 'Medio', data['medio']),

          const SizedBox(height: 10),
          const Text('Ubicación',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildInfoTile(Icons.location_city, 'Ciudad', data['ciudad']),
          buildInfoTile(Icons.house, 'Colonia', data['colonia']),
          buildInfoTile(Icons.villa, 'Comunidad', data['comunidad']),
          buildInfoTile( Icons.aod, 'Carretera', data['carretera']),
          buildInfoTile(Icons.map, 'Dirección', data['direccion']),
          buildInfoTile(Icons.place, 'Descripción del lugar', data['descripcion_lugar']),
          buildInfoTile(Icons.navigation, 'Coordenadas N', data['coordenadas_n']),
          buildInfoTile(Icons.navigation, 'Coordenadas W', data['coordenadas_w']),

          const SizedBox(height: 10),
          const Text('Horarios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildInfoTile(Icons.access_time, 'Hora del reporte', data['hr_reporte']),
          buildInfoTile(Icons.access_time, 'Hora salida base', data['hr_salida_base']),
          buildInfoTile(Icons.access_time, 'Hora llegada a escena', data['hr_arribo']),
          buildInfoTile(Icons.access_time, 'Hora salida de escena', data['hr_salida_escena']),
          buildInfoTile(Icons.access_time, 'Hora llegada a base', data['hr_llegada_base']),
          buildInfoTile(Icons.access_time, 'Hora unidad disponible', data['hr_unidad_disponible']),

          const SizedBox(height: 10),
          const Text('Unidad y personal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildInfoTile(Icons.directions_car, 'Unidad', data['unidad']),
          buildInfoTile(Icons.directions_car, 'Operador', data['operador']),
          buildInfoTile(Icons.directions_car, 'Elabora', data['elabora']),
          buildInfoTile(Icons.directions_car, 'Jefe de servicio', data['jefe_servicio']),
          buildInfoTile(Icons.directions_car, 'Guardia', data['guardia']),
          buildInfoTile(Icons.directions_car, 'Función', data['funcion']),

          const SizedBox(height: 10),
          const Text('Reportante',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildInfoTile(Icons.account_circle_rounded ,'Reportante', data['reportante']),
          buildInfoTile(Icons.account_circle_rounded, 'Teléfono', data['telefono']),
          buildInfoTile(Icons.account_circle_rounded, 'Solicitado por', data['solicitado_por']),
          buildInfoTile(Icons.account_circle_rounded, 'Nombre del afectado', data['nombre_afectado']),
          buildInfoTile(Icons.account_circle_rounded, 'Destino', data['destino']),
          buildInfoTile(Icons.account_circle_rounded, 'Razón social', data['razon_social']),

          const SizedBox(height: 10),
          const Text('Detalles adicionales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildInfoTile(Icons.account_circle_rounded, 'Acciones', data['acciones']),
          buildInfoTile(Icons.account_circle_rounded, 'Material', data['material']),
          buildInfoTile(Icons.account_circle_rounded, 'Especificaciones', data['especifica']),
          buildInfoTile(Icons.account_circle_rounded, 'Observaciones', data['observaciones']),
          buildInfoTile(Icons.account_circle_rounded, 'Kilometraje', 'Salida: ${data['km_salida']}, Llegada: ${data['km_llegada']}, Total: ${data['km']}'),

          const SizedBox(height: 10),
          const Text('Datos administrativos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildInfoTile(Icons.account_circle_rounded, 'Folio año', data['folio_ano']),
          buildInfoTile(Icons.account_circle_rounded, 'Folio C4', data['folio_c4']),
          buildInfoTile(Icons.local_activity, 'Tipo de servicio', data['tipo_servicio']?.toString() ?? ''),

          const SizedBox(height: 10),
          const Text('Estado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildInfoTile(Icons.cancel, 'Cancelado', data['cancelado'] == true ? 'Sí' : 'No'),
          buildInfoTile(Icons.warning_amber,'Falsa alarma', data['falsa_alarma'] == true ? 'Sí' : 'No'),
        ],
      ),
    );
  }
}
