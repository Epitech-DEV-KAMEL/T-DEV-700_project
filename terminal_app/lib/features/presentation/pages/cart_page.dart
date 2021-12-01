import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/core/entities/article.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/presentation/widget/cart_list/cart_list.dart';
import 'package:terminal_app/features/presentation/widget/cart_list/cart_total.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Cart cart = context.watch<Cart>();
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: const Text(
          'My Cart', 
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int articleId = Random().nextInt(11);
          String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam accumsan ipsum vitae odio pretium finibus. Etiam rutrum leo et hendrerit blandit. Fusce viverra ex a iaculis luctus. Etiam sodales a quam vel scelerisque. Phasellus euismod dapibus erat, eget consequat neque blandit non. Mauris et nisl ut massa euismod sollicitudin. Duis sit amet arcu vitae augue egestas congue at et leo. Nullam sit amet vestibulum ante, a auctor urna.';
          Article article = Article(
            id: articleId,
            name: 'Article $articleId',
            description: description.substring(Random().nextInt(description.length)),
            price: Random().nextDouble() * 200.0
          );
          int amount = Random().nextInt(10) + 1;
          cart.add(article, amount);
        },
        child: const Icon(Icons.shopping_basket),
        backgroundColor: Colors.blueAccent[100],
      ),
      body: const CartList()
    );
  }
}