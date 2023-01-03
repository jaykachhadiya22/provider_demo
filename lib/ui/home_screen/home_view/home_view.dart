import 'dart:core';
import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/ui/home_screen/home_view/home_view_modal.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'dog_item_view/dog_item_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    homeViewModal.readBannerData().then((value) {
      homeViewModal.readCategoryItem();
    });
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        print(scrollController.offset);
      }
    });
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  HomeViewModal homeViewModal = HomeViewModal();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeViewModal,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text("Sticky Header",
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0),
        body: Consumer<HomeViewModal>(
          builder: (context, banner, child) {
            return banner.ready
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 1200,
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                    height: 150.0,
                                    autoPlay: true,
                                    autoPlayAnimationDuration:
                                        const Duration(seconds: 1),
                                    viewportFraction: 1),
                                items: banner.banner.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.only(
                                            right: 5, left: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(i.uri,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          }, fit: BoxFit.fill),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                "Available For adoption",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black26),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Consumer<HomeViewModal>(
                              builder: (context, value, child) {
                                return StickyHeader(
                                  callback: (double1) async {
                                    Future.delayed(const Duration(seconds: 0))
                                        .then((value1) {
                                      if (double1 <= -0.1) {
                                        value.giveElevatoinTabBar(true);
                                        //  setState(() {});
                                      } else {
                                        value.giveElevatoinTabBar(false);
                                      }
                                    });
                                  },
                                  header: Container(
                                    decoration: value.giveElevatoin
                                        ? const BoxDecoration(
                                            color: Color(0X02000000),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black54,
                                                blurRadius: 2.0,
                                                offset: Offset(0.5, 0.5),
                                              ),
                                            ],
                                          )
                                        : const BoxDecoration(),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                bottom: 10,
                                                top: 0,
                                                right: 20),
                                            child: SizedBox(
                                              height: 35,
                                              child: Consumer<HomeViewModal>(
                                                builder:
                                                    (context, value, child) {
                                                  return ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: value
                                                        .animalCategory.length,
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              value.changeCategoryIndex(index);
                                                              value.readyCategoryItems = false;
                                                              value.animalCategoryItems = [];
                                                              value.readCategoryItem();
                                                            },
                                                            child: Container(
                                                              height: 34,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: value.categoryIndex == index
                                                                    ? Colors.blueGrey
                                                                    : Colors
                                                                        .black12,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                      "     ${value.animalCategory[index].aname}     ",
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w600))),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          Container(
                                                            width: 10,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  content: SizedBox(
                                    height: 900,
                                    width: double.maxFinite,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: value.readyCategoryItems
                                                ? DogItemView(
                                                    value.animalCategoryItems)
                                                : const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                            //   Text("${categoryList[value.categoryIndex]}"),
                                            ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
