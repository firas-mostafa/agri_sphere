import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/presentation/home/screens/widgets/header.dart';
import 'package:mobile_app/presentation/home/screens/widgets/my_sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, builder) => [
          MySliverAppBar(child: Header()),
        ],
        body: ListView(children: [SizedBox(height: context.setHeight(50))]),
      ),
    );
  }
}
