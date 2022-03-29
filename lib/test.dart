import 'package:flutter/material.dart';

import 'main.dart';
import 'utility.dart';
import 'widget.dart';

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
  Widget button1 = MyFloatingActionButton(
    Icons.flutter_dash,
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    elevation: 8.0,
    onPressed: () {
      debugPrint('onPressed blue');
    },
  );
  Widget button2 = MyFloatingActionButton(
    Icons.flutter_dash,
    foregroundColor: Colors.white,
    backgroundColor: Colors.amber,
    elevation: 8.0,
    onPressed: () {
      debugPrint('onPressed amber');
    },
  );
  Widget button3 = MyFloatingActionButton(
    Icons.flutter_dash,
    foregroundColor: Colors.white,
    backgroundColor: Colors.pink,
    elevation: 8.0,
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

Positioned test7(bool opacity) {
  Widget button1 = MyFloatingActionButton(
    Icons.flutter_dash,
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    elevation: 8.0,
    onPressed: () {
      debugPrint('onPressed blue');
    },
  );
  Widget button2 = MyFloatingActionButton(
    Icons.flutter_dash,
    foregroundColor: Colors.white,
    backgroundColor: Colors.amber,
    elevation: 8.0,
    onPressed: () {
      debugPrint('onPressed amber');
    },
  );
  Widget button3 = MyFloatingActionButton(
    Icons.flutter_dash,
    foregroundColor: Colors.white,
    backgroundColor: Colors.pink,
    elevation: 8.0,
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

Widget test8( MyHomePageState state, MyCustomAnimationControl? control, double contentWidth, double contentHeight, bool opacity ) {
  Widget button = SizedBox(
    width: 50,
    height: 50,
    child: MyFloatingActionButton(
      Icons.arrow_upward,
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
  } else if( control.isHidden() ){
    // スライドボタンを隠す
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
    // スライドボタンを表示させる
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
