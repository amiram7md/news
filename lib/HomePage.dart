
import 'package:flutter/material.dart';
import 'package:news/SearchFeature.dart';

import 'CategoryDetails.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = 'HomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.home_filled,
                    size: 35,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedCategory = null;
                    });
                  },
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search,
                    size: 35,
                  ),
                  onPressed: () {
                    showSearch(context: context,
                        delegate: SearchFeature());
                  },
                ),
              ],
              title: Center(
                child: Text(
                  'News App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              backgroundColor: Colors.green,
            ),
            body: selectedCategory == null
                ? CategoryScreen(onCategoryClickCallBack)
                : CategoryDetails(selectedCategory!)),
      ],
    );
  }

  CategoryItem? selectedCategory = null;
  void onCategoryClickCallBack(CategoryItem _categoryItem) {
    setState(() {
      selectedCategory = _categoryItem;
    });
  }
}

class CategoryScreen extends StatelessWidget {
  Function onCategoryClickCallBack;
  CategoryScreen(this.onCategoryClickCallBack);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text(
            'Pick your category of interest',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemBuilder: (buildContext, index) {
              return CategoryGridItem(categoryItemList[index], index,
                      (_categoryItem) {
                    onCategoryClickCallBack(_categoryItem);
                  });
            },
            itemCount: categoryItemList.length,
          ),
        ),
      ],
    );
  }
}

List<CategoryItem> categoryItemList = [
  CategoryItem('sports', 'assets/images/ball.png', 'Sports',
      Color.fromARGB(255, 177, 15, 15)),
  CategoryItem('technology', 'assets/images/technology.png', 'Technology',
      Color.fromARGB(255, 12, 51, 76)),
  CategoryItem('health', 'assets/images/health.png', 'Health',
      Color.fromARGB(255, 179, 62, 113)),
  CategoryItem('business', 'assets/images/business.png', 'Business',
      Color.fromARGB(255, 208, 137, 89)),
  CategoryItem('science', 'assets/images/science.png', 'Science',
      Color.fromARGB(255, 168, 150, 66)),
  CategoryItem('entertainment', 'assets/images/entertainment.png',
      'Entertainment', Color.fromARGB(255, 71, 121, 186)),
];

class CategoryGridItem extends StatelessWidget {
  CategoryItem _categoryItem;
  int index;
  Function onCategoryGridItemClick;
  CategoryGridItem(
      this._categoryItem, this.index, this.onCategoryGridItemClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryGridItemClick(_categoryItem);
      },
      child: Container(
        padding: EdgeInsets.all(2),
        margin: index % 2 == 0
            ? EdgeInsets.fromLTRB(30, 5, 5, 5)
            : EdgeInsets.fromLTRB(5, 5, 30, 5),
        decoration: BoxDecoration(
          color: _categoryItem.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft:
            index % 2 == 0 ? Radius.circular(25) : Radius.circular(0),
            bottomRight:
            index % 2 != 0 ? Radius.circular(25) : Radius.circular(0),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              _categoryItem.imagePath,
              height: 120,
              width: 120,
            ),
            Text(
              _categoryItem.imageName,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem {
  String categoryID;
  String imagePath;
  String imageName;
  Color backgroundColor;
  CategoryItem(
      this.categoryID, this.imagePath, this.imageName, this.backgroundColor);
}

