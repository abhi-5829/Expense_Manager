import './transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  final List<Transactions> transactions = [
    Transactions(
        id: 'A212', title: 'Shampoo', amount: 423, ptime: DateTime.now()),
    Transactions(
        id: 'A213', title: 'Conditioner', amount: 225, ptime: DateTime.now()),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manger'),
      ),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(),
          Column(

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
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
            }).toList(),
          ),
        ],
      ),
    );
  }
}
