// import 'package:flutter/material.dart';
//
// class LoadMoreButtonWidget extends StatelessWidget {
//   final bool loading;
//   final VoidCallback nextPage;
//
//   const LoadMoreButtonWidget({
//
//     required this.loading,
//     required this.nextPage,
//   }) ;
//
//   @override
//   Widget build(BuildContext context) => Container(
//         height: 64,
//         child: AnimatedSwitcher(
//           duration: const Duration(milliseconds: 200),
//           child: loading
//               ? const CircularProgressIndicator()
//               : RaisedButton(
//                   child: Text(
//                     'Load More',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                   onPressed: nextPage,
//                   color: Theme.of(context).primaryColor,
//                 ),
//         ),
//       );
// }
