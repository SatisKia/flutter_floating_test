import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'main.dart';

FloatingActionButton test1( bool mini ) {
  return FloatingActionButton(
    mini: mini,
    child: const Icon(Icons.flutter_dash),
    tooltip: 'テスト',
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    splashColor: Colors.white,
    onPressed: () {
      debugPrint('onPressed');
    },
  );
}

FloatingActionButton test2() {
  return FloatingActionButton.extended(
    icon: const Icon(Icons.flutter_dash),
    label: const Text('テスト'),
    tooltip: 'テスト',
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    splashColor: Colors.white,
    onPressed: () {
      debugPrint('onPressed');
    },
  );
}

Positioned test3() {
  return Positioned(
    left: 10,
    top: 10,
    child: test1( false ),
  );
}

Positioned test4() {
  return Positioned(
    left: 10,
    top: 10,
    child: test2(),
  );
}

Positioned test5() {
  Widget button1 = ElevatedButton(
    child: const Icon(
        Icons.flutter_dash,
        color: Colors.white
    ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(const CircleBorder(
        side: BorderSide.none,
      )),
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      elevation: MaterialStateProperty.all(8.0),
    ),
    onPressed: () {
      debugPrint('onPressed blue');
    },
  );
  Widget button2 = ElevatedButton(
    child: const Icon(
        Icons.flutter_dash,
        color: Colors.white
    ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(const CircleBorder(
        side: BorderSide.none,
      )),
      backgroundColor: MaterialStateProperty.all(Colors.amber),
      elevation: MaterialStateProperty.all(8.0),
    ),
    onPressed: () {
      debugPrint('onPressed amber');
    },
  );
  Widget button3 = ElevatedButton(
    child: const Icon(
        Icons.flutter_dash,
        color: Colors.white
    ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(const CircleBorder(
        side: BorderSide.none,
      )),
      backgroundColor: MaterialStateProperty.all(Colors.pink),
      elevation: MaterialStateProperty.all(8.0),
    ),
    onPressed: () {
      debugPrint('onPressed pink');
    },
  );

  return Positioned(
    left: 10,
    top: 10,
    child: Column( children: [
      SizedBox(
        width: 50,
        height: 50,
        child: button1,
      ),
      SizedBox(
          height: 10
      ),
      SizedBox(
        width: 50,
        height: 50,
        child: button2,
      ),
      SizedBox(
          height: 10
      ),
      SizedBox(
        width: 50,
        height: 50,
        child: button3,
      ),
    ] ),
  );
}

Positioned test6() {
  return Positioned(
    left: 0,
    top: 0,
    child: Material(
      elevation: 8.0,
      child: Column( children: [
        InkWell(
            onTap: () {
              debugPrint('onTap blue');
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
              child: const Icon(
                  Icons.flutter_dash,
                  color: Colors.white
              ),
            )
        ),
        InkWell(
            onTap: () {
              debugPrint('onTap amber');
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.amber,
              child: const Icon(
                  Icons.flutter_dash,
                  color: Colors.white
              ),
            )
        ),
        InkWell(
            onTap: () {
              debugPrint('onTap pink');
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.pink,
              child: const Icon(
                  Icons.flutter_dash,
                  color: Colors.white
              ),
            )
        ),
      ] ),
    ),
  );
}

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

