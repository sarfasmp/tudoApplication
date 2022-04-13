import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projecttudo/models/charecterModel.dart';
import 'package:projecttudo/ui/charecterPage.dart';
import 'package:projecttudo/ui/screenMAp.dart';
import 'package:provider/provider.dart';

class ServiceProvider extends ChangeNotifier {
  Response? response;
  Dio dio = Dio();

  CharecterModel? _charecterModel;
  CharecterModel? get charecterModel => _charecterModel;

  List<CharecterDetailSModel> _fullList = [];
  List<CharecterDetailSModel> get fullList => _fullList;

  ScrollController scrollController = ScrollController();

  int offset = 0;

  bool dataLoading = false;

  void listenController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        dataLoading = true;
        if (dataLoading) {
          showDialog(
            barrierDismissible: false,
            builder: (ctx) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
            context: context,
          );
        }

        fetchCharecterDetails(context);
      }
    });
  }

  void fetchCharecterDetails(BuildContext context) async {
    try {
      offset = offset + 1;
      response = await dio.get(
          "https://breakingbadapi.com/api/characters?limit=10&offset=${offset.toString()}");
      if (dataLoading) {
        Navigator.pop(context);
      }
      print(response?.data ?? "");
      print(response?.data.runtimeType);
      _charecterModel = CharecterModel.fromJson(response?.data);

      _fullList = _fullList + _charecterModel!.details!;

      print(_fullList.length);
      notifyListeners();
    } on DioError catch (e) {
      print(e);
    }
  }

  int currentIndex=0;
  List<Widget> screen=[
    MyHomePage(),
    CharecterPage(),
  ];
  void bottomBarSwitching(int val){
    currentIndex=val;
    notifyListeners();

  }
}
