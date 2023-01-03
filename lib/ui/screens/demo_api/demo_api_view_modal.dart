import 'package:flutter/cupertino.dart';

import '../../../data_modal/user_details_data_modal.dart';
import '../../../locator/locator.dart';
import '../../../services/user_api_services.dart';

class DemoApiViewModal extends ChangeNotifier
{
   UserApiServices userApiServices = locator<UserApiServices>();
   List<UserDetailsDataModal> userData = [];
   bool  busiya = false;
   Future<void> getUserData()
   async {
     userData =  await userApiServices.getUserDataService();
     busiya=true;
     notifyListeners();
     print(busiya);
     print("hello");
     notifyListeners();
   }

}