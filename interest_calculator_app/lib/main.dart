import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      color: Colors.green,
      debugShowCheckedModeBanner: false,
      home: SIForm(),
    ));

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Rupees', 'Dollors', 'Euro', 'Pound'];
  var _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Interest Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            getImageAssest(),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: "Enter principal e.g. 12000",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Rate of interest",
                      hintText: "In percent %",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Term",
                          hintText: "Time in years",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: 'Rupees',
                      onChanged: (String newValueChanged) {},
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Calculate"),
                    ),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Reset"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text('Demo text'),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAssest() {
    AssetImage assetImage = new AssetImage('images/bankTwo.png');
    Image image = Image(
      image: assetImage,
      width: 150.0,
      height: 150.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }
}
