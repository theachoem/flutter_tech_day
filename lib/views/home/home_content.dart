import 'package:flutter/material.dart';
import 'package:flutter_tech_days/views/account/account_view.dart';
import 'package:flutter_tech_days/views/home/home_view_model.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tech Day"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AccountView(),
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          "This is counter: ${viewModel.counter}",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.increase(),
        child: Icon(Icons.add),
      ),
    );
  }
}
