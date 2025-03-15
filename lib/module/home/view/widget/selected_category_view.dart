import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/module/home/home_view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectedCategoryView extends StatefulWidget {
  final CategoryDataModel selectedCategoryModel;
  const SelectedCategoryView({super.key, required this.selectedCategoryModel});

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  late HomeViewModel _Provider;
  @override
  void initState() {
    _Provider = Provider.of<HomeViewModel>(context, listen: false);
    Future.wait([
      _Provider.getAllSources(),
    ]).then((value) {
      if (value[0]) {
        _Provider.getAllArticles();
        }
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: _Provider.sourcesList.length,
            child: TabBar(
              onTap: _Provider.setCurrentSelectedIndex,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              padding: const EdgeInsets.symmetric(vertical: 10),
                tabs: _Provider.sourcesList.map(
                      (e) => Text(e.name),
                ).toList(),
            ),
        ),
        Expanded(
          child: Skeletonizer(
            enabled: _Provider.articlesList.isEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10.0,),
                  itemBuilder: (context, index) => SizedBox(
                    width: 320,
                    height: 360,
                    child: CachedNetworkImage(
                      imageUrl: _Provider.articlesList[index].urlToImage,
                      imageBuilder: (context, imageProvider) => Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.red,
                                      BlendMode.colorBurn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _Provider.articlesList[index].title,
                              style: const TextStyle(
                                  height: 1.2,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _Provider.articlesList[index].author,
                                    style:const TextStyle(
                                      height: 1.2,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ),
                                Text(
                                  _Provider.articlesList[index].publishedAt,
                                  style: const TextStyle(
                                    height: 1.2,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFA0A0A0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                        child: const CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.grey,
                        size: 60,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: 10,),
                  itemCount: _Provider.articlesList.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
