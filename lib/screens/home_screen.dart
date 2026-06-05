import 'package:flutter/material.dart';

import 'calendar_screen.dart';
import 'regulations_screen.dart';
import 'sheet_music_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca de Banda Militar'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Consulta el material de apoyo para ensayos, ceremonias y '
                'presentaciones oficiales.',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _HomeNavigationButton(
                key: const ValueKey('sheetMusicButton'),
                icon: Icons.library_music_outlined,
                label: 'Partituras',
                onPressed: () => _openScreen(
                  context,
                  const SheetMusicScreen(),
                ),
              ),
              const SizedBox(height: 16),
              _HomeNavigationButton(
                key: const ValueKey('calendarButton'),
                icon: Icons.event_note_outlined,
                label: 'Calendario Patriótico',
                onPressed: () => _openScreen(
                  context,
                  const CalendarScreen(),
                ),
              ),
              const SizedBox(height: 16),
              _HomeNavigationButton(
                key: const ValueKey('regulationsButton'),
                icon: Icons.gavel_outlined,
                label: 'Reglamentos',
                onPressed: () => _openScreen(
                  context,
                  const RegulationsScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _openScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => screen),
    );
  }
}

class _HomeNavigationButton extends StatelessWidget {
  const _HomeNavigationButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 32),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
