import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_assets.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/module/home/home_view_model/home_view_model.dart';
import 'package:news_app/module/home/view/widget/category_card_widget.dart';
import 'package:news_app/module/home/view/widget/drawer_widget.dart';
import 'package:news_app/module/home/view/widget/selected_category_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context);
    final List<CategoryDataModel> _categoriesList=[
      CategoryDataModel(
        categoryId: "general",
        categoryName: "General",
        categoryImg:provider.isDark()? AppAssets.GeneralImg_black:AppAssets.GeneralImg,
      ),
      CategoryDataModel(
        categoryId: "business",
        categoryName: "Business",
        categoryImg: provider.isDark()? AppAssets.businessImg_black:AppAssets.businessImg,
      ),
      CategoryDataModel(
        categoryId: "sport",
        categoryName: "Sport",
        categoryImg: provider.isDark()? AppAssets.SportImg_black:AppAssets.SportImg,
      ),
      CategoryDataModel(
        categoryId: "technology",
        categoryName: "Technology",
        categoryImg: provider.isDark()? AppAssets.TechnologyImg_black:AppAssets.TechnologyImg,
      ),
      CategoryDataModel(
        categoryId: "entertainment",
        categoryName: "Entertainment",
        categoryImg: provider.isDark()? AppAssets.EntertainmentImg_black:AppAssets.EntertainmentImg,
      ),
      CategoryDataModel(
        categoryId: "health",
        categoryName: "Health",
        categoryImg:provider.isDark()? AppAssets.HealthImg_black:AppAssets.HealthImg,
      ),
      CategoryDataModel(
        categoryId: "science",
        categoryName: "Science",
        categoryImg: provider.isDark()? AppAssets.ScienceImg_black:AppAssets.ScienceImg,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: provider.isDark()? ColorPalette.primaryDarkColor:ColorPalette.white,
        title: Text(
          provider.selectedCategoryModel==null?"Home"
              :provider.selectedCategoryModel!.categoryName,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color:provider.isDark()? ColorPalette.white:ColorPalette.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
          }, icon: Icon(Icons.search_rounded,color: provider.isDark()? ColorPalette.white:ColorPalette.primaryColor,),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body:provider.selectedCategoryModel==null?
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
             Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0),
              child:  Text(
                "Good Morning \nHere is Some News For You",
                style: TextStyle(
                  color:provider.isDark()?ColorPalette.white: ColorPalette.black,
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
                  CategoryModel: _categoriesList[index],
                onCategoryClick: provider.onCategoryClicked,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 15,),
              itemCount: _categoriesList.length,
            ),
          ],
        ),
      ):SelectedCategoryView(
        selectedCategoryModel: provider.selectedCategoryModel!,
      ),
    );
  }

}
