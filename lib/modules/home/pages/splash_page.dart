import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/theme/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const List<String> _phrases = [
    'Building Reliable Systems in High-Stakes Environments.',
    'Systems that scale. People that trust.',
    'Engineering with intent.',
    'Leading Through Architecture.',
    'Design First. Scale Always.',
    'Turning Complexity into Reliable Systems.',
    'Engineering by Day. Cultivating by Nature.',
    'Grounded. Relentless. Technical.',
  ];

  // 65 ms per character feels natural — fast enough to not drag, slow enough to read.
  static const _typingInterval = Duration(milliseconds: 65);
  // 420 ms per toggle → 2 full on/off blinks = 4 toggles before navigating.
  static const _blinkInterval  = Duration(milliseconds: 420);
  static const _blinkCycles    = 4;

  late final String _phrase;
  String _displayed = '';
  bool   _cursorVisible = true;
  int    _charIndex     = 0;
  int    _blinkCount    = 0;

  Timer? _typingTimer;
  Timer? _blinkTimer;

  @override
  void initState() {
    super.initState();
    _phrase = _phrases[Random().nextInt(_phrases.length)];
    _startTyping();
  }

  void _startTyping() {
    _typingTimer = Timer.periodic(_typingInterval, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_charIndex >= _phrase.length) {
        timer.cancel();
        _startBlinking();
        return;
      }
      setState(() => _displayed = _phrase.substring(0, ++_charIndex));
    });
  }

  void _startBlinking() {
    _blinkTimer = Timer.periodic(_blinkInterval, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() => _cursorVisible = !_cursorVisible);
      _blinkCount++;
      if (_blinkCount >= _blinkCycles) {
        timer.cancel();
        Modular.to.pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _blinkTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 12% side padding keeps long phrases readable on all screen sizes.
    final hPad = MediaQuery.sizeOf(context).width * 0.12;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hPad),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: _displayed),
                // Cursor: visible underscore or fixed-width space to prevent layout shift.
                TextSpan(text: _cursorVisible ? '_' : ' '),
              ],
            ),
            style: AppTextStyles.sectionTitleBold.copyWith(
              fontFamily: 'Courier New',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
