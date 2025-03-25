import 'package:flutter/material.dart';
import 'package:flutter_tech_days/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class FtdCartButton extends StatelessWidget {
  const FtdCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Hero(
      tag: "FtdCartButton",
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
          buildBadge(cartProvider, context),
        ],
      ),
    );
  }

  Widget buildBadge(CartProvider cartProvider, BuildContext context) {
    return Positioned(
      top: -4.0,
      right: -4.0,
      child: AnimatedSwitcher(
        duration: Durations.medium1,
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: Material(
          key: ValueKey(cartProvider.products.length),
          elevation: 8.0,
          color: ColorScheme.of(context).error,
          shape: CircleBorder(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
            constraints: BoxConstraints(minWidth: 24),
            alignment: Alignment.center,
            child: Text(
              cartProvider.products.length.toString(),
              style: TextTheme.of(context)
                  .labelMedium
                  ?.copyWith(color: ColorScheme.of(context).onError),
            ),
          ),
        ),
      ),
    );
  }
}
