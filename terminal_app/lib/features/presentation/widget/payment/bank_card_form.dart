import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/core/themes/common_style.dart';
import 'package:terminal_app/core/widgets/core_elevated_button/core_elevated_button.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';

class BankCardForm extends StatefulWidget {
  const BankCardForm({Key? key}) : super(key: key);

  @override
  _BankCardFormState createState() => _BankCardFormState();
}

class _BankCardFormState extends State<BankCardForm> {
  final _formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  CardType brandMark = CardType.visa;

  OutlineInputBorder? border;

  @override
  void initState() {
    border = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                glassmorphismConfig: Glassmorphism(
                  blurX: 1.0,
                  blurY: 1.0,
                  gradient: CommonStyle.cardLinearGradient,
                ),
                animationDuration: const Duration(milliseconds: 1000),
                height: 225.0,
                obscureCardCvv: true,
                obscureCardNumber: true,
                cardBgColor: Colors.black,
                onCreditCardWidgetChange: (CreditCardBrand cardBrand) {},
              ),
              CreditCardForm(
                formKey: _formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                themeColor: ColorTheme.primary,
                textColor: Theme.of(context).colorScheme.onSurface.withAlpha(225),
                cardNumberDecoration: CommonStyle.inputDecoration(
                  context,
                  label: 'Card Number',
                  placeholder: 'XXXX XXXX XXXX XXXX'
                ),
                expiryDateDecoration: CommonStyle.inputDecoration(
                  context,
                  label: 'Expired Date',
                  placeholder: 'XX/XX'
                ),
                cvvCodeDecoration: CommonStyle.inputDecoration(
                  context,
                  label: 'CVV',
                  placeholder: 'XXX'
                ),
                cardHolderDecoration: CommonStyle.inputDecoration(
                  context,
                  label: "Cardholder's Name",
                  placeholder: 'XX/XX'
                ),
                onCreditCardModelChange: _onCreditCardModelChange,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CoreElevatedButton(
                  text: 'Add Card',
                  onPressed: () => _closePopupAndReturnCreditCardInformation(context),
                )
              ),
            ],
          )
        ),
      ),
    );
  }

  void _onCreditCardModelChange(CreditCardModel cardModel) {
    setState(() {
      cardNumber = cardModel.cardNumber;
      cardHolderName = cardModel.cardHolderName;
      cvvCode = cardModel.cvvCode;
      expiryDate = cardModel.expiryDate;
      isCvvFocused = cardModel.isCvvFocused;
    });
  }

  void _closePopupAndReturnCreditCardInformation(BuildContext context) {
    BankCard bankCard = BankCard(
        accountNumber: cardNumber,
        brandMark: 'visa',
        cardSecurityCode: cvvCode,
        cardholderName: cardHolderName,
        expirationDate: expiryDate);

    Navigator.pop(context, bankCard);
  }
}
