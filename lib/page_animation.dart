import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PageAnimation extends StatefulWidget {
  const PageAnimation({Key? key}) : super(key: key);

  @override
  State<PageAnimation> createState() => _PageAnimationState();
}

class _PageAnimationState extends State<PageAnimation>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Animation<Offset> offsetAni;
  final GestureMultiTapDownCallback onMultiTapDown = (pointer, detail) {
    print('down: $pointer');
  };
  final GestureMultiTapUpCallback onMultiTapUp = (pointer, detail) {
    print('up: $pointer');
  };
  final GestureMultiTapCallback onMultiTap = (pointer) {
    print('tap: $pointer');
  };

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    animation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    )
      ..addListener(() {
        // setState(() {
        //
        // });
      })
      ..addStatusListener((status) {
        // if (status == AnimationStatus.completed) {
        //   controller.reverse();
        // } else if (status == AnimationStatus.dismissed) {
        //   controller.forward();
        // }
      });
    offsetAni = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animation Page',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.reset();
          controller.forward();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: AnimatedBuilder(
              animation: animation,
              builder: (_, a) => SlideTransition(
                position: offsetAni,
                child: Container(
                  height: animation.value,
                  width: animation.value,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          RawGestureDetector(
            gestures: {
              MultiTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                  MultiTapGestureRecognizer>(
                () => MultiTapGestureRecognizer()..onTapDown = onMultiTapDown
                ..onTapUp = onMultiTapUp
                ..onTap = onMultiTap,
                (instance) {},
              ),
            },
            child: Offstage(
              offstage: false,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);
  static final _turnTween = Tween<double>(begin: 0, end: 90);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: RotationTransition(
        // quarterTurns: _turnTween.evaluate(animation),
        // angle: _turnTween.evaluate(animation),
        turns: animation,
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            // margin: const EdgeInsets.symmetric(vertical: 10),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({Key? key}) : super(key: key);

  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
