import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/presentation/store/widget/items_list.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: ItemsList()));
  }
}
