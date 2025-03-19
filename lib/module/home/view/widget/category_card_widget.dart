import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/module/home/home_view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatelessWidget {
  final int index;
  final CategoryDataModel CategoryModel;
  final void Function(CategoryDataModel) onCategoryClick;
  const CategoryCardWidget({
    super.key,
    required this.index,
    required this.CategoryModel,
    required this.onCategoryClick,
  });

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<HomeViewModel>(context, listen: false);
    return Stack(
      alignment: (index%2==0)?Alignment.bottomRight:Alignment.bottomLeft,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image:DecorationImage(image: AssetImage(CategoryModel.categoryImg)),
          ),
        ),
        GestureDetector(
          onTap: () {
            onCategoryClick(CategoryModel);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 55,
              width: 170,
              margin: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color:_provider.isDark()?ColorPalette.black.withOpacity(0.5):Colors.white38,
                borderRadius: BorderRadius.circular(84.0),
              ),
              child: Directionality(
                textDirection: (index%2==0)?TextDirection.ltr:TextDirection.rtl,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: _provider.isDark()?ColorPalette.white:ColorPalette.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: _provider.isDark()?ColorPalette.black:ColorPalette.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward_ios,color: _provider.isDark()?ColorPalette.white:ColorPalette.black,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
