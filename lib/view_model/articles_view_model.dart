// ignore_for_file: public_member_api_docs, sort_constructors_first
import '/repository/abstract_class_ropository.dart';

class ArticlesListViewModel {
  ClassRepository? classRepository;
  ArticlesListViewModel({
    this.classRepository,
  });

  Future<List<dynamic>> fetchNewsScience() async {
    List list = await classRepository!.getScience();
    return list;
  }

  Future<List<dynamic>> fetchNewsBusiness() async {
    List list = await classRepository!.getBusiness();
    return list;
  }

  Future<List<dynamic>> fetchNewsSport() async {
    List list = await classRepository!.getSports();
    return list;
  }

  Future<List<dynamic>> fetchNewsSearch(String value) async {
    List list = await classRepository!.getsearch(value);
    return list;
  }
}
