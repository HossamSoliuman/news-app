import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/cubit/cubit.dart';
import '../../../repository/cubit/states.dart';
import '../../../view_model/articles_view_model.dart';
import '../../components.dart';

class Business_Screen extends StatelessWidget {
  const Business_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: ArticlesListViewModel(classRepository: NewsCubit()).fetchNewsBusiness(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("iroeeeeeeeeeeeeeeeee");
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<dynamic>? news = snapshot.data;
          return BlocConsumer<NewsCubit, NewsStates>(
            builder: (context, state) {
              return articalBludier(news!);
            },
            listener: (context, state) {},
          );
        }
      },
    );
  }
}
