import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:terminal_app/core/error/failure.dart';

class AwaitingPaymentPage extends StatefulWidget {
  const AwaitingPaymentPage(
      {Key? key, required this.paymentFuture, required this.onPaid})
      : super(key: key);
  final Future<dartz.Either<Failure, bool>> paymentFuture;
  final VoidCallback? onPaid;

  @override
  _AwaitingPaymentPageState createState() => _AwaitingPaymentPageState();
}

class _AwaitingPaymentPageState extends State<AwaitingPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: widget.paymentFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _popPage(context);
                var result = snapshot.data as dartz.Either<Failure, bool>;
                return result.fold(
                  (l) => Text(
                    "Failed to contact server or Unauthorized",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  (r) {
                    if (r == true) {
                      widget.onPaid?.call();
                      return const Text(
                        "Payment successful",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                        ),
                      );
                    } else {
                      return Text(
                        "Payment failed",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                        ),
                      );
                    }
                  }
                );
              } else {
                return CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onBackground);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _popPage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pop(context);
  }
}
