import 'package:flutter/cupertino.dart';
import 'package:simple_animations/simple_animations.dart';

Widget slide({required Widget child, required Duration delay, required Tween<double> tween, required Curve curve, required Duration duration}) {
  return PlayAnimation<double>(
    delay: delay,
    tween: tween,
    curve: curve,
    duration: duration,
    child: child,
    builder: (context, child, value) => Transform.translate(
        offset: Offset(value, 0.0),
        child: child
    ),
  );
}

Widget slideWithOpacity({required Widget child, required Duration delay, required Tween<double> translate, required Curve curve, required Tween<double> opacity, required Duration duration}) {
  MultiTween<String> tween = MultiTween<String>();
  tween.add('translate', translate, duration, curve);
  tween.add('opacity', opacity, duration);

  return PlayAnimation<MultiTweenValues<String>>(
    delay: delay,
    tween: tween,
    duration: tween.duration,
    child: child,
    builder: (context, child, value) => Transform.translate(
      offset: Offset(value.get('translate'), 0.0),
      child: Opacity(
          opacity: value.get('opacity'),
          child: child
      ),
    ),
  );
}

Widget slideControl(CustomAnimationControl control, {required Widget child, required Tween<double> tween, required Curve curve, required Duration duration}) {
  return CustomAnimation<double>(
    control: control,
    tween: tween,
    curve: curve,
    duration: duration,
    child: child,
    builder: (context, child, value) => Transform.translate(
        offset: Offset(value, 0.0),
        child: child
    ),
  );
}

Widget slideControlWithOpacity(CustomAnimationControl control, {required Widget child, required Tween<double> translate, required Curve curve, required Tween<double> opacity, required Duration duration}) {
  MultiTween<String> tween = MultiTween<String>();
  tween.add('translate', translate, duration, curve);
  tween.add('opacity', opacity, duration);

  return CustomAnimation<MultiTweenValues<String>>(
    control: control,
    tween: tween,
    duration: tween.duration,
    child: child,
    builder: (context, child, value) => Transform.translate(
      offset: Offset(value.get('translate'), 0.0),
      child: Opacity(
          opacity: value.get('opacity'),
          child: child
      ),
    ),
  );
}

// スライドボタンの状態管理クラス
class MyCustomAnimationControl {
  Function(void Function()) setState;
  bool hidden;
  MyCustomAnimationControl({required this.setState, required this.hidden});

  CustomAnimationControl? _control;
  CustomAnimationControl getControl(){
    return _control!;
  }

  bool isInitial(){
    return _control == null;
  }
  bool isHidden(){
    return hidden;
  }
  void show(){
    if( hidden ) {
      hidden = false;
      setState(() {
        _control = CustomAnimationControl.playFromStart;
      });
    }
  }
  void hide(){
    if( !hidden ) {
      hidden = true;
      setState(() {
        _control = CustomAnimationControl.playFromStart;
      });
    }
  }
}
