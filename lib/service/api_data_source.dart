import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadAllBreeds() {
    return BaseNetwork.get("breeds/list/all");
  }

  Future<Map<String, dynamic>> loadByBreed(String? breedName) {
    return BaseNetwork.get("breed/$breedName/images");
  }
}
