import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrap_items_tests/widgets/instruments_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Wrap de Instruments'),
    );
  }
}


class FinalList with ChangeNotifier {
  Set<String> finalSet = {};
  
  void handleData(Set<String> _setList) {
    
    print('Selected: ' + _setList.toString());    
    
  }

}


class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  List<String> instrumentsList = [
    'Laud',
    'Zambomba',
    'Pandereta',
    'Caja china'
  ];

 

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
            ChangeNotifierProvider(
              builder: (context) => FinalList(),
              child: InstrumentsList(instruments: instrumentsList),
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
