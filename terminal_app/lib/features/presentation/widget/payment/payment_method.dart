
import 'package:flutter/material.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/features/presentation/widget/payment/choose_payment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({ Key? key, this.paymentAdded, this.paymentRemoved }) : super(key: key);

  final VoidCallback? paymentAdded;
  final VoidCallback? paymentRemoved;

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  PaymentMethod? paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Payment Method',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            _showChoosePaimentModalAndAddPaiement(context);
          }, 
          child: Icon(
            Icons.add,
            color: ColorTheme.primary,
          )
        ),
      ],
    );
  }

  void _showChoosePaimentModalAndAddPaiement(BuildContext context) async {
    var result = await showModalBottomSheet(
      context: context,
      builder: (context) => const ChoosePayment(),
    );
  }
}