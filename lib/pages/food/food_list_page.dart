import 'package:flutter/material.dart';
import 'package:login_food/helpers/platform_aware_asset_image.dart';
import 'package:login_food/models/food_item.dart';
import 'package:google_fonts/google_fonts.dart';

import 'food_details.dart';

class FoodListPage extends StatefulWidget {
  static const routeName = '/food_list_page';

  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var items = [
    FoodItem(
      id: 1,
      name: 'ข้าวไข่เจียว',
      price: 25,
      image: 'kao_kai_jeaw.jpg',
    ),
    FoodItem(
      id: 2,
      name: 'ข้าวหมูแดง',
      price: 30,
      image: 'kao_moo_dang.jpg',
    ),
    FoodItem(
      id: 3,
      name: 'ข้าวมันไก่',
      price: 30,
      image: 'kao_mun_kai.jpg',
    ),
    FoodItem(
      id: 4,
      name: 'ข้าวหน้าเป็ด',
      price: 40,
      image: 'kao_na_ped.jpg',
    ),
    FoodItem(
      id: 5,
      name: 'ข้าวผัด',
      price: 30,
      image: 'kao_pad.jpg',
    ),
    FoodItem(
      id: 6,
      name: 'ผัดซีอิ๊ว',
      price: 30,
      image: 'pad_sie_eew.jpg',
    ),
    FoodItem(
      id: 7,
      name: 'ผัดไทย',
      price: 35,
      image: 'pad_thai.jpg',
    ),
    FoodItem(
      id: 8,
      name: 'ราดหน้า',
      price: 30,
      image: 'rad_na.jpg',
    ),
    FoodItem(
      id: 9,
      name: 'ส้มตำไก่ย่าง',
      price: 80,
      image: 'som_tum_kai_yang.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var foodItem = items[index];

          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.all(8.0),
            elevation: 5.0,
            shadowColor: Colors.black.withOpacity(0.2),
            child: InkWell(
              onTap: () => _handleClickFoodItem(foodItem),
              child: Row(
                children: <Widget>[
                  PlatformAwareAssetImage(
                    assetPath: 'assets/images/${foodItem.image}',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  /*Image.asset(
                    'assets/images/${foodItem.image}',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),*/
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                foodItem.name,
                                style: GoogleFonts.prompt(fontSize: 20.0),
                              ),
                              Text(
                                '${foodItem.price.toString()} บาท',
                                style: GoogleFonts.prompt(fontSize: 15.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _handleClickFoodItem(FoodItem foodItem) {
    Navigator.pushNamed(
      context,
      FoodDetailsPage.routeName,
      arguments: foodItem,
    );
  }
}
