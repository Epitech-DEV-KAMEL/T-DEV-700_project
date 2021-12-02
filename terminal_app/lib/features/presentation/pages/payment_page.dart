import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/core/themes/common_style.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:terminal_app/features/presentation/widget/payment/payment_method.dart';
import 'package:terminal_app/features/presentation/widget/payment/payment_resume.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isPaymentButtonDisable = true;

  @override
  void initState() {
    _isPaymentButtonDisable = true;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Cart cart = context.read<Cart>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Payment'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                const PaymentResume(), 
                PaymentMethod(
                  paymentAdded: () {
                    setState(() {
                      _isPaymentButtonDisable = false;
                    });
                  },
                  paymentRemoved: () {
                    setState(() {
                      _isPaymentButtonDisable = true;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.black12))),
            child: ElevatedButton(
              style: CommonStyle.elevatedButton(),
              onPressed: _isPaymentButtonDisable ? null : () =>_paid(context, cart),
              child: const Text(
                'Buy',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _paid(BuildContext context, Cart cart) {
    // TODO: call server to make the payment. 
    // If it success, delete cart and display payment accepted. After 5 seconds return to cart page. 
    // Else dispay payment refused. After 5 seconds return to payment page.
  }
}
