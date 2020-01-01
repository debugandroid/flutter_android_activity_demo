import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

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
  static const platform = const MethodChannel('com.startActivity/testChannel');
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click on the below button to start the Android Activity',
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: (){
                _startActivity();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Start Android Activity',
                  style: TextStyle(color: Colors.white,fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _startActivity() async {
    try {
      final String result = await platform.invokeMethod('StartSecondActivity');
      debugPrint('Result: $result ');
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
    }
  }
}
