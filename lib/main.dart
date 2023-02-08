import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:hive/hive.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await initHiveForFlutter(); // for cache
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}

