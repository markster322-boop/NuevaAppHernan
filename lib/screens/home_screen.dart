import 'package:flutter/material.dart';

import 'calendar_screen.dart';
import 'regulations_screen.dart';
import 'sheet_music_screen.dart';

const _institutionalBlue = Color(0xFF1E4E8C);
const _institutionalLightBlue = Color(0xFF6EA8E5);
const _institutionalBackground = Color(0xFFF5F5F5);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _institutionalBackground,
      appBar: AppBar(
        title: const Text('Biblioteca de Banda Militar'),
        centerTitle: true,
        backgroundColor: _institutionalBlue,
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: _institutionalBlue.withValues(alpha: 0.24),
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _institutionalBlue,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _HomeNavigationButton(
                key: const ValueKey('sheetMusicButton'),
                icon: Icons.music_note,
                label: 'Partituras',
                onPressed: () => _openScreen(
                  context,
                  const SheetMusicScreen(),
                ),
              ),
              const SizedBox(height: 16),
              _HomeNavigationButton(
                key: const ValueKey('calendarButton'),
                icon: Icons.calendar_month,
                label: 'Calendario Patriótico',
                onPressed: () => _openScreen(
                  context,
                  const CalendarScreen(),
                ),
              ),
              const SizedBox(height: 16),
              _HomeNavigationButton(
                key: const ValueKey('regulationsButton'),
                icon: Icons.gavel,
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
      style: FilledButton.styleFrom(
        backgroundColor: _institutionalBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed) ||
              states.contains(WidgetState.hovered)) {
            return _institutionalLightBlue.withValues(alpha: 0.18);
          }

          return null;
        }),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 32),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
