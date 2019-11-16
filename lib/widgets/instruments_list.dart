import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrap_items_tests/main.dart';
import 'package:wrap_items_tests/widgets/instrument.dart';
import 'package:wrap_items_tests/widgets/instrument_item.dart';

typedef ListCallback(Set<String> instrumentsSet);

class InstrumentsList extends StatefulWidget {
  InstrumentsList({Key key, this.instruments, this.buttonCallback}) : super(key: key);

  final List<String> instruments;
  final ListCallback buttonCallback;

  @override
  _InstrumentsListState createState() => _InstrumentsListState();
}

class _InstrumentsListState extends State<InstrumentsList> {
  Set<String> _instrumentsSet = Set<String>();

  void _handleInstrumentChanged(String instrument, bool isSelected) {
    setState(() {
      if (!isSelected) {
        _instrumentsSet.add(instrument);
        Provider.of<FinalList>(context, listen: false).handleData(_instrumentsSet);
      //  print(_instrumentsSet);
        
      } else {
        _instrumentsSet.remove(instrument);
        Provider.of<FinalList>(context, listen: false).handleData(_instrumentsSet);
       // print(_instrumentsSet);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: widget.instruments.map((String instrument) {
            return InstrumentItem(
              instrument: instrument,
              isSelected: _instrumentsSet.contains(instrument),
              onListChanged: _handleInstrumentChanged,
            );
          }).toList(),
        ),
        FloatingActionButton(
          onPressed: () {
            Provider.of<FinalList>(context, listen: false).handleData(_instrumentsSet);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
