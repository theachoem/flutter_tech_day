import 'package:flutter/material.dart';
import 'package:flutter_tech_days/views/home/home_content.dart';
import 'package:flutter_tech_days/views/home/home_view_model.dart';
import 'package:provider/provider.dart';

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
        return HomeContent(
          viewModel: viewModel,
        );
      },
    );
  }
}
