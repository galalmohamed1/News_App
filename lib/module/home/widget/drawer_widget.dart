import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/module/home/home_view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    var _provider = Provider.of<HomeViewModel>(context, listen: false);
    return Drawer(
      backgroundColor: ColorPalette.black,
      child: Column(
        children: [
          Container(
            height: size.height*0.25,
            color: ColorPalette.white,
            child:const Center(
              child: Text(
                "News App",
                style: TextStyle(
                  color: ColorPalette.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              _provider.goToHome();
            },
            child: const Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.home_filled,color: ColorPalette.white,size: 32,),
                SizedBox(width: 15,),
                Text(
                  "Go To Home",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: ColorPalette.white,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 50,
            thickness: 2,
            color: ColorPalette.white,
            indent: 15,
            endIndent: 25,
          ),
          const SizedBox(height: 20,),

          // CustomDropdown<String>(
          //   hintText: 'Select Theme role',
          //   items: _theme,
          //   decoration: CustomDropdownDecoration(
          //     closedBorder: Border.all(color:AppColor.purpel,width: 2),
          //     closedBorderRadius:BorderRadius.circular(16),
          //     closedSuffixIcon: Icon(
          //       Icons.arrow_drop_down,
          //       color: AppColor.purpel,
          //       size: 30,
          //     ),
          //     closedFillColor: provider.isDark()? AppColor.black:AppColor.white,
          //     hintStyle: TextStyle(color: AppColor.purpel,fontSize: 20,
          //       fontWeight: FontWeight.w700,),
          //     listItemStyle: TextStyle(color: AppColor.purpel,fontSize: 20,
          //       fontWeight: FontWeight.w700,),
          //     headerStyle: TextStyle(color: AppColor.purpel,
          //       fontSize: 20,
          //       fontWeight: FontWeight.w700,
          //     ),
          //     expandedFillColor: provider.isDark()? AppColor.black:AppColor.white,
          //   ),
          //   onChanged: (value) {
          //     if(value== local.light) provider.setCurrentTheme(ThemeMode.light);
          //     if(value== local.dark) provider.setCurrentTheme(ThemeMode.dark);
          //   },
          // ),

        ],
      ),
    );
  }
}
