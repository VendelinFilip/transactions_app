import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constrains) {
            return Column(
              children: <Widget>[
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6),
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  height: constrains.maxHeight * 0.6,
                  margin: EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/images/nothing-here.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  deleteTransaction: deleteTransaction);
              //Needed only when state of an item (widget) inside list has data bounded to that item
              //ListView(
              //  children: transactions
              //    .map(
              //      (transaction) => TransactionItem(
              //        key: ValueKey(transaction.id),
              //        transaction: transaction,
              //        deleteTransaction: deleteTransaction,
              //      ),
              //    )
              //  .toList(),
              //);
            },
            itemCount: transactions.length,
          );
  }
}
