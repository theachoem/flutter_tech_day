part of '../home_view.dart';

class _ProductCard extends StatefulWidget {
  const _ProductCard({
    required this.product,
    required this.onAddToCart,
  });

  final ProductModel product;
  final Future<void> Function() onAddToCart;

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool loading = false;

  Future<void> addToCart() async {
    loading = true;
    setState(() {});

    await widget.onAddToCart();

    loading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          buildContents(),
          buildAddToCartButton(),
        ],
      ),
    );
  }

  Widget buildAddToCartButton() {
    return IconButton.outlined(
      icon: loading ? CircularProgressIndicator.adaptive() : Icon(Icons.add),
      onPressed: loading ? null : () => addToCart(),
    );
  }

  Widget buildContents() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.product.image != null)
            Image.network(
              widget.product.image!,
              height: 80,
              width: 80,
              fit: BoxFit.contain,
            ),
          SizedBox(height: 8.0),
          Text(widget.product.title ?? 'N/A', maxLines: 2),
          Text(widget.product.price?.toStringAsFixed(2) ?? "N/A"),
        ],
      ),
    );
  }
}
