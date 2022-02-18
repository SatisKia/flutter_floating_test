import 'package:flutter/material.dart';

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
  return Positioned(
    left: 10,
    top: 10,
    child: Column( children: [
      SizedBox(
        width: 50,
        height: 50,
        child: ElevatedButton(
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
        ),
      ),
      SizedBox(
          height: 10
      ),
      SizedBox(
        width: 50,
        height: 50,
        child: ElevatedButton(
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
        ),
      ),
      SizedBox(
          height: 10
      ),
      SizedBox(
        width: 50,
        height: 50,
        child: ElevatedButton(
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
        ),
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
