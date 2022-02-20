import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

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
  State createState() => MyHomePageState();
}

class MyHomePageState extends State {
  double contentWidth  = 0.0;
  double contentHeight = 0.0;

  // フローティングアクションボタンの状態管理クラス
  MyCustomAnimationControl? hogeSlideButtonControl;

  ScrollController? hogeScrollController;
  double hogeScroll = 0.0; // 現在のスクロール位置
  double maxHogeScroll = 0.0; // スクロールできる最大の位置
  void onHogeScroll(){
    hogeScroll = hogeScrollController!.offset;
    maxHogeScroll = hogeScrollController!.position.maxScrollExtent;

    if( hogeScroll < contentHeight / 5 ){
      // フローティングアクションボタンを隠す
      hogeSlideButtonControl!.hide();
    } else {
      // フローティングアクションボタンを表示させる
      hogeSlideButtonControl!.show();
    }
  }

  void scrollTop(){
    setState(() {
      hogeScrollController!.jumpTo(0.0);
    });
  }

  @override
  void initState() {
    super.initState();

    // フローティングアクションボタンの状態管理クラス
    hogeSlideButtonControl = MyCustomAnimationControl( setState: setState, hidden: true );

    hogeScrollController = ScrollController();
    hogeScrollController!.addListener( onHogeScroll );
  }

  @override
  void dispose() {
    hogeScrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    contentWidth  = MediaQuery.of( context ).size.width;
    contentHeight = MediaQuery.of( context ).size.height - MediaQuery.of( context ).padding.top - MediaQuery.of( context ).padding.bottom;

    bool scroll = false;
    if( !scroll ){
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
//        FloatingActionButton floating = test2();

        return Scaffold(
          appBar: AppBar(
              toolbarHeight: 0
          ),
          body: Container(
            width: contentWidth,
            height: contentHeight,
            color: Colors.black12,
          ),
          floatingActionButton: floating,
          floatingActionButtonLocation: floatingLocation,
        );

      } else {

        Widget floating = test3();
//        Widget floating = test4();
//        Widget floating = test5();
//        Widget floating = test6();
//        Widget floating = test7(false);
//        Widget floating = test7(true);

        return Scaffold(
          appBar: AppBar(
              toolbarHeight: 0
          ),
          body: Stack( children: [
            Container(
              width: contentWidth,
              height: contentHeight,
              color: Colors.black12,
            ),
            floating,
          ] ),
        );
      }

    } else {

      List<Widget> list = [];
      for( int i = 0; i < 20; i++ ){
        list.add( Container(
            width: contentWidth,
            height: contentHeight / 5,
            color: ((i % 2) == 0) ? Color(0xFFFFFFFF) : Color(0xFFEEFFFF)
        ));
      }

      Widget floating = test8( this, contentWidth, contentHeight, hogeSlideButtonControl, false );
//      Widget floating = test8( this, contentWidth, contentHeight, hogeSlideButtonControl, true );

      return Scaffold(
        appBar: AppBar(
            toolbarHeight: 0
        ),
        body: Stack( children: [
          SingleChildScrollView(
            controller: hogeScrollController,
            scrollDirection: Axis.vertical,
            child: Column( children: list ),
          ),
          floating,
        ] ),
      );

    }
  }
}

// フローティングアクションボタンの状態管理クラス
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
