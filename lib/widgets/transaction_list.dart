import 'package:flutter/material.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransactionHandler;

  TransactionList(this.transaction, this.deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/img/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transaction
                .map(
                  (tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    deleteTransactionHandler: deleteTransactionHandler,
                  ),
                )
                .toList(),
          );
    /* ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return TransactionItem(
                key: ValueKey(transaction[index].id),
                transaction: transaction[index],
                deleteTransactionHandler: deleteTransactionHandler,
              );
            },
            itemCount: transaction.length,
          ) */
    ;
  }
}
