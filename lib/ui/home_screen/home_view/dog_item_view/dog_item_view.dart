import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider_demo/data_modal/animal_categoryr_items_data_modal.dart';

class DogItemView extends StatefulWidget {
  final List<AnimalCategoryrItemsDataModal> animalCategoryItems;


  const DogItemView(this.animalCategoryItems, {Key? key})
      : super(key: key);

  @override
  State<DogItemView> createState() => _DogItemViewState();
}

class _DogItemViewState extends State<DogItemView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 230,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.animalCategoryItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 10),
                    child: Center(
                      child: SizedBox(
                        height: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            key: UniqueKey(),
                            imageUrl: widget.animalCategoryItems[index].uri,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: SizedBox(
                                  height: 140,
                                  child: Image.asset(
                                    "asset/image/placholder.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          widget.animalCategoryItems[index].gender,
                          style: const TextStyle(
                            color: Color(0xff5F5B5B),
                            fontSize: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            widget.animalCategoryItems[index].name,
                            style: const TextStyle(
                              color: Color(0xff5F5B5B),
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.animalCategoryItems[index].name,
                      style: const TextStyle(
                        color: Color(0xff333333),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.animalCategoryItems[index].shopename,
                      style:
                          const TextStyle(color: Color(0xff5F5B5B), fontSize: 10),
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
}

// void main() {
//   final testMap = {"a": 1, "b": 2, "c": 3, "d": 4, "e": 5};
//   for (final mapEntry in testMap.entries) {
//     final key = mapEntry.key;
//     final value = mapEntry.value;
//     print('Key: $key, Value: $value');  // Key: a, Value: 1 ...
//   }
// }

// GridView.builder(
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisExtent: 220,
// ),
// shrinkWrap: true,
// itemCount: animalCategoryItems.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.all(10),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.grey.shade200,
// offset: const Offset(0, 10),
// blurRadius: 10,
// ),
// ],
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// height: 120,
// child: Image.network(animalCategoryItems[index].uri,fit: BoxFit.fill),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 8.0, bottom: 5),
// child: Row(
// children:  [
// Text(
// animalCategoryItems[index].gender,
// style: const TextStyle(
// color: Color(0xff5F5B5B),
// fontSize: 12,
// ),
// ),
// const Padding(
// padding:
// EdgeInsets.symmetric(horizontal: 5),
// child: Text(
// "2 YEARS",
// style:TextStyle(
// color: Color(0xff5F5B5B),
// fontSize: 12,
// ),
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text(
// animalCategoryItems[index].name,
// style: const TextStyle(
// color: Color(0xff333333),
// fontSize: 14,
// fontWeight: FontWeight.w600,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text(
// animalCategoryItems[index].shopename,
// style: const TextStyle(
// color: Color(0xff5F5B5B), fontSize: 12),
// ),
// ),
// ],
// ),
// ),
// );
// },
// );
