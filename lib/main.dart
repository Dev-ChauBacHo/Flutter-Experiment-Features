import 'package:experiment_app/PageTwo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  GlobalKey key = GlobalKey();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                print('onTapDown');
              },
              onTapUp: (details) {
                print('onTapUp');
                (key.currentContext?.findRenderObject()! as RenderBox);
                Size size =
                    (key.currentContext?.findRenderObject()! as RenderBox).size;
                // print('${size.height}: ${size.width}');
                // print(
                //     '${details.localPosition.dx}: ${details.localPosition.dy}');
                print(
                    '${details.globalPosition.dx}: ${details.globalPosition.dy}');
              },
              onTap: () {
                print('onTap');
                final position = (key.currentContext?.findRenderObject()! as RenderBox).localToGlobal(Offset.zero);
                print('${position.dx}: ${position.dy}');
                // print('${position.dx + 300}: ${position.dy}');
                // print('${position.dx}: ${position.dy + 300}');
                // print('${position.dx + 300}: ${position.dy + 300}');
              },
              onTapCancel: () {
                print('onTapCancel');
              },
              onSecondaryTap: () {
                print('onSecondaryTap');
              },
              onSecondaryTapDown: (details) {
                print('onSecondaryTapDown');
              },
              onSecondaryTapUp: (details) {
                print('onSecondaryTapUp');
              },
              onSecondaryTapCancel: () {
                print('onSecondaryTapCancel');
              },
              onTertiaryTapDown: (details) {
                print('onTertiaryTapDown');
              },
              onTertiaryTapUp: (details) {
                print('onTertiaryTapUp');
              },
              onTertiaryTapCancel: () {
                print('onTertiaryTapCancel');
              },
              onDoubleTapDown: (details) {
                print('onDoubleTapDown');
              },
              onDoubleTap: () {
                print('onDoubleTap');
              },
              onDoubleTapCancel: () {
                print('onDoubleTapCancel');
              },
              onLongPressDown: (details) {
                print('onLongPressDown');
              },
              onLongPressCancel: () {
                print('onLongPressCancel');
              },
              onLongPress: () {
                print('onLongPress');
              },
              onLongPressStart: (details) {
                print('onLongPressStart');
              },
              onLongPressMoveUpdate: (details) {
                print('onLongPressMoveUpdate');
                Size size =
                    (key.currentContext?.findRenderObject()! as RenderBox).size;
                // print('${size.height}: ${size.width}');
                // print(
                //     '${details.localPosition.dx}: ${details.localPosition.dy}');
                // print(
                //     '${details.globalPosition.dx}: ${details.globalPosition.dy}');

                print(
                    '${details.localOffsetFromOrigin.dx}: ${details.localOffsetFromOrigin.dy}');
              },
              onLongPressUp: () {
                print('onLongPressUp-------------------------------');
              },
              onLongPressEnd: (details) {
                print('onLongPressEnd');
              },
              onSecondaryLongPressDown: (details) {
                print('onSecondaryLongPressDown');
              },
              onSecondaryLongPressCancel: () {
                print('onSecondaryLongPressCancel');
              },
              onSecondaryLongPress: () {
                print('onSecondaryLongPress');
              },
              onSecondaryLongPressStart: (details) {
                print('onSecondaryLongPressStart');
              },
              onSecondaryLongPressMoveUpdate: (details) {
                print('onSecondaryLongPressMoveUpdate');
              },
              onSecondaryLongPressUp: () {
                print('onSecondaryLongPressUp');
              },
              onSecondaryLongPressEnd: (details) {
                print('onSecondaryLongPressEnd');
              },
              onTertiaryLongPressDown: (details) {
                print('onTertiaryLongPressDown');
              },
              onTertiaryLongPressCancel: () {
                print('onTertiaryLongPressCancel');
              },
              onTertiaryLongPress: () {
                print('onTertiaryLongPress');
              },
              onTertiaryLongPressStart: (details) {
                print('onTertiaryLongPressStart');
              },
              onTertiaryLongPressMoveUpdate: (details) {
                print('onTertiaryLongPressMoveUpdate');
              },
              onTertiaryLongPressUp: () {
                print('onTertiaryLongPressUp');
              },
              onTertiaryLongPressEnd: (details) {
                print('onTertiaryLongPressEnd');
              },
              onVerticalDragDown: (details) {
                print('onVerticalDragDown');
              },
              onVerticalDragStart: (details) {
                print('onVerticalDragStart');
              },
              onVerticalDragUpdate: (details) {
                print('onVerticalDragUpdate');
              },
              onVerticalDragEnd: (details) {
                print('onVerticalDragEnd');
              },
              onVerticalDragCancel: () {
                print('onVerticalDragCancel');
              },
              onHorizontalDragDown: (details) {
                print('onHorizontalDragDown');
              },
              onHorizontalDragStart: (details) {
                print('onHorizontalDragStart');
              },
              onHorizontalDragUpdate: (details) {
                print('onHorizontalDragUpdate');
              },
              onHorizontalDragEnd: (details) {
                print('onHorizontalDragEnd');
              },
              onHorizontalDragCancel: () {
                print('onHorizontalDragCancel');
              },
              onForcePressStart: (details) {
                print('onForcePressStart');
              },
              onForcePressPeak: (details) {
                print('onForcePressPeak');
              },
              onForcePressUpdate: (details) {
                print('onForcePressUpdate');
              },
              onForcePressEnd: (details) {
                print('onForcePressEnd');
              },
              // onPanDown: (details) {
              //
              // },
              // onPanStart: (details) {
              //
              // },
              // onPanUpdate: (details) {
              //
              // },
              // onPanEnd: (details) {
              //
              // },
              // onPanCancel: () {
              //
              // },
              // onScaleStart: (details) {
              //   print('onScaleStart');
              // },
              // onScaleUpdate: (details) {
              //   print('onScaleUpdate');
              //   print(details.pointerCount);
              // },
              // onScaleEnd: (details) {
              //   print('onScaleEnd');
              // },
              // behavior: ,
              child: Container(
                key: key,
                height: 300,
                width: 300,
                color: Colors.red,
              ),
            ),
            LongPressDraggable<String>(
              // gestures: ,
              data: '5',
              dragAnchorStrategy: pointerDragAnchorStrategy,
              feedback: Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              hapticFeedbackOnStart: false,
              childWhenDragging: Container(
                height: 200,
                width: 200,
                color: Colors.yellow,
              ),
              child: Container(
                height: 300,
                width: 300,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: DragTarget<String>(
        builder: (_, item, reject) {
          return Transform.scale(
            scale: (item.isNotEmpty && item.first == '5') ? 2 : 1,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => PageTwo()));
                },
                tooltip: 'Increment',
                backgroundColor: (item.isNotEmpty && item.first == '5')
                    ? Colors.green
                    : Colors.yellow,
                child: Icon(
                  Icons.add,
                  color: (item.isNotEmpty && item.first == '5')
                      ? Colors.green
                      : Colors.yellow,
                ),
              ),
            ),
          );
        },
        onAccept: (item) {
          // setState(() {
          //
          // });
        },
        onAcceptWithDetails: (item) {

        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
