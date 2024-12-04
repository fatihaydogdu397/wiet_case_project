import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wiet_case_project/features/home/viewmodel/home_viewmodel.dart';

class CatGridWidget extends StatelessWidget {
  const CatGridWidget({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        itemCount: homeViewModel.catTierData?.result.cats.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var catList = homeViewModel.catTierData?.result.cats[index];
          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => AlertDialog(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${catList?.id}'),
                    ],
                  ),
                  alignment: Alignment.center,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: catList?.url ?? "",
                placeholder: (context, url) {
                  return Container(
                      decoration: BoxDecoration(border: Border.all(width: 0.5)),
                      height: 50,
                      width: catList?.width.toDouble(),
                      child: const Center(child: CircularProgressIndicator()));
                },
                errorWidget: (context, url, object) {
                  return Container(
                      decoration: BoxDecoration(border: Border.all(width: 0.5)),
                      height: 50,
                      width: catList?.width.toDouble(),
                      child: const Center(child: CircularProgressIndicator()));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
