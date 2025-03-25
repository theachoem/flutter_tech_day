part of 'home_view.dart';

class _HomeContent extends StatelessWidget {
  const _HomeContent({
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: buildAppBar(themeProvider, context),
      floatingActionButton: FtdCartButton(),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(ThemeProvider themeProvider, BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => themeProvider.toggleDarkMode(),
        icon: themeProvider.isDarkMode
            ? Icon(Icons.light_mode_outlined)
            : Icon(Icons.dark_mode_outlined),
      ),
      title: Text("Flutter Tech Day"),
      actions: [
        IconButton(
          icon: Icon(Icons.person_outline),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    if (viewModel.products == null) {
      return Center(child: CircularProgressIndicator.adaptive());
    }

    return GridView.builder(
      itemCount: viewModel.products!.length,
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        crossAxisCount: MediaQuery.of(context).size.width ~/ 160,
        childAspectRatio: 2 / 3,
      ),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) {
        final product = viewModel.products![index];
        return _ProductCard(
          product: product,
          onAddToCart: () async {
            await context.read<CartProvider>().addToCart(product);
          },
        );
      },
    );
  }
}
