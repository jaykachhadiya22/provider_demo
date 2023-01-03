// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../model/news_section.dart';
// import '../provider/news_provider.dart';
// import '../widget/news_section_widget.dart';
//
//
// class NewsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<NewsProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sliver Tools'),
//       ),
//       body: CustomScrollView(
//         slivers: buildNews(provider.newsSections),
//       ),
//     );
//   }
//
//   List<Widget> buildNews(List<NewsSection> news) => news
//       .map((newsSection) =>
//           NewsSectionWidget(section: newsSection, news: newsSection.news))
//       .toList();
// }
