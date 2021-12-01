
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/domain/entities/cart_article.dart';
import 'package:terminal_app/features/presentation/widget/numeric_input/numeric_input.dart';

class CartArticleItem extends StatelessWidget {
  const CartArticleItem({ 
    Key? key,
    required this.cart,
    required this.article,
    required this.articleIndex
  }) : super(key: key);

  final Cart cart;
  final CartArticle article;
  final int articleIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 120,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)][100]
                    ),
                    child: Text(article.name[0].toUpperCase() + article.name[1]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                    child: CartArticleItemDescription(
                      cart: cart,
                      article: article,
                      articleIndex: articleIndex,
                    )
                  )
                )
              ],
            ),
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
    required this.article,
    required this.articleIndex
  }) : super(key: key);

  final Cart cart;
  final CartArticle article;
  final int articleIndex;

  @override
  Widget build(BuildContext context) {
    NumberFormat numFormat = NumberFormat('####.##', 'en_US');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${article.name} [${article.id}]',
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
                '${numFormat.format(article.price)} €',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),  
              ),
              NumericInput(
                minimum: 0,
                value: article.amount,
                onUpdate: (amount) {
                  cart.updateCartArticleAmount(articleIndex, amount);
                }
              )
            ],
          ),
        )
      ],
    );
  }
}