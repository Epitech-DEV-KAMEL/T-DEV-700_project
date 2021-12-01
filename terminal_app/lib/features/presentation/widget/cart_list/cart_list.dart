
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/presentation/widget/cart_list/cart_article_item.dart';

class CartList extends StatelessWidget {
  const CartList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cart = context.watch<Cart>();
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => CartArticleItem(
          cart: cart, 
          article: cart.items[index],
          articleIndex: index
        )
      ),
    );
  }
}