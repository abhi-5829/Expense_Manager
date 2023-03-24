import 'package:expense_manager/models/transactions.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final textController = TextEditingController();
  final amountController = TextEditingController();
   
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction); 


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: textController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
          ),
          TextButton(
            onPressed: () => addNewTransaction(textController.text, double.parse(amountController.text)),
            child: Text('Add Transaction'),
          )
        ],
      ),
    ));
  }
}
