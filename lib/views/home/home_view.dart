import 'package:flutter/material.dart';
import 'package:flutter_tech_days/widgets/ftd_cart_button.dart';
import 'package:flutter_tech_days/views/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tech_days/core/models/product_model.dart';
import 'package:flutter_tech_days/providers/cart_provider.dart';
import 'package:flutter_tech_days/providers/theme_provider.dart';

part 'home_content.dart';
part 'local_widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      builder: (context, child) {
        final viewModel = Provider.of<HomeViewModel>(context);
        return _HomeContent(
          viewModel: viewModel,
        );
      },
    );
  }
}
