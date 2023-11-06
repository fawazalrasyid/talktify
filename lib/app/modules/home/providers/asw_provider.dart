import 'package:get/get.dart';

import '../asw_model.dart';

class AswProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Asw.fromJson(map);
      if (map is List) return map.map((item) => Asw.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Asw?> getAsw(int id) async {
    final response = await get('asw/$id');
    return response.body;
  }

  Future<Response<Asw>> postAsw(Asw asw) async => await post('asw', asw);
  Future<Response> deleteAsw(int id) async => await delete('asw/$id');
}
