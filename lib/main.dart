import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiet_case_project/features/home/view/home_view.dart';
import 'package:wiet_case_project/features/home/viewmodel/home_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final homeViewModel = HomeViewModel();
        homeViewModel.init();
        return homeViewModel;
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
