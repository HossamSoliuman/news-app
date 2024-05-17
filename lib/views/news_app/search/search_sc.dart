import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/cubit/cubit.dart';
import '../../../repository/cubit/states.dart';
import '../../components.dart';

//import '../../shared/components/components.dart';
var text_con=TextEditingController();
class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        builder: (context, state) =>  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                    controller:text_con ,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("search must not be empty");
                      }
                      return null;
                    },
                    onChanged: (value){
                      NewsCubit.get(context).getsearch(value);
                    },
                    decoration: InputDecoration(prefixIcon: Icon(Icons.search),
                        labelText: "search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))
                    )
                ),
              ),
              Expanded(child: articalBludier(NewsCubit.get(context).search,isSearch:true)),
            ],
          ),
        ),
        listener: (context, state) {},
    );
  }
}
/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repository/cubit/cubit.dart';
import '../../../repository/cubit/states.dart';
import '../../../view_model/articles_view_model.dart';
import '../../components.dart';

var text_con = TextEditingController();

class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: text_con,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("search must not be empty");
                  }
                  return null;
                },
                onChanged: (value) {
                  ArticlesListViewModel(classRepository: NewsCubit()).fetchNewsSearch(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsStates>(
                builder: (context, state) {
                  if (state is NewsGetSearchLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is NewsGetSearchSuccessState) {
                    // Display search results
                    return articalBludier(NewsCubit.get(context).search, isSearch: true);
                  } else if (state is NewsGetSearchErrorState) {
                    // Display error message
                    return Center(child: Text(state.error));
                  } else {
                    // Initial state
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) {},
    );
  }
}
*/