import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/repository/cubit/states.dart';
import '../abstract_class_ropository.dart';
import '../network/dio_helper.dart';
import '../../../views/news_app/business/business_screen.dart';
import '../../../views/news_app/science/scienc_screen.dart';
import '../../../views/news_app/sports/sportes_screen.dart';

class NewsCubit extends Cubit<NewsStates> with ClassRepository
{
  NewsCubit():super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int current_index=1;
  void changeindex(int index)
  {
  current_index=index;
  emit(NewsChangeBottomSheetState());
}
List Screen=[
  Business_Screen(),
  Science_Screen(),
  Sports_Screen(),
 // Setting_Screen(),
];
  List<dynamic> business=[];
  @override
  Future<List<dynamic>> getBusiness() async {
    emit(NewsGetBusinessLoadingState());
    try {
      var response = await Diohelper.get(
        url: "v2/top-headlines",
        query: {
          "country": "us",
          "category": "business",
          "apikey": "afb30b18851c458080a2ca1dfdc1bf8b",
        },
      );
      business = response.data["articles"];
      print(business![0]["description"].toString());
      emit(NewsGetBusinessSuccessState());
      return business!;
    } catch (error) {
      print("i like this");
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
      return []; // or return null; based on your requirement
    }
  }


  List<dynamic> sports=[];
  @override
  Future<List<dynamic>> getSports() async {
    emit(NewsGetSportLoadingState());
    try {
      if (sports.isEmpty) {
        var response = await Diohelper.get(
          url: "v2/top-headlines",
          query: {
            "country": "us",
            "category": "sports",
            "apikey": "afb30b18851c458080a2ca1dfdc1bf8b",
          },
        );
        sports = response.data["articles"];
        print(sports[0]["description"].toString());
        emit(NewsGetSportsSuccessState());
        return sports;
      } else {
        emit(NewsGetSportsSuccessState());
        return sports;
      }
    } catch (error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
      return <dynamic>[]; // Return an empty list or null based on your requirement
    }
  }


  List<dynamic> science=[];
  @override
  Future<List<dynamic>> getScience() async {
    emit(NewsGetScienceLoadingState());
    try {
      if (science.isEmpty) {
        var response = await Diohelper.get(
          url: "v2/top-headlines",
          query: {
            "country": "us",
            "category": "science",
            "apikey": "afb30b18851c458080a2ca1dfdc1bf8b",
          },
        );
        science = response.data["articles"];
        print(response.data["articles"]);
        print(science[0]["description"].toString());
        emit(NewsGetScienceSuccessState());
        return science;
      } else {
        emit(NewsGetScienceSuccessState());
        return science;
      }
    } catch (error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
      return <dynamic>[]; // Return an empty list or null based on your requirement
    }
  }

  List<dynamic> search=[];
  @override
  Future<List<dynamic>> getsearch(String value) async {
    emit(NewsGetSearchLoadingState());
    try {
      var response = await Diohelper.get(
        url: "v2/everything",
        query: {
          "q": "${value}",
          "apikey": "afb30b18851c458080a2ca1dfdc1bf8b",
        },
      );
      search = response.data["articles"];
      emit(NewsGetSearchSuccessState());
      return search;
    } catch (error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
      return <dynamic>[]; // Return an empty list or null based on your requirement
    }
  }

}