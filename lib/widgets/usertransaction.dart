import 'package:flutter/material.dart';
import './newtransaction.dart';
import './transaction_list.dart';
import '../models/transactions.dart';

class UserTransaction extends StatefulWidget {
 

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
    final List<Transactions> transactions = [
    Transactions(
        id: 'A212', title: 'Shampoo', amount: 423, ptime: DateTime.now()),
    Transactions(
        id: 'A213', title: 'Conditioner', amount: 225, ptime: DateTime.now()),
  ];
  
  void addNewTransaction(String title, double amount){
      Transactions newTx= Transactions(id: DateTime.now().toString(), title: title, amount: amount, ptime: DateTime.now());

      setState(() {
        transactions.add(newTx);
      });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(addNewTransaction), TransactionList(transactions:transactions)],
    );
  }
}
