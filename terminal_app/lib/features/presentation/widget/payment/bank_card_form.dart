import 'package:flutter/material.dart';
import 'package:terminal_app/core/themes/common_style.dart';
import 'package:terminal_app/core/utils/validators.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';

class BankCardForm extends StatefulWidget {
  const BankCardForm({ Key? key }) : super(key: key);

  @override
  _BankCardFormState createState() => _BankCardFormState();
}

class _BankCardFormState extends State<BankCardForm> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController cardSecurityCodeController = TextEditingController();
  final TextEditingController cardholderController = TextEditingController();
  final TextEditingController monthExpirationController = TextEditingController();
  final TextEditingController yearExpirationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Enter your credit card information',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 30.0)),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: accountNumberController,
                        keyboardType: TextInputType.number,
                        decoration: CommonStyle.textFieldStyle(
                          icon: const Icon(Icons.credit_card),
                          placeholder: 'XXXX XXXX XXXX XXXX',
                          label: 'Bank account number'
                        ),
                        validator: (String? value) {
                          if (value == null) return '';
                          String valueWithoutSpace = value.replaceAll(' ', '');
                          if (!Validators.containOnlyDigit(valueWithoutSpace)) return '';
                          if (valueWithoutSpace.length != 16) return '';
                          return null;
                        }
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10.0)),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: cardSecurityCodeController,
                        keyboardType: TextInputType.number,
                        decoration: CommonStyle.textFieldStyle(
                          placeholder: 'XXX',
                          label: 'Code'
                        ),
                        validator: (String? value) {
                          if (value == null) return '';
                          String valueWithoutSpace = value.replaceAll(' ', '');
                          if (!Validators.containOnlyDigit(valueWithoutSpace)) return '';
                          if (valueWithoutSpace.length != 3) return '';
                          return null;
                        }
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: cardholderController,
                        keyboardType: TextInputType.name,
                        decoration: CommonStyle.textFieldStyle(
                          placeholder: 'Mr. Joe',
                          label: 'Cardholder Name'
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10.0)),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: monthExpirationController,
                        keyboardType: TextInputType.number,
                        decoration: CommonStyle.textFieldStyle(
                          placeholder: 'MM',
                          label: 'Month'
                        ),
                        validator: (String? value) {
                          if (value == null) return '';
                          String valueWithoutSpace = value.replaceAll(' ', '');
                          if (!Validators.containOnlyDigit(valueWithoutSpace)) return '';;
                          int numValue = int.parse(valueWithoutSpace);
                          if (numValue < 1 && numValue > 12) return '';; 
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10.0)),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: yearExpirationController,
                        keyboardType: TextInputType.number,
                        decoration: CommonStyle.textFieldStyle(
                          placeholder: 'YY',
                          label: 'Year'
                        ),
                        validator: (String? value) {
                          if (value == null) return '';;
                          String valueWithoutSpace = value.replaceAll(' ', '');
                          if (!Validators.containOnlyDigit(valueWithoutSpace)) return '';;
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                ElevatedButton(
                  style: CommonStyle.elevatedButton(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(
                        context,
                        BankCard(
                          accountNumber: accountNumberController.text, 
                          cardholderName: cardholderController.text, 
                          cardSecurityCode: cardSecurityCodeController.text, 
                          brandMark: 'Visa', 
                          expirationDate: DateTime(int.parse(yearExpirationController.text), int.parse(monthExpirationController.text))
                        )
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}