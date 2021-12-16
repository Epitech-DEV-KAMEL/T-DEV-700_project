import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/core/widgets/core_elevated_button/core_elevated_button.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/domain/usecases/pay/pay_usecase.dart';
import 'package:terminal_app/features/dto/payment_informations.dart';
import 'package:terminal_app/features/presentation/pages/error_page.dart';
import 'package:terminal_app/features/presentation/pages/success_page.dart';
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
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(top: BorderSide(color: Theme.of(context).colorScheme.onBackground.withAlpha(30))
              )
            ),
            child: CoreElevatedButton(
              text: 'Buy',
              onPressed: _paymentInformations == null ? null : () =>_paid(context, cart, _paymentInformations as PaymentInformations)
            )
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
      (failure) {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const ErrorPage(message: "Failed to contact server"))
        );
      }, 
      (isPaid) {
        if (isPaid) {
          _reset(cart);
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const SuccessPage(message: "Payment Accepted"))
          );
        } else {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const ErrorPage(message: "Payment Refused"))
          );
        }
      }
    );
  }

  void _reset(Cart cart) {
    cart.clear();
    setState(() {
      _paymentInformations = null;
    });
  }
}
