import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditarReporteScreen extends StatefulWidget {
  final String docId;
  final Map<String, dynamic> data;

  const EditarReporteScreen({super.key, required this.docId, required this.data});

  @override
  State<EditarReporteScreen> createState() => _EditarReporteScreenState();
}

class _EditarReporteScreenState extends State<EditarReporteScreen> {
  late TextEditingController descripcionController;
  late TextEditingController reportanteController;
  late TextEditingController tipoServicioController;

  @override
  void initState() {
    super.initState();
    descripcionController = TextEditingController(text: widget.data['descripcion_servicio']);
    reportanteController = TextEditingController(text: widget.data['reportante']);
    tipoServicioController = TextEditingController(text: widget.data['tipo_servicio']);
  }

  @override
  void dispose() {
    descripcionController.dispose();
    reportanteController.dispose();
    tipoServicioController.dispose();
    super.dispose();
  }

  Future<void> actualizarReporte() async {
    await FirebaseFirestore.instance.collection('reportes').doc(widget.docId).update({
      'descripcion_servicio': descripcionController.text,
      'reportante': reportanteController.text,
      'tipo_servicio': tipoServicioController.text,
    });

    Navigator.pop(context); // Regresa a la pantalla anterior
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reporte actualizado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar reporte')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción del servicio'),
            ),
            TextField(
              controller: reportanteController,
              decoration: const InputDecoration(labelText: 'Reportante'),
            ),
            TextField(
              controller: tipoServicioController,
              decoration: const InputDecoration(labelText: 'Tipo de servicio'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: actualizarReporte,
              child: const Text('Guardar cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
