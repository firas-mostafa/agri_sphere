import 'dart:math';

import 'package:flutter/material.dart';

class FallingDots extends StatefulWidget {
  final int count;
  const FallingDots({super.key, this.count = 20});
  @override
  // ignore: library_private_types_in_public_api
  _FallingDotsState createState() => _FallingDotsState();
}

class _FallingDotsState extends State<FallingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Dot> _dots;
  final Random _rnd = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    const lanes = 6;
    _dots = List.generate(
      widget.count,
      (i) => _Dot(
        delay: _rnd.nextDouble(),
        size: _rnd.nextDouble() * 20 + 6,
        lane: _rnd.nextInt(lanes),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).colorScheme.primary;
    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;
          return Stack(
            children: List.generate(_dots.length, (i) {
              final dot = _dots[i];
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final t = (_controller.value + dot.delay) % 1.0;
                  const lanes = 6;
                  final laneOffsetY = (dot.lane / lanes) * h;
                  final laneOffsetX = (dot.lane / (lanes * 3)) * w;
                  final x = (t * w + laneOffsetX) % w;
                  final y = (t * h + laneOffsetY) % h;
                  final opacity = (0.15 + (1.0 - t) * 0.85).clamp(0.0, 1.0);
                  return Positioned(
                    left: x,
                    top: y,
                    child: Opacity(
                      opacity: opacity,
                      child: Container(
                        width: dot.size,
                        height: dot.size,
                        decoration: BoxDecoration(
                          color: baseColor.withAlpha((opacity * 100).toInt()),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          );
        },
      ),
    );
  }
}

class _Dot {
  final double delay;
  final double size;
  final int lane;
  _Dot({required this.delay, required this.size, required this.lane});
}
