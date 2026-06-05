import 'package:flutter/material.dart';

class SheetMusicScreen extends StatelessWidget {
  const SheetMusicScreen({super.key});

  static const _examples = [
    'Himno Nacional - Versión para banda',
    'Marcha de Honor - Trompetas y percusión',
    'Toque de Diana - Ensamble ceremonial',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Partituras')),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: _examples.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Text(
              'Contenido de ejemplo. Aquí se listarán partituras y arreglos '
              'musicales cuando se integren los documentos reales.',
              style: Theme.of(context).textTheme.titleMedium,
            );
          }

          final title = _examples[index - 1];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.music_note_outlined),
              title: Text(title),
              subtitle: const Text('Documento pendiente de integración'),
            ),
          );
        },
      ),
    );
  }
}
