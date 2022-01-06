
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/core/themes/common_style.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/features/domain/entities/cheque.dart';
import 'package:terminal_app/features/domain/entities/payment_methods.dart';
import 'package:terminal_app/features/dto/payment_informations.dart';
import 'package:terminal_app/features/presentation/widget/payment/choose_payment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({ Key? key, this.onPaymentAdded, this.onPaymentRemoved}) : super(key: key);

  final Function(PaymentInformations)? onPaymentAdded;
  final VoidCallback? onPaymentRemoved;

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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Payment Method',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
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
            child: const Icon(
              Icons.add,
              color: ColorTheme.primary,
            )
          )
          : paymentMethod == PaymentMethods.card ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CreditCardWidget(
                  cardNumber: bankCard!.accountNumber,
                  expiryDate: bankCard!.expirationDate, 
                  cardHolderName: bankCard!.cardholderName,
                  cvvCode: bankCard!.cardSecurityCode, 
                  showBackView: false,
                  isSwipeGestureEnabled: false,
                  glassmorphismConfig: Glassmorphism(
                    blurX: 1.0,
                    blurY: 1.0,
                    gradient: CommonStyle.cardLinearGradient,
                  ),
                  animationDuration: const Duration(milliseconds: 1000),
                  height: 225.0,
                  obscureCardCvv: true,
                  obscureCardNumber: true,
                  onCreditCardWidgetChange: (CreditCardBrand cardBrand) {  },          
                ),
                OutlinedButton(
                  onPressed: _removePaymentMethod, 
                  child: const Icon(Icons.delete, color: ColorTheme.primary)
                ),
              ],
            )
            : Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.onBackground.withAlpha(30))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Cheque',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ID',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        '${cheque!.id} €',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
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
    widget.onPaymentRemoved!();
  }

  void _showChoosePaimentModalAndAddPaiement(BuildContext context) async {
    var result = await showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (context) => const ChoosePayment(),
    );

    if (result == null) return;
    if (result is BankCard) {
      setState(() {
        paymentMethod = PaymentMethods.card;
        bankCard = result;
      });
    }
    if (result is Cheque) {
      setState(() {
        paymentMethod = PaymentMethods.cheque;
        cheque = result;
      });
    }
    widget.onPaymentAdded!(
      PaymentInformations(
        paymentMethods: bankCard == null ? PaymentMethods.cheque : PaymentMethods.card,
        card: bankCard, 
        cheque: cheque
      )
    );
  }
}