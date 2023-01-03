import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_demo/data_modal/animal_categoryr_data_modal.dart';
import '../../../data_modal/animal_categoryr_items_data_modal.dart';
import '../../../data_modal/banner_data_modal.dart';

class HomeViewModal extends ChangeNotifier {
  int categoryIndex = 0;
  List<BannerDataModal> banner = [];
  List<AnimalCategoryrDataModal> animalCategory = [];
  List cid = [];
  List<AnimalCategoryrItemsDataModal> animalCategoryItems = [];
  bool ready = false;
  bool readyCategoryItems = false;
  bool giveElevatoin =false;
  void changeCategoryIndex(int newIndex) {
    categoryIndex = newIndex;
    notifyListeners();
  }

  giveElevatoinTabBar(bool ready)
  {
    giveElevatoin=ready;

    notifyListeners();
  }

  Future readBannerData() async {
    CollectionReference docUser =
        FirebaseFirestore.instance.collection('banner');
    CollectionReference userDoc =
        FirebaseFirestore.instance.collection('animal categories');

    //  QuerySnapshot bannerData = await docUser.get();
    // QuerySnapshot animalCategoryData = await docUser.get();
    var bannerData = await Future.wait([
      docUser.get(),
      userDoc.get(),
    ]);

    banner = bannerData[0].docs.map((e) => BannerDataModal(uri: e['uri'])).toList();
    animalCategory = bannerData[1].docs.map((e) => AnimalCategoryrDataModal(aname: e['aname'], cid: e['cid'])).toList();
    ready = true;
    notifyListeners();

  }

  readCategoryItem() async {
    CollectionReference docUser =
        FirebaseFirestore.instance.collection('cat items');

    QuerySnapshot animalCategoryItemsData = await docUser.get();

    List<AnimalCategoryrItemsDataModal> allAnimalCategoryItems =
        animalCategoryItemsData.docs
            .map((e) => AnimalCategoryrItemsDataModal(
                cid: e['cid'],
                gender: e['gender'],
                name: e['name'],
                shopename: e['shopename'],
                uri: e['uri']))
            .toList();

    for (int i = 0; i < allAnimalCategoryItems.length; i++) {
      if (allAnimalCategoryItems[i].cid == animalCategory[categoryIndex].cid) {
        animalCategoryItems.add(allAnimalCategoryItems[i]);
      }
    }

    // animalCategoryItems.asMap().entries.forEach((entry) {
    //   print('Key = ${entry.key.toString()} : Value = ${entry.value.name}');
    // });
    //
    // print(animalCategoryItems[0].name);

    readyCategoryItems = true;
    notifyListeners();
  }
}
