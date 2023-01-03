import 'package:flutter/material.dart';
import 'package:tabbed_sliverlist/tabbed_sliverlist.dart';
//
// class SliverListView extends StatelessWidget {
//   SliverListView(int i, {Key? key}) : super(key: key);
//   final listitems = [
//     'item1',
//     'item2',
//     'item3',
//     'item4',
//     'item5',
//     'item6',
//     'item7',
//     'item8',
//     'item9',
//     'item10',
//     'item11',
//     'item12',
//     'item13',
//     'item14',
//     'item15',
//     'item16',
//     'item18',
//     'item19',
//     'item20'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TabbedList(
//           tabLength: 3,
//           sliverTabBar: const SliverTabBar(
//               title: Text('Tabbed SliverList'),
//               centerTitle: true,
//               tabBar: TabBar(
//                 tabs: [
//                   Tab(
//                     text: 'tab1',
//                   ),
//                   Tab(
//                     text: 'tab2',
//                   ),
//                   Tab(
//                     text: 'tab3',
//                   )
//                 ],
//               )),
//           tabLists: [
//             TabListBuilder(
//                 uniquePageKey: 'page1',
//                 length: listitems.length,
//                 builder: (BuildContext context, index) {
//                   return Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: ListTile(
//                         title: Text(listitems[index].toString()),
//                         tileColor: Colors.white,
//                       ));
//                 }),
//             TabListBuilder(
//                 uniquePageKey: 'page2',
//                 length: listitems.length,
//                 builder: (context, index) {
//                   return Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: ListTile(
//                         title: Text(listitems[index].toString()),
//                         tileColor: Colors.white,
//                       ));
//                 }),
//             TabListBuilder(
//                 uniquePageKey: 'page3',
//                 length: listitems.length,
//                 builder: (context, index) {
//                   return Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: ListTile(
//                         title: Text(listitems[index].toString()),
//                         tileColor: Colors.white,
//                       ));
//                 })
//           ]),
//     );
//   }
// }

class demo extends StatelessWidget {
  const demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: SizedBox(
            height: 500,
            child: CustomScrollView(
              slivers: [
                SliverTabBar(tabBar: TabBar(tabs: [
                  SingleTabItem("Vitals"),
                  SingleTabItem("Notes"),
                  SingleTabItem("Demo"),
                  SingleTabItem("Care Team"),
                  SingleTabItem("Care Plan"),
                ])),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Widget buildNews() => SliverList(
//   delegate: SliverChildBuilderDelegate(
//         (context, index) => NewsTileWidget(news: news[index],),
//     childCount: news.length,
//   ),
// );

class SingleTabItem extends StatelessWidget {

  String tabName;
  SingleTabItem(this.tabName);

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(
          tabName,
          style:  TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ));
  }
}

