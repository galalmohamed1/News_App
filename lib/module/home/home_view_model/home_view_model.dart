import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_assets.dart';
import 'package:news_app/main.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/sources_model.dart';
import 'package:news_app/network/api_network.dart';

import '../../../models/category_model.dart';

class HomeViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  CategoryDataModel? _selectedCategory;
  List<Source> _sourcesList = [];
  List<Article> _articlesList = [];
  final List<CategoryDataModel> _categoriesList=[
    CategoryDataModel(
      categoryId: "general",
      categoryName: "General",
      categoryImg: AppAssets.GeneralImg,
    ),
    CategoryDataModel(
      categoryId: "business",
      categoryName: "Business",
      categoryImg: AppAssets.businessImg,
    ),
    CategoryDataModel(
      categoryId: "sport",
      categoryName: "Sport",
      categoryImg: AppAssets.SportImg,
    ),
    CategoryDataModel(
      categoryId: "technology",
      categoryName: "Technology",
      categoryImg: AppAssets.TechnologyImg,
    ),
    CategoryDataModel(
      categoryId: "entertainment",
      categoryName: "Entertainment",
      categoryImg: AppAssets.EntertainmentImg,
    ),
    CategoryDataModel(
      categoryId: "health",
      categoryName: "Health",
      categoryImg: AppAssets.HealthImg,
    ),
    CategoryDataModel(
      categoryId: "science",
      categoryName: "Science",
      categoryImg: AppAssets.ScienceImg,
    ),
  ];

  int get selectedIndex => _selectedIndex;

  CategoryDataModel? get selectedCategoryModel => _selectedCategory;

  List<CategoryDataModel> get categoriesList => _categoriesList;

  List<Source> get sourcesList => _sourcesList;

  List<Article> get articlesList => _articlesList;

  void setCurrentSelectedIndex(int index) {
    _selectedIndex = index;
    getAllArticles();
    notifyListeners();
  }

  void onCategoryClicked(CategoryDataModel selectedCategory) {
    _selectedCategory = selectedCategory;
    notifyListeners();
  }

  void goToHome() {
    _selectedCategory = null;
    navigatorKey.currentState!.pop();
    notifyListeners();
  }


  Future<bool> getAllSources() async {
    try {
      _sourcesList = await ApiNetwork.getAllSources(
        _selectedCategory!.categoryId,
      );
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }


  Future<void> getAllArticles() async {
    try {
      _articlesList = await ApiNetwork.getAllArticles(
        _sourcesList[_selectedIndex].id,
      );
      notifyListeners();
    } catch (error) {}
  }

  String currentLanguage="en";
  ThemeMode currentTheme=ThemeMode.light;
  void setCurrentLanguage(String newLanguage){
    if(newLanguage==currentLanguage) return;
    currentLanguage=newLanguage;
    notifyListeners();
  }
  setCurrentTheme(ThemeMode newTheme){
    if(newTheme==currentTheme) return;
    currentTheme=newTheme;
    notifyListeners();
  }
  bool isDark(){
    return currentTheme==ThemeMode.dark;
  }
  bool isEngalsh(){
    return currentLanguage=="en";
  }
}