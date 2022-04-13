import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projecttudo/ui/bottomNavScreen.dart';
import 'package:projecttudo/ui/screenMAp.dart';
import 'ui/charecterPage.dart';
import 'package:projecttudo/provider/serviceProvider.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=> ServiceProvider())

      ],

        child: MyApp() ,

      )

     );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home:CharecterPage(),
     initialRoute: "/",
     routes: {

        "/" :(context)=>BottomNavController(),



     },

     // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


