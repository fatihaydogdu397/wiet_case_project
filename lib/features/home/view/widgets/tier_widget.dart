import 'package:flutter/material.dart';
import 'package:wiet_case_project/features/home/view/widgets/tier_level_painter.dart';
import 'package:wiet_case_project/features/home/viewmodel/home_viewmodel.dart';

class TierWidget extends StatelessWidget {
  const TierWidget({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(300, 300),
          painter: TierLevelPainter(
            tierPoints: homeViewModel.catTierData?.result.tierPoints ?? 0,
            currentTier: homeViewModel.catTierData?.result.currentTier ?? "",
            tiers: homeViewModel.catTierData?.result.tiers ?? [],
          ),
        ),
        Container(
          decoration:
              BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.withOpacity(0.2)), borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                Text(
                  (homeViewModel.catTierData?.result.currentTier ?? "").toUpperCase(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.red),
                ),
                const Text(
                  "TIER LEVEL",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
