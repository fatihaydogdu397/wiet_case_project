import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiet_case_project/features/home/view/widgets/cat_grid_widget.dart';
import 'package:wiet_case_project/features/home/view/widgets/tier_widget.dart';
import 'package:wiet_case_project/features/home/viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CatGridWidget(homeViewModel: homeViewModel),
          TierWidget(homeViewModel: homeViewModel),
        ],
      )),
    );
  }
}
