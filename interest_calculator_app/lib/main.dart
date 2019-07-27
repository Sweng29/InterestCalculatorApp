import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      color: Colors.green,
      debugShowCheckedModeBanner: false,
      home: SIForm(),
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
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
  var _currentItemSelected = '';
  var _displayResult = '';
  TextStyle buttonsStyle = TextStyle();

  @override
  void initState() {
    _currentItemSelected = _currencies[0];
    buttonsStyle = TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal);
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController rateOfInterestController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "Interest Calculator",
          style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
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
                  style: textStyle,
                  controller: principalController,
                  decoration: InputDecoration(
                      labelText: "Principal",
                      labelStyle: textStyle,
                      hintText: "Enter principal e.g. 12000",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: rateOfInterestController,
                  decoration: InputDecoration(
                      labelText: "Rate of interest",
                      labelStyle: textStyle,
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
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      controller: termController,
                      decoration: InputDecoration(
                          labelText: "Term",
                          labelStyle: textStyle,
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
                      value: _currentItemSelected,
                      style: textStyle,
                      onChanged: (String newValueChanged) {
                        _onDropDownItemSelected(newValueChanged);
                      },
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
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Calculate",
                        style: buttonsStyle,
                      ),
                      elevation: 6.0,
                      onPressed: () {
                        setState(() {
                          this._displayResult = _calculateInterest();
                        });
                      },
                    ),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Reset",
                        style: buttonsStyle,
                      ),
                      elevation: 6.0,
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(
                this._displayResult,
                style: textStyle,
              ),
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

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateInterest() {
    double principal = double.parse(principalController.text);
    double rateOfInterest = double.parse(rateOfInterestController.text);
    double term = double.parse(termController.text);

    double totalCalculatedValue =
        principal + (principal * rateOfInterest * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalCalculatedValue $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.text = '';
    rateOfInterestController.text = '';
    termController.text = '';
    _displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}
