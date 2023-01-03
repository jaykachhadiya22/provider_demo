import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'demo_api_view_modal.dart';

class DemoApiView extends StatefulWidget {
  const DemoApiView({Key? key}) : super(key: key);

  @override
  State<DemoApiView> createState() => _DemoApiViewState();
}

class _DemoApiViewState extends State<DemoApiView> {
  DemoApiViewModal demoApiViewModal = DemoApiViewModal();

  @override
  initState() {
    demoApiViewModal.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => demoApiViewModal,
      child: Scaffold(
        appBar: AppBar(title: const Text("Provide"), backgroundColor: Colors.red),
        body: Consumer<DemoApiViewModal>(
          builder: (context, value, child) {
            print(value.busiya);
            return value.busiya
                ? ListView.builder(
                    itemCount: value.userData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          value.userData[index].name,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          value.userData[index].email,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Center(
                              child: Text(
                            value.userData[index].name
                                .substring(0, 1)
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      );
                    },
                  )
                : const Center(
                    child:CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
