import 'package:expense_manager/widgets/newtransaction.dart';
import 'package:flutter/material.dart';
import './models/transactions.dart';
import './widgets/transaction_list.dart';


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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> transactions = [
    Transactions(
        id: 'A212', title: 'Shampoo', amount: 423, ptime: DateTime.now()),
    Transactions(
        id: 'A213', title: 'Conditioner', amount: 225, ptime: DateTime.now()),
  ];

  void addNewTransaction(String title, double amount) {
    Transactions newTx = Transactions(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        ptime: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  void buttonSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manger'),
        actions: [
          IconButton(onPressed:()=>buttonSheet(context), icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(),
            TransactionList(transactions: transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:()=>buttonSheet(context),
      ),
    );
  }
}
