import 'dart:math' as math;

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;
          final compact = height < 740;
          final tight = height < 660;
          final logoTextSize = tight ? 24.0 : 28.0;
          final logoMarkHeight = tight ? 20.0 : 25.0;
          final titleSize = tight ? 30.0 : (compact ? 33.0 : 36.0);
          final bodySize = tight ? 13.5 : 15.0;
          final buttonHeight = tight ? 50.0 : 58.0;
          final artworkHeight =
              height * (tight ? 0.2 : (compact ? 0.23 : 0.265));

          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              SafeArea(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 430),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width < 360 ? 24 : 32,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height * (tight ? 0.005 : 0.014)),
                          _SolunaLogo(
                            markHeight: logoMarkHeight,
                            textSize: logoTextSize,
                          ),
                          SizedBox(height: height * (tight ? 0.01 : 0.026)),
                          SizedBox(
                            height: artworkHeight,
                            width: math.min(width * 0.78, 320),
                            child: Image.asset(
                              'assets/moon.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Begin your\nquiet ritual',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xff25150f),
                              fontFamily: 'serif',
                              fontSize: titleSize,
                              fontWeight: FontWeight.w700,
                              height: 1.08,
                            ),
                          ),
                          SizedBox(height: compact ? 10 : 16),
                          const _OrnamentDivider(),
                          SizedBox(height: compact ? 14 : 22),
                          Text(
                            'A gentle space for journaling, intentions,\nemotions, and mindful routines.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xff5f5b5c),
                              fontSize: bodySize,
                              height: 1.42,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(flex: 2),
                          _GetStartedButton(height: buttonHeight),
                          SizedBox(height: compact ? 12 : 18),
                          const _LoginPrompt(),
                          SizedBox(height: compact ? 8 : 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SolunaLogo extends StatelessWidget {
  const _SolunaLogo({required this.markHeight, required this.textSize});

  final double markHeight;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: markHeight,
          width: markHeight * 2.05,
          child: const CustomPaint(painter: _SolunaMarkPainter()),
        ),
        SizedBox(height: markHeight < 24 ? 2 : 4),
        Text(
          'Soluna',
          style: TextStyle(
            color: const Color(0xff2b1b16),
            fontFamily: 'serif',
            fontSize: textSize,
            fontWeight: FontWeight.w500,
            shadows: [const Shadow(color: Color(0x8cffffff), blurRadius: 8)],
          ),
        ),
      ],
    );
  }
}

class _OrnamentDivider extends StatelessWidget {
  const _OrnamentDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        children: const [
          Expanded(child: _SoftLine()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: 12,
              width: 12,
              child: CustomPaint(painter: _TinyStarPainter()),
            ),
          ),
          Expanded(child: _SoftLine()),
        ],
      ),
    );
  }
}

class _SoftLine extends StatelessWidget {
  const _SoftLine();

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: const Color(0x33a87a62));
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            colors: [Color(0xffcaa6ff), Color(0xff8d6add)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f8163c8),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: () {},
            child: const Center(
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginPrompt extends StatelessWidget {
  const _LoginPrompt();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(color: Color(0xff696364), fontSize: 14.5, height: 1.2),
        children: [
          TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Log in',
            style: TextStyle(
              color: Color(0xff7a63c9),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SolunaMarkPainter extends CustomPainter {
  const _SolunaMarkPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = const Color(0xff3a241b)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final dot = Paint()
      ..color = const Color(0xff3a241b)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height * 0.63);
    canvas.drawCircle(center, 2.5, dot);

    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: size.width * 0.44,
        height: size.height * 0.72,
      ),
      math.pi * 1.05,
      math.pi * 0.9,
      false,
      line,
    );

    for (var i = -4; i <= 4; i++) {
      final angle = -math.pi / 2 + i * 0.18;
      final start = center + Offset(math.cos(angle), math.sin(angle)) * 8;
      final end = center + Offset(math.cos(angle), math.sin(angle)) * 15;
      canvas.drawLine(start, end, line);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TinyStarPainter extends CustomPainter {
  const _TinyStarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = const Color(0xffa7754d)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(center.dx, 0),
      Offset(center.dx, size.height),
      paint,
    );
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
