
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:terminal_app/core/entities/article.dart';
import 'package:terminal_app/features/domain/entities/cart_article.dart';

class Cart extends ChangeNotifier {
  final List<CartArticle> _articles = [];

  UnmodifiableListView<CartArticle> get items => UnmodifiableListView(_articles);
  double get totalPrice => _articles.fold(0, (total, current) => total + (current.price * current.amount));

  void add(Article article, int amount) {
    assert(amount > 0);

    int articleIndex = _articles.indexWhere((element) => element.id == article.id);
    bool alreadyInCart = articleIndex != -1;

    if (alreadyInCart) {
      _articles[articleIndex].amount += amount;
    } else {
      _articles.add(CartArticle.fromEntity(article, amount));
    }

    notifyListeners();
  }

  void updateCartArticleAmount(int articleIndex, int amount) {
    assert(amount >= 0);

    if (amount == 0) {
      removeCartArticle(articleIndex);
    } else {
      _articles[articleIndex].amount = amount;
      notifyListeners();
    }
  }

  void removeCartArticle(int articleIndex) {
    _articles.removeAt(articleIndex);
    notifyListeners();
  }

  void clear() {
    _articles.clear();
    notifyListeners();
  }
}