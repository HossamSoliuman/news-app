// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/repository/cubit/cubit.dart';
import 'package:news_app/repository/cubit/states.dart';
import 'package:news_app/repository/network/bloc_observre.dart';
import 'package:news_app/repository/network/dio_helper.dart';
import 'package:news_app/views/news_app/news_layout.dart';
import 'package:news_app/views/styles/theme-data.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Diohelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(
        create: (context) => NewsCubit()..getScience()..getBusiness()..getSports()),
        ],
        child:BlocConsumer<NewsCubit,NewsStates>(
        listener:(context, state) => {
        },
    builder:(context, state) {
          return  MaterialApp(debugShowCheckedModeBanner: false,
              theme: lightmode,
             home: Directionality(textDirection: TextDirection.ltr,
                  child:News_home(),
             )
          );
    })
    );

  }
}