import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/cubit/cubit.dart';
import '../components.dart';
import 'search/search_sc.dart';
import '../../../repository/cubit/states.dart';
import '../components.dart';

class News_home extends StatelessWidget {
  const News_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
          listener:(context, state) => {},
          builder: (context, state) {
            var cubit =NewsCubit.get(context);
           return   Scaffold(
              appBar: AppBar(
                title: Text(
                  "News App",
                   style: TextStyle(
                     fontSize: 25,
                     color: Colors.black
                   ),
                ),

                actions: [
                  IconButton(onPressed: (){

                    nevgitto(context,Search_Screen());
                  },
                      icon:Icon(Icons.search,
                          color: Colors.black
                      )
                  ),
                ],
              ),
              body:cubit.Screen[cubit.current_index],
              bottomNavigationBar:BottomNavigationBar(
                currentIndex: cubit.current_index,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                onTap: (index){
                  cubit.changeindex(index);
                },
                items:const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: "Business",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.science,

                      ),
                      label: "Science"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sports),
                      label: "Sports"
                  ),
                 /* BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: "Ssttings"
                  ),*/
                ],
              )
          ) ;
  }
        );

  }
}
