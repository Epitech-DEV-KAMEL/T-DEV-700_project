
import 'package:flutter/material.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/features/presentation/widget/payment/bank_card_form.dart';

class ChoosePayment extends StatelessWidget {
  const ChoosePayment({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Choose your paiement method',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20.0)),
              OutlinedButton(
                onPressed: () {
                  _navigateToCardForm(context);
                }, 
                child: const Text(
                  'Pay by card'
                )
              ),
              OutlinedButton(
                onPressed: () {
                }, 
                child: const Text(
                  'Pay by NFC'
                )
              ),
              OutlinedButton(
                onPressed: () {
                }, 
                child: const Text(
                  'Pay by Cheque'
                )
              )
            ],
          ),
        ),
      ]
    );
  }

  void _navigateToCardForm(BuildContext context) async {
    BankCard? bankCard = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const BankCardForm())
    );

    if (bankCard != null) {
      Navigator.pop(context, bankCard);
    } else {
      Navigator.pop(context);
    }
  }
}