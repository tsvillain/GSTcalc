import 'package:flutter/material.dart';

class Exclusion extends StatefulWidget {
  @override
  _ExclusionState createState() => _ExclusionState();
}

class _ExclusionState extends State<Exclusion> {
  TextEditingController amountTextController = TextEditingController();
  TextEditingController perTextController = TextEditingController();
  String netAmount;
  double _netAmount, _gstAmount, _grossAmount;
  String gstAmount;
  double gstPer, _gstPer;
  String grossAmount;
  _calculate() {
    _grossAmount = double.parse(amountTextController.text);
    _gstPer = double.parse(perTextController.text);
    _gstAmount = _grossAmount - (_grossAmount * (100 / (100 + _gstPer)));
    _netAmount = _grossAmount - _gstAmount;
    setState(() {
      netAmount = _netAmount.toString();
      gstAmount = _gstAmount.toString();
      grossAmount = _grossAmount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextField(
                  controller: amountTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Gross Amount',
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                ),
                Divider(),
                TextField(
                  controller: perTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'GST Rate',
                    labelText: 'GST',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            Divider(),
            FlatButton(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Calculate',
              ),
              onPressed: () {
                _calculate();
              },
            ),
            Divider(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Net Amount: '),
                    Text(netAmount != null ? netAmount : "0")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('GST Amount: '),
                    Text(gstAmount != null ? gstAmount : "0")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Gross Amount: '),
                    Text(grossAmount != null ? grossAmount : "0")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
