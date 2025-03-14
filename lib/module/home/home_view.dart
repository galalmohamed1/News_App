import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/module/home/home_view_model/home_view_model.dart';
import 'package:news_app/module/home/widget/category_card_widget.dart';
import 'package:news_app/module/home/widget/drawer_widget.dart';
import 'package:news_app/module/home/widget/selected_category_view.dart';
import 'package:news_app/network/api_network.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context);
    var local=AppLocalizations.of(context)!;

    List<String> _theme = [
      local.light,
      local.dark,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          provider.selectedCategoryModel==null?"Home":provider.selectedCategoryModel!.categoryName,
          style:const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: ColorPalette.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body:provider.selectedCategoryModel==null?SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0),
              child:  Text(
                "Good Morning \nHere is Some News For You",
                style: TextStyle(
                  color: ColorPalette.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ListView.separated(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              padding:const EdgeInsets.symmetric(vertical: 10.0),
              itemBuilder: (context, index) => CategoryCardWidget(
                  index: index,
                  CategoryModel: provider.categoriesList[index],
                onCategoryClick: provider.onCategoryClicked,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 15,),
              itemCount: provider.categoriesList.length,
            ),
          ],
        ),
      ):SelectedCategoryView(
        selectedCategoryModel: provider.selectedCategoryModel!,
      ),
    );
  }

}
