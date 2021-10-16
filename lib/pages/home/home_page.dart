import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_food/helpers/platform_aware_asset_image.dart';
import 'package:login_food/pages/food/food_page.dart';
import 'package:login_food/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedDrawerItemIndex = 0;

  final _pageDataList = [
    {
      'icon': Icons.fastfood,
      'title': 'Food',
      'page': FoodPage(),
    },
    {
      'icon': Icons.person,
      'title': 'Profile',
      'page': ProfilePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDataList[_selectedDrawerItemIndex]['title'] as String),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(37.5),
                      child: PlatformAwareAssetImage(
                        assetPath: 'assets/images/profile.jpg',
                        width: 75.0,
                        height: 75.0,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 6.0),
                  Text(
                    'Natthaya Thomyapan',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  //SizedBox(height: 2.0),
                  Text(
                    'natthaya@gmail.com',
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            for (var item in _pageDataList)
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      color: item == _pageDataList[_selectedDrawerItemIndex]
                          ? Colors.pinkAccent
                          : null,
                    ),
                    SizedBox(width: 8.0),
                    Text(item['title'] as String),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _selectedDrawerItemIndex =
                        _pageDataList.indexWhere((element) {
                          return item == element;
                        });
                  });
                  Navigator.of(context).pop();
                },
                selected: item == _pageDataList[_selectedDrawerItemIndex],
              ),
          ],
        ),
      ),
      body: Container(
        child: _pageDataList[_selectedDrawerItemIndex]['page'] as Widget,
      ),
    );
  }
}
