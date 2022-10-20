import 'package:scoped_model/scoped_model.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

class HomeScoped extends Model{

  bool isLoading = false;
  List<Post> items = [];

  Future apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }


  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());


    isLoading = false;
    notifyListeners();
    return response != null;
  }

}