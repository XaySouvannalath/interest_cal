import 'package:flutter/material.dart';

class Interest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InterestState();
  }
}

class InterestState extends State<Interest> {
  bool showPassword = false;
  List units = ["ເດືອນ", "ປີ"];
  String _currentUnit;
   List<DropdownMenuItem<String>> _dropDownMenuItems;
@override
  void initState() {
    // TODO: implement initState
     _dropDownMenuItems = getDropDownMenuItems();
    _currentUnit = _dropDownMenuItems[0].value;
    super.initState();
    

  }

   List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String unit in units) {
      items.add(new DropdownMenuItem(
          value: unit,
          child: new Text(unit)
      ));
    }
    return items;
  }

   void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentUnit = selectedCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Interest Calculation"),
      ),
      body: Center(
         child: Padding(
           padding: EdgeInsets.all(10.0),
           child: Column(
             children: <Widget>[
               TextField(
                 decoration: InputDecoration(labelText: "ຈໍານວນເງິນ",),
                 keyboardType: TextInputType.number,
               ),
              
                TextField(
                 decoration: InputDecoration(labelText: "ອັດຕາດອກເບ້ຍ",),
                 keyboardType: TextInputType.number,
               ),

               DropdownButton(
                 value: _currentUnit,
                 items: _dropDownMenuItems,
                 onChanged: changedDropDownItem
               ),
                 TextField(
                 decoration: InputDecoration(labelText: "ໄລຍະເວລາ",),
                 keyboardType: TextInputType.number,
               ),
               DropdownButton(
                 value: _currentUnit,
                 items: _dropDownMenuItems,
                 onChanged: changedDropDownItem
               ),
             ],
           )
         ),
      ),
    );
  }
}
