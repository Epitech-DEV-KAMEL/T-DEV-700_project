
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/core/themes/common_style.dart';
import 'package:terminal_app/core/utils/formaters.dart';
import 'package:terminal_app/core/widgets/numeric_input/numeric_input.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/domain/entities/cart_article.dart';

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
          decoration: CommonStyle.articleCardBoxDecoration(context),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: CommonStyle.thumnailBoxDecoration(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                article.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CommonStyle.articleCardTitleTextStyle(context),
              ),
              const SizedBox(height: 2.0),
              Text(
                article.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CommonStyle.articleCardDescriptionTextStyle(context),
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
                '${Formaters.price.format(article.price)} €',
                style: CommonStyle.articleCardPriceTextStyle(context),  
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      cart.removeCartArticle(articleIndex);
                    }, 
                    child: const Icon(
                      Icons.delete,
                      size: 16,
                      color: ColorTheme.primary,
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(2.0)
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  NumericInput(
                    minimum: 0,
                    value: article.amount,
                    onUpdate: (amount) {
                      cart.updateCartArticleAmount(articleIndex, amount);
                    }
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}