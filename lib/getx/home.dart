import 'package:get/get.dart';
import '../services/api_services.dart';

class HomeStoreController extends GetxController {
  RxList clusters = [].obs;

  Future<void> getClustersList() async {
    try {
      final http = HttpService();
      var res = await http.get('http://192.168.1.62:9001/cluster/infos');
      Map result = res.data;
      List data = result['data'];
      clusters.assignAll(data);
      update();
    } catch (error) {
      print("error");
    }
  }
}
