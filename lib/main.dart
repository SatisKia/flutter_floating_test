import 'package:flutter/material.dart';

import 'test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  double contentWidth  = 0.0;
  double contentHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    contentWidth  = MediaQuery.of( context ).size.width;
    contentHeight = MediaQuery.of( context ).size.height - MediaQuery.of( context ).padding.top - MediaQuery.of( context ).padding.bottom;

    Widget body = Container(
      width: contentWidth,
      height: contentHeight,
      color: Colors.black12,
    );

    bool positioned = false;

    if( !positioned ) {
      // フローティングアクションボタンの位置
      FloatingActionButtonLocation floatingLocation = FloatingActionButtonLocation.endFloat;
      bool mini = false;
      switch( floatingLocation ){
        case FloatingActionButtonLocation.miniCenterDocked:
        case FloatingActionButtonLocation.miniCenterFloat:
        case FloatingActionButtonLocation.miniCenterTop:
        case FloatingActionButtonLocation.miniEndDocked:
        case FloatingActionButtonLocation.miniEndFloat:
        case FloatingActionButtonLocation.miniEndTop:
        case FloatingActionButtonLocation.miniStartDocked:
        case FloatingActionButtonLocation.miniStartFloat:
        case FloatingActionButtonLocation.miniStartTop:
          mini = true;
      }

      FloatingActionButton floating = test1( mini );
//      FloatingActionButton floating = test2();

      return Scaffold(
        appBar: AppBar(
            toolbarHeight: 0
        ),
        body: body,
        floatingActionButton: floating,
        floatingActionButtonLocation: floatingLocation,
      );
    } else {
      Widget floating = test3();
//      Widget floating = test4();
//      Widget floating = test5();
//      Widget floating = test6();

      return Scaffold(
        appBar: AppBar(
            toolbarHeight: 0
        ),
        body: Stack( children: [
          body,
          floating,
        ] ),
      );
    }
  }
}
