import 'package:flutter/material.dart';

class RegulationsScreen extends StatelessWidget {
  const RegulationsScreen({super.key});

  static const _items = [
    'Presentación personal y uniforme para ceremonias',
    'Orden de formación para desfiles y actos oficiales',
    'Protocolo de cuidado, traslado y mantenimiento de instrumentos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reglamentos')),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: _items.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Text(
              'Contenido de ejemplo. En esta sección se mostrarán reglamentos '
              'internos y normas de servicio de la banda.',
              style: Theme.of(context).textTheme.titleMedium,
            );
          }

          return Card(
            child: ListTile(
              leading: const Icon(Icons.rule_folder_outlined),
              title: Text(_items[index - 1]),
              subtitle: const Text('Referencia pendiente de documento oficial'),
            ),
          );
        },
      ),
    );
  }
}
