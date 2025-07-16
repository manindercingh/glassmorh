import 'package:flutter/material.dart';

class GlossySplashButton extends StatefulWidget {
  const GlossySplashButton({super.key});

  @override
  State<GlossySplashButton> createState() => _GlossySplashButtonState();
}

class _GlossySplashButtonState extends State<GlossySplashButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  Offset? _tapPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _startSplash(Offset globalPosition) {
    final renderBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = renderBox.globalToLocal(globalPosition);
    });
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _startSplash(details.globalPosition),
      onTap: () => debugPrint("Glossy button tapped!"),
      child: CustomPaint(
        painter: GlossySplashPainter(
          animation: _animation,
          tapPosition: _tapPosition,
        ),
        child: Container(
          width: 200,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "Glossy Button",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class GlossySplashPainter extends CustomPainter {
  final Animation<double> animation;
  final Offset? tapPosition;

  GlossySplashPainter({required this.animation, required this.tapPosition})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    if (tapPosition == null) return;

    final paint = Paint()
      ..shader =
      RadialGradient(
        colors: [
          Colors.white.withOpacity(0.3),
          Colors.blueAccent.withOpacity(0.0),
        ],
        stops: const [0.0, 1.0],
      ).createShader(
        Rect.fromCircle(
          center: tapPosition!,
          radius: animation.value * 150,
        ),
      );

    canvas.drawCircle(tapPosition!, animation.value * 150, paint);
  }

  @override
  bool shouldRepaint(covariant GlossySplashPainter oldDelegate) {
    return true;
  }
}