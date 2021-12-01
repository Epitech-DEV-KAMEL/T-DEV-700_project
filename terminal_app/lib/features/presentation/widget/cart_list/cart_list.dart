
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/presentation/widget/cart_list/cart_article_item.dart';
import 'package:terminal_app/features/presentation/widget/cart_list/cart_list_footer.dart';

import 'cart_total.dart';

class CartList extends StatelessWidget {
  const CartList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = context.watch<Cart>();
    
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cart.items.length,
              itemBuilder: (context, index) => CartArticleItem(
                cart: cart, 
                article: cart.items[index],
                articleIndex: index
              )
            ),
          ),
        ),
        const CartListFooter()
      ]
    );
  }
}