import 'package:flutter/material.dart';
import 'package:news/CategoryDetails.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        CategoryDetails.routeName: (context) => MyHomePage(),
        NewsDescription.routeName : (context) => NewsDescription(),

      },
      initialRoute: MyHomePage.routeName,
    );
  }
}
//          drawer: Drawer(
//             child: Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   color: Colors.green,
//                     padding: EdgeInsets.all(50),
//                     child: Center(
//                       child: Text('News App!' ,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 30,
//                           color: Colors.white
//                         ),
//                       ),
//                     ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.fromLTRB(20,20,0,0),
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           setState(() {
//                             selectedCategory = null ;
//                             Navigator.pop(context);
//                           });
//                         },
//                         child: Icon(
//                           Icons.list,
//                           size: 40,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: (){
//                           setState(() {
//                             selectedCategory = null ;
//                             Navigator.pop(context);
//                           });
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('Categories',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.fromLTRB(20,0,0,0),
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                         },
//                         child: Icon(
//                           Icons.settings,
//                           size: 40,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: (){
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('Settings',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),