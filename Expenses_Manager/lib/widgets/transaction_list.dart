import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(
    this.transactions,
    this.deleteTx,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: double.infinity,
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text(
                      'No transactions is added yet !!',
                      style: Theme.of(context).textTheme.title,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.7,
                        child: Image.asset('assets/images/bulb.png',
                            fit: BoxFit.fill)),
                  ],
                );
              })
            : ListView(
                children: transactions.map((tx) {
                  return TransactionItems(
                    key: ValueKey(tx.id),
                    transactions: tx,
                    deleteTx: deleteTx,
                  );
                }).toList(),
              ));
    // : ListView.builder(
    //     itemCount: transactions.length,
    //     itemBuilder: (ctx, index) {
    //       return TransactionItems(
    //           transactions: transactions[index], deleteTx: deleteTx);
    //     },
    //   ));
  }
}
