import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/core/widgets/core_elevated_button/core_elevated_button.dart';
import 'package:terminal_app/core/widgets/qr_code/qr_code_windows.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/domain/usecases/articles/get_article.dart';
import 'package:terminal_app/features/presentation/pages/awaiting_add_article_page.dart';
import 'package:terminal_app/features/presentation/pages/payment_page.dart';
import 'package:terminal_app/features/presentation/widget/cart_list/cart_total.dart';
import 'package:terminal_app/injection_container.dart';

class CartListFooter extends StatelessWidget {
  const CartListFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _customButtonStyle = ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(14.0),
        primary: ColorTheme.primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)));

    Cart cart = context.read<Cart>();

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: const Border(
              top: BorderSide(
            color: ColorTheme.borderColor,
          ))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const CartTotal(),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: _customButtonStyle,
                    onPressed: () {
                      cart.clear();
                    },
                    child: const Icon(Icons.delete)),
                const SizedBox(width: 10.0),
                ElevatedButton(
                    style: _customButtonStyle,
                    onPressed: () {
                      _navigateAndAddArticle(context, cart);
                    },
                    child: const Icon(Icons.qr_code)),
                const SizedBox(width: 10.0),
                Expanded(
                  child: CoreElevatedButton(
                    text: 'Buy Now',
                    onPressed: () => _navigateToPayment(context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _navigateAndAddArticle(BuildContext context, Cart cart) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const QRCodeWindows()));

    if (result == null) return;
    String? barcode = (result as Barcode).code;
    if (barcode == null) return;
    int? articleId = int.tryParse(barcode);
    if (articleId == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AwaitingAddArticlePage(
          getArticleFuture: sl<GetArticle>().execute(GetArticleParams(id: articleId)),
          onAdded: (article) {
            cart.add(article, 1);
          },
        ),
      ),
    );
  }

  void _navigateToPayment(BuildContext context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PaymentPage()));
  }
}
