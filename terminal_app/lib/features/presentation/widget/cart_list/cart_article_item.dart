
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/domain/entities/cart_article.dart';
import 'package:terminal_app/features/presentation/widget/numeric_input/numeric_input.dart';

class CartArticleItem extends StatelessWidget {
  const CartArticleItem({ 
    Key? key,
    required this.cart,
    required this.article
  }) : super(key: key);

  final Cart cart;
  final CartArticle article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                  child: Text(article.name[0].toUpperCase() + article.name[1]),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                  child: CartArticleItemDescription(
                    cart: cart,
                    article: article,
                  )
                )
              )
            ],
          ),
        )
      ),
    );
  }
}

class CartArticleItemDescription extends StatelessWidget {
  const CartArticleItemDescription({ 
    Key? key,
    required this.cart,
    required this.article
  }) : super(key: key);

  final Cart cart;
  final CartArticle article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                article.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                article.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              )
            ],
          )
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${article.price} €',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),  
              ),
              NumericInput(
                minimum: 0,
                onUpdate: (amount) {
                  cart.updateCartArticleAmount(article, amount);
                }
              )
            ],
          ),
        )
      ],
    );
  }
}