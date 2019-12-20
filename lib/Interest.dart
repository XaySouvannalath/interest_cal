import 'package:flutter/material.dart';
import 'package:interest_calculator/ScheduleList.dart';

class Interest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InterestState();
  }
}

class InterestState extends State<Interest> {
  String _amount_finance;
  String _interest_rate;
  String _interest_unit;
  String _period;
  String _period_unit;

  bool _is_generate = false;
  bool showPassword = false;
  List units = ["ເດືອນ", "ປີ"];
  String _currentUnit, _currentPeriodUnit;
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List<Loan> loan = [];
  Widget space = SizedBox(
    height: 10.0,
  );
  @override
  void initState() {
    // TODO: implement initState
    _dropDownMenuItems = getDropDownMenuItems();
    _currentUnit = _dropDownMenuItems[0].value;
    _currentPeriodUnit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String unit in units) {
      items.add(new DropdownMenuItem(value: unit, child: new Text(unit)));
    }
    return items;
  }

  Widget _buildRow(int idx) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('$idx'),
      ),
      title: Text('Item $idx'),
      trailing: Icon(Icons.money_off),
    );
  }

  Widget _builtExample(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[Text("123")],
      ),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentUnit = selectedCity;
    });
  }

  void changedDropDownItem2(String selectedCity) {
    setState(() {
      _currentPeriodUnit = selectedCity;
    });
  }

  void OnGenerate() {
    loan.clear();

    try {
      double amount = double.parse(_amount_finance);
      double interest = double.parse(_interest_rate);
      String iunit = _interest_unit;
      String punit = _period_unit;
      double period = double.parse(_period);

      for (var i = 0; i < period; i++) {
        loan.add(Loan(
            interest: ((interest * period)/100 * amount)/period,
            principal: amount / period,
            row_number: i + 1));
      }


      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ScheduleList(loan)),
            );

     /*  setState(() {
        _is_generate = true;
      }); */
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Calculator"),
      ),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'ຈໍານວນເງິນສຶນເຊື່ອ'),
                        onChanged: (String value) {
                          setState(() {
                            _amount_finance = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'ອັດຕາດອກເບ້ຍ'),
                        onChanged: (String value) {
                          setState(() {
                            _interest_rate = value;
                          });
                        },
                      ),
                      space,
                      DropdownButton(
                        underline: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                        ),
                        items: getDropDownMenuItems(),
                        value: _currentUnit,
                        onChanged: (value) {
                          changedDropDownItem(value);
                        },
                        isExpanded: true,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'ໄລຍະເວລາ'),
                        onChanged: (String value) {
                          setState(() {
                            _period = value;
                          });
                        },
                      ),
                      space,
                      DropdownButton(
                        underline: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                        ),
                        items: getDropDownMenuItems(),
                        value: _currentPeriodUnit,
                        onChanged: (value) {
                          changedDropDownItem2(value);
                        },
                        isExpanded: true,
                      ),
                      RaisedButton(
                        child: Text("ເບິ່ງ"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          OnGenerate();
                        },
                      ),
                    ],
                  ),
                 /*  _is_generate == true
                      ? Expanded(child: ScheduleList(loan))
                      : Center(
                          child: Text("null"),
                        ) */
                ],
              )
            )
         ),
    );
  }
}

class Loan {
  final double interest;
  final double principal;
  final int row_number;

  Loan({this.interest, this.principal, this.row_number});
}
