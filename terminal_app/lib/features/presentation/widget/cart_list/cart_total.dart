
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/core/utils/formaters.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          'Total',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500
          ),
        ),
        Text(
          '${Formaters.price.format(cart.totalPrice)} €',
          style: const TextStyle(
            color: ColorTheme.primary,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}