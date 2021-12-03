
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/features/domain/entities/cheque.dart';
import 'package:terminal_app/features/domain/entities/payment_methods.dart';
import 'package:terminal_app/features/presentation/widget/payment/choose_payment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({ Key? key, this.paymentAdded, this.paymentRemoved }) : super(key: key);

  final VoidCallback? paymentAdded;
  final VoidCallback? paymentRemoved;

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  PaymentMethods? paymentMethod;
  BankCard? bankCard;
  Cheque? cheque;

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
        (paymentMethod == null ?
          OutlinedButton(
            onPressed: () {
              _showChoosePaimentModalAndAddPaiement(context);
            }, 
            child: Icon(
              Icons.add,
              color: ColorTheme.primary,
            )
          )
          : paymentMethod == PaymentMethods.cart ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CreditCardWidget(
                  cardNumber: bankCard!.accountNumber,
                  expiryDate: bankCard!.expirationDate, 
                  cardHolderName: bankCard!.cardholderName,
                  cvvCode: bankCard!.cardSecurityCode, 
                  showBackView: false,
                  glassmorphismConfig: Glassmorphism(
                    blurX: 1.0,
                    blurY: 1.0,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.black,
                        Colors.black.withOpacity(0.8),
                        Colors.black,
                      ],
                      stops: const <double>[
                        0.4,
                        0.3,
                        0,
                      ],
                    ),
                  ),
                  animationDuration: const Duration(milliseconds: 1000),
                  height: 225.0,
                  obscureCardCvv: true,
                  obscureCardNumber: true,
                  onCreditCardWidgetChange: (CreditCardBrand cardBrand) {  },          
                ),
                OutlinedButton(
                  onPressed: _removePaymentMethod, 
                  child: Icon(Icons.delete, color: ColorTheme.primary)
                ),
              ],
            )
            : Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Cheque',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cheque',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        '${cheque!.amount} €',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        )
      ],
    );
  }

  void _removePaymentMethod() {
    setState(() {
      paymentMethod = null;
      bankCard = null;
      cheque = null;
    });
  }

  void _showChoosePaimentModalAndAddPaiement(BuildContext context) async {
    var result = await showModalBottomSheet(
      context: context,
      builder: (context) => const ChoosePayment(),
    );

    if (result == null) return;
    if (result is BankCard) {
      setState(() {
        paymentMethod = PaymentMethods.cart;
        bankCard = result;
      });
    }
    if (result is Cheque) {
      setState(() {
        paymentMethod = PaymentMethods.cheque;
        cheque = result;
      });
    }
  }
}