
import 'package:flutter/material.dart';
import 'package:provider_demo/stack_service/app/app.locator.dart';
import 'package:provider_demo/stack_service/stack_main.dart';
import 'package:provider_demo/stack_service/ui/set_diloge.dart';
import 'package:provider_demo/stack_service/ui/set_snackbar_ui.dart';
import 'package:provider_demo/stack_service/ui/set_up_bottam_sheet_ui.dart';



void main() {
  setupLocator();
  setupDialogUi();
  setupSnackbarUi();
  setupBottomSheetUi();

  runApp(MyApp());
}

// Future<void> main() async {
//   setup();
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();  // to connect project with firebase console
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  const MaterialApp(
//       home: HomeView(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

/*class ProviderCategory extends StatelessWidget {
  const ProviderCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DemoApiView();
                    },
                  ));
                },
                child: const Text("ChangeNotifierProvider")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return FutureProviderView();
                    },
                  ));
                },
                child: const Text("Future Provider")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return StreamProviderView();
                    },
                  ));
                },
                child: const Text("Stream Provider")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ValueListenableProviderView();
                    },
                  ));
                },
                child: const Text("ValueListenable Provider")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const MultiProviderView();
                    },
                  ));
                },
                child: const Text("ValueListenable Provider")),
          ],
        ),
      ),
    );
  }
}*/
