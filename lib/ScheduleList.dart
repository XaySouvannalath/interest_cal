import 'package:flutter/material.dart';
import 'package:interest_calculator/Interest.dart';
import 'package:intl/intl.dart';

class ScheduleList extends StatelessWidget {
  final List<Loan> loans;

  ScheduleList(this.loans) {
    print('ScheduleList constructor');
  }

  Widget _loanSummary = Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: <Widget>[
        Text("Principal: 999"),
        Divider(),
         Text("Interest Rate: 999"),
        Divider(),
        Text("Total Interest: 999"),
        Divider(), 
        Text("Total Principal: 999")
        ],
    ),
  );
  Widget _buildProductItem(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text((index + 1).toString()),
      ),
      title: Text(
          "Interest: " + NumberFormat('#,###').format(loans[index].interest)),
      subtitle: Text(
          "Principal: " + NumberFormat('#,###').format(loans[index].principal)),
      trailing: Icon(Icons.payment),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return Scaffold(
        appBar: AppBar(
          title: Text("Schedule detail"),
        ),
        body: ListView(
          children: <Widget>[
            _loanSummary,
            loans.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: _buildProductItem,
                    itemCount: loans.length,
                  )
                : Center(
                    child: Text('No schedule found, please add some'),
                  ),
          ],
        ));
  }
}
