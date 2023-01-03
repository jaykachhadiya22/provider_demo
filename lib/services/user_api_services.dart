import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

import '../data_modal/user_details_data_modal.dart';

class UserApiServices {
  Future<List<UserDetailsDataModal>> getUserDataService() async {
    Response response;
    try {
      Dio dio = Dio();
      dio.interceptors.add(dioLoggerInterceptor);
      dio.options.responseType = ResponseType.plain;

      const String pathUrl =
          'https://jsonplaceholder.typicode.com/comments';
       response = await dio.get(pathUrl);
      print(response);
    } catch (e) {
      rethrow;
    }
    return userDetailsDataModalFromJson(response.data);
  }
}
