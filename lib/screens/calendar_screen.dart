import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  static const _events = [
    _PatrioticEvent(
      '21 de mayo',
      'Ceremonia conmemorativa y repertorio protocolar',
    ),
    _PatrioticEvent('18 de septiembre', 'Presentación de marchas patrióticas'),
    _PatrioticEvent('19 de septiembre', 'Apoyo musical para desfile oficial'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendario Patriótico')),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: _events.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Text(
              'Fechas de ejemplo para organizar ensayos, ceremonias y '
              'servicios musicales de la banda.',
              style: Theme.of(context).textTheme.titleMedium,
            );
          }

          final event = _events[index - 1];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.flag_outlined),
              title: Text(event.date),
              subtitle: Text(event.description),
            ),
          );
        },
      ),
    );
  }
}

class _PatrioticEvent {
  const _PatrioticEvent(this.date, this.description);

  final String date;
  final String description;
}
