import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/core/themes/common_style.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/domain/usecases/pay/pay_usecase.dart';
import 'package:terminal_app/features/dto/payment_informations.dart';
import 'package:terminal_app/features/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:terminal_app/features/presentation/widget/payment/payment_method.dart';
import 'package:terminal_app/features/presentation/widget/payment/payment_resume.dart';
import 'package:terminal_app/injection_container.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentInformations? _paymentInformations; 

  @override
  void initState() {
    _paymentInformations = null;
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
                  onPaymentAdded: (PaymentInformations paymentInformations) {
                    setState(() {
                      _paymentInformations = paymentInformations;
                    });
                  },
                  onPaymentRemoved: () {
                    setState(() {
                      _paymentInformations = null;
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
              onPressed: _paymentInformations == null ? null : () =>_paid(context, cart, _paymentInformations as PaymentInformations),
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

  void _paid(BuildContext context, Cart cart, PaymentInformations paymentInformations) async {
    var paymentResult = await sl<PayUsecase>().execute(
      PayParams(cart.items, paymentInformations)
    );

    paymentResult.fold(
      (failure) => {
        // TODO: Fail to contact server - dispay an error. After 2 seconds return to payment page.
      }, 
      (isPaid) => {
        if (isPaid) {
          cart.clear()
          // TODO: display payment accepted. After 5 seconds return to cart page.
        } else {
          // TODO: display an error and return to payment page after 2 seconds.
        }
      }
    );
    
  }
}
