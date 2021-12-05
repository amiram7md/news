import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/CategoryDetails.dart';


import 'Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyHomePage.routeName : (context)=> MyHomePage(),
        CategoryDetails.routeName : (context)=> MyHomePage(),
        Settings.routeName : (context)=> MyHomePage(),
      },
      initialRoute: MyHomePage.routeName,
    );
  }

}

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
              builder :(context) => IconButton(
                icon: Icon(
                  Icons.view_headline,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Center(
              child: Text('News App' ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: Colors.green,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.green,
                    padding: EdgeInsets.all(50),
                    child: Center(
                      child: Text('News App!' ,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white
                        ),
                      ),
                    ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20,20,0,0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedCategory = null ;
                            Navigator.pop(context);
                          });
                        },
                        child: Icon(
                          Icons.list,
                          size: 40,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            selectedCategory = null ;
                            Navigator.pop(context);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Categories',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20,0,0,0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                        },
                        child: Icon(
                          Icons.settings,
                          size: 40,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body:
          selectedCategory==null
              ? CategoryScreen(onCategoryClickCallBack)
              : CategoryDetails(selectedCategory!)
        ),
      ],
    );
  }
  CategoryItem? selectedCategory = null ;
  void onCategoryClickCallBack(CategoryItem _categoryItem){
    setState(() {
      selectedCategory = _categoryItem ;
    });
  }
}

class CategoryScreen extends StatelessWidget{
  Function onCategoryClickCallBack ;
  CategoryScreen(this.onCategoryClickCallBack);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text('Pick your category of interest',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8
            ),
            itemBuilder: (buildContext , index){
              return CategoryGridItem(categoryItem[index], index,
                      (_categoryItem){
                onCategoryClickCallBack(_categoryItem);
                      }
              );
            },
            itemCount: categoryItem.length,
          ),
        ),
      ],
    );
  }
}

List<CategoryItem> categoryItem = [
  CategoryItem('categoryID', 'assets/images/ball.png',
      'Sports', Color.fromARGB(255, 201, 28, 34)
  ),
  CategoryItem('categoryID', 'assets/images/Politics.png',
      'Politics', Color.fromARGB(255, 0, 62, 144)
  ),
  CategoryItem('categoryID', 'assets/images/health.png',
      'Health', Color.fromARGB(255, 237, 30, 121)
  ),
  CategoryItem('categoryID', 'assets/images/bussines.png',
      'Business', Color.fromARGB(255, 207, 126, 72)
  ),
  CategoryItem('categoryID', 'assets/images/environment.png',
      'Environment', Color.fromARGB(255, 72, 130, 207)
  ),
  CategoryItem('categoryID', 'assets/images/science.png',
      'Science', Color.fromARGB(255, 242, 211, 82)),

];

class CategoryGridItem extends StatelessWidget {
  CategoryItem _categoryItem ;
  int index ;
  Function onCategoryGridItemClick ;
  CategoryGridItem(this._categoryItem , this.index ,
     this.onCategoryGridItemClick );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryGridItemClick(_categoryItem);
      },
      child: Container(
        padding: EdgeInsets.all(2),
        margin: index%2==0 ? EdgeInsets.fromLTRB(30, 5, 5, 5)
        : EdgeInsets.fromLTRB(5, 5, 30, 5),
        decoration: BoxDecoration(
          color: _categoryItem.backgroundColor ,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: index%2==0 ? Radius.circular(25)
                : Radius.circular(0),
            bottomRight: index%2!=0 ? Radius.circular(25)
                : Radius.circular(0),
          ),
        ),
        child: Column(
          children: [
            Image.asset(_categoryItem.imagePath ,
              height: 120,
            ),
            Text(_categoryItem.imageName ,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem{
  String categoryID;
  String imagePath ;
  String imageName;
  Color backgroundColor;
  CategoryItem(this.categoryID,this.imagePath,
      this.imageName,this.backgroundColor);
}
