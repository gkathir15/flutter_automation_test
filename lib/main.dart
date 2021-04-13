import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String entered_text = "";
  TextEditingController _textEditingController;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  void initState() {
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    _textEditingController.addListener(() {
      setState(() {
        entered_text = _textEditingController.text;
      });
    });

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

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              key: Key("h3"),
            ),        Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
              key: Key("h2"),
            ),Text(
              '$entered_text',
              style: Theme.of(context).textTheme.headline4,
              key: Key("h1"),
            ),
            TextField( key: Key("e3"),controller: _textEditingController)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        key: Key("f1"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
   _textEditingController.dispose();
    super.dispose();
  }


}