Positioned test7(bool opacity) {
  Widget button1 = ElevatedButton(
    child: const Icon(
        Icons.flutter_dash,
        color: Colors.white
    ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(const CircleBorder(
        side: BorderSide.none,
      )),
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      elevation: MaterialStateProperty.all(8.0),
    ),
    onPressed: () {
      debugPrint('onPressed blue');
    },
  );
  Widget button2 = ElevatedButton(
    child: const Icon(
        Icons.flutter_dash,
        color: Colors.white
    ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(const CircleBorder(
        side: BorderSide.none,
      )),
      backgroundColor: MaterialStateProperty.all(Colors.amber),
      elevation: MaterialStateProperty.all(8.0),
    ),
    onPressed: () {
      debugPrint('onPressed amber');
    },
  );
  Widget button3 = ElevatedButton(
    child: const Icon(
        Icons.flutter_dash,
        color: Colors.white
    ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(const CircleBorder(
        side: BorderSide.none,
      )),
      backgroundColor: MaterialStateProperty.all(Colors.pink),
      elevation: MaterialStateProperty.all(8.0),
    ),
    onPressed: () {
      debugPrint('onPressed pink');
    },
  );

  if( !opacity ){
    return Positioned(
      left: 10,
      top: 10,
      child: Column( children: [
        SizedBox(
          width: 50,
          height: 50,
          child: slide(
            delay: Duration.zero,
            tween: Tween(begin: -70.0, end: 0.0),
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            child: button1,
          ),
        ),
        SizedBox(
            height: 10
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: slide(
            delay: Duration(milliseconds: 300),
            tween: Tween(begin: -70.0, end: 0.0),
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            child: button2,
          ),
        ),
        SizedBox(
            height: 10
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: slide(
            delay: Duration(milliseconds: 600),
            tween: Tween(begin: -70.0, end: 0.0),
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            child: button3,
          ),
        ),
      ] ),
    );
  } else {
    return Positioned(
      left: 10,
      top: 10,
      child: Column( children: [
        SizedBox(
          width: 50,
          height: 50,
          child: slideWithOpacity(
            delay: Duration.zero,
            translate: Tween(begin: -70.0, end: 0.0),
            curve: Curves.easeOut,
            opacity: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 500),
            child: button1,
          ),
        ),
        SizedBox(
            height: 10
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: slideWithOpacity(
            delay: Duration(milliseconds: 300),
            translate: Tween(begin: -70.0, end: 0.0),
            curve: Curves.easeOut,
            opacity: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 500),
            child: button2,
          ),
        ),
        SizedBox(
            height: 10
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: slideWithOpacity(
            delay: Duration(milliseconds: 600),
            translate: Tween(begin: -70.0, end: 0.0),
            curve: Curves.easeOut,
            opacity: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 500),
            child: button3,
          ),
        ),
      ] ),
    );
  }
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

Widget test8( MyHomePageState state, double contentWidth, double contentHeight, MyCustomAnimationControl? control, bool opacity ) {
  Widget button = SizedBox(
    width: 50,
    height: 50,
    child: ElevatedButton(
      child: const Icon(
          Icons.arrow_upward,
          color: Colors.white
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(const CircleBorder(
          side: BorderSide.none,
        )),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        elevation: MaterialStateProperty.all(8.0),
      ),
      onPressed: () {
        state.scrollTop();
      },
    ),
  );
  if( control!.isInitial() ){
    return Positioned(
        left: contentWidth + 10,
        top: contentHeight - 60,
        child: button
    );
  }
  if( control.isHidden() ){
    // フローティングアクションボタンを隠す
    if( !opacity ){
      return Positioned(
          left: contentWidth + 10,
          top: contentHeight - 60,
          child: slideControl(
            control.getControl(),
            tween: Tween(begin: -70.0, end: 0.0),
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            child: button,
          )
      );
    } else {
      return Positioned(
          left: contentWidth + 10,
          top: contentHeight - 60,
          child: slideControlWithOpacity(
            control.getControl(),
            translate: Tween(begin: -70.0, end: 0.0),
            curve: Curves.easeOut,
            opacity: Tween(begin: 1.0, end: 0.0),
            duration: Duration(milliseconds: 500),
            child: button,
          )
      );
    }
  } else {
    // フローティングアクションボタンを表示させる
    if( !opacity ){
      return Positioned(
          left: contentWidth + 10,
          top: contentHeight - 60,
          child: slideControl(
            control.getControl(),
            tween: Tween(begin: 0.0, end: -70.0),
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            child: button,
          )
      );
    } else {
      return Positioned(
          left: contentWidth + 10,
          top: contentHeight - 60,
          child: slideControlWithOpacity(
            control.getControl(),
            translate: Tween(begin: 0.0, end: -70.0),
            curve: Curves.easeOut,
            opacity: Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 500),
            child: button,
          )
      );
    }
  }
}
