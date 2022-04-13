import 'package:flutter/material.dart';
import 'package:projecttudo/provider/serviceProvider.dart';
import 'package:provider/provider.dart';

class BottomNavController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var servicePro =Provider.of<ServiceProvider>(context);

    return Scaffold(
      body: servicePro.screen[servicePro.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:servicePro.currentIndex ,
        onTap: (val){
          servicePro.bottomBarSwitching(val);

        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map"
          ) ,
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Details"
          )
        ],
      ),
    );
  }
}
