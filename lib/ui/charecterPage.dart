import 'package:flutter/material.dart';
import 'package:projecttudo/provider/serviceProvider.dart';
import 'package:provider/provider.dart';

class CharecterPage extends StatefulWidget {

  int length=20;
  @override
  _CharecterPageState createState() => _CharecterPageState();

}
class _CharecterPageState extends State<CharecterPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ServiceProvider>(context,listen: false).fetchCharecterDetails(context);
      Provider.of<ServiceProvider>(context,listen: false).listenController(context);
    });


  }
  @override
  Widget build(BuildContext context) {
    var charecterPro=Provider.of<ServiceProvider>(context);



 // int length=20;





    return Scaffold(
        body: charecterPro.fullList.length!=0?
      Stack(
        children: [

          ListView(
            controller:charecterPro.scrollController,
            children: (charecterPro.fullList).map((e) => ListTile(
              onTap: (){

              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(e.img.toString()),
                radius: 20,
              ),
              title: Text(e.name.toString()),
              subtitle: Text(e.birthday.toString()),

            )).toList()

          ),
        ],
      ):Center(child: CircularProgressIndicator())
    );
  }
}
