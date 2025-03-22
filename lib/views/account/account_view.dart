import 'package:flutter/material.dart';
import 'package:flutter_tech_days/views/account/account_content.dart';
import 'package:flutter_tech_days/views/account/account_view_model.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AccountViewModel(),
      builder: (context, child) {
        final viewModel = Provider.of<AccountViewModel>(context);

        return AccountContent(
          viewModel: viewModel,
        );
      },
    );
  }
}
