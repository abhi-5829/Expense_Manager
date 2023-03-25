import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
 final List<Transactions> transactions;

 const TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:400,
      child: ListView(
          children: transactions.map((tx) {
        return Card(
            child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                "${tx.amount}",
                style: TextStyle(color: Colors.purple.shade300),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple.shade400,
                  width: 2,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMd().format(tx.ptime),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ));
      }).toList()),
    );
  }
}
