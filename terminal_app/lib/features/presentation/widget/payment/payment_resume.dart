
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
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withAlpha(30)
        ),
        borderRadius: BorderRadius.circular(6.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Payment Summary',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Articles (${cart.items.length}):',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                  )
                ),
                Text(
                  '${Formaters.price.format(totalArticlesPrice)} €',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Before tax:',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                  )
                ),
                Text(
                  '${Formaters.price.format(totalArticlesPrice - tax)} €',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax collected:',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                  )
                ),
                Text(
                  '${Formaters.price.format(tax)} €',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
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
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ),
                Text(
                  '${Formaters.price.format(totalArticlesPrice)} €',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
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