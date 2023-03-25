import 'package:expense_manager/models/transactions.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final textController = TextEditingController();
  final amountController = TextEditingController();
   
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction); 
  
  void sumbitData(){
    final textData=textController.text;
    final amountData=double.parse(amountController.text);
    
    if(textData.isEmpty || amountData<=0){
      return;
    }


  addNewTransaction(textData, amountData);
         
  }

 
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
            keyboardType: TextInputType.number,
            onSubmitted: (_)=> sumbitData,
          ),
          TextButton(
            onPressed: () => sumbitData ,
            child: Text('Add Transaction'),
          )
        ],
      ),
    ));
  }
}
