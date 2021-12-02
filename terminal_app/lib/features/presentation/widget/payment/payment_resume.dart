
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/core/utils/formaters.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';

class PaymentResume extends StatelessWidget {
  const PaymentResume({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = context.read<Cart>();
    double totalArticlesPrice = cart.totalPrice;
    double tax = totalArticlesPrice * 0.12;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12
        ),
        borderRadius: BorderRadius.circular(6.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Payment Summary',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Articles (${cart.items.length}):',
                  style: const TextStyle(
                    color: Colors.black45,
                  )
                ),
                Text(
                  '${Formaters.price.format(totalArticlesPrice)} €',
                  style: const TextStyle(
                    color: Colors.black45,
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Before tax:',
                  style: TextStyle(
                    color: Colors.black45,
                  )
                ),
                Text(
                  '${Formaters.price.format(totalArticlesPrice)} €',
                  style: const TextStyle(
                    color: Colors.black45,
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tax collected:',
                  style: TextStyle(
                    color: Colors.black45,
                  )
                ),
                Text(
                  '${Formaters.price.format(tax)} €',
                  style: const TextStyle(
                    color: Colors.black45,
                  )
                )
              ],
            ),
            const Divider(
              height: 40.0,
              thickness: 1.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
                ),
                Text(
                  '${Formaters.price.format(totalArticlesPrice + tax)} €',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  )
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}