
import 'package:flutter/material.dart';
import 'package:terminal_app/core/themes/color_theme.dart';
import 'package:terminal_app/features/presentation/widget/cart_list/cart_total.dart';

class CartListFooter extends StatelessWidget {
  const CartListFooter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _customButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(14.0),
    primary: ColorTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0)
    )
  );

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black12
          )
        )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const CartTotal(),
            const Padding(padding: EdgeInsets.only(bottom: 24.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: _customButtonStyle,
                  onPressed: () {

                  }, 
                  child: const Icon(
                    Icons.delete
                  )
                ),
                const Padding(padding: EdgeInsets.only(left: 10.0)),
                ElevatedButton(
                  style: _customButtonStyle,
                  onPressed: () {}, 
                  child: const Icon(
                    Icons.qr_code
                  )
                ),
                const Padding(padding: EdgeInsets.only(left: 10.0)),
                Expanded(
                  child: ElevatedButton(
                    style: _customButtonStyle,
                    onPressed: () {}, 
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}