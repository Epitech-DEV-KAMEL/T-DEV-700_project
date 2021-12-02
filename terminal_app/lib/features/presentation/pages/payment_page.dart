
import 'package:flutter/material.dart';
import 'package:terminal_app/features/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:terminal_app/features/presentation/widget/payment/payment_resume.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({ Key? key }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payment'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[
          PaymentResume(),
        ],
      ),
    );
  }
}