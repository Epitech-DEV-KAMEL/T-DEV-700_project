
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/core/themes/common_style.dart';
import 'package:terminal_app/core/widgets/qr_code/qr_code_windows.dart';
import 'package:terminal_app/core/widgets/scan_nfc/scan_nfc.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/features/domain/entities/cheque.dart';
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
              Text(
                'Choose your paiement method',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20.0)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: OutlinedButton(
                            onPressed: () {
                              _navigateToCardForm(context);
                            }, 
                            child: const Icon(
                              Icons.credit_card,
                              size: 48,
                              color: ColorTheme.primary
                            )
                          ),
                        ),
                        Text(
                          'Credit Card',
                          style: CommonStyle.paymentOutlineButtonSubTextStyle(context),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: OutlinedButton(
                            onPressed: () {
                              _navigateToNFCScanner(context);
                            }, 
                            child: const Icon(
                              Icons.nfc,
                              size: 48,
                              color: ColorTheme.primary
                            ),
                          ),
                        ),
                        Text(
                          'Credit Card (NFC)',
                          style: CommonStyle.paymentOutlineButtonSubTextStyle(context),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: OutlinedButton(
                            onPressed: () {
                              _navigateToQRCodeScanner(context);
                            }, 
                            child: const Icon(
                              Icons.payments,
                              size: 48,
                              color: ColorTheme.primary
                            )
                          ),
                        ),
                        Text(
                          'Cheque',
                          style: CommonStyle.paymentOutlineButtonSubTextStyle(context),
                        )
                      ],
                    ),
                  )
                ],
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

  void _navigateToQRCodeScanner(BuildContext context) async {
    Barcode? result = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const QRCodeWindows())
    );

    if (result == null || result.code == null) {
      Navigator.pop(context);
      return;
    }

    String? jsonCheque = result.code;

    Cheque cheque;

    try {
      cheque = Cheque.fromJson(jsonDecode(jsonCheque as String));
    } catch (e) {
      Navigator.pop(context);
      return;
    }

    Navigator.pop(context, cheque);
  }

  void _navigateToNFCScanner(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScanNFC())
    );

    if (result == null) return;
    if (result is String) {
      try {
        BankCard bankCard = BankCard.fromJson(jsonDecode(result));
        Navigator.pop(context, bankCard);
      } catch (e) {
        Navigator.pop(context);
      }
    }
  }
}