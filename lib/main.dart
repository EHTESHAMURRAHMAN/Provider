import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newaaaa/Favorite.dart';
import 'package:newaaaa/Provider/favoriteProvider.dart';
import 'package:newaaaa/Provider/model.dart';
import 'package:newaaaa/Provider/sli.dart';
import 'package:newaaaa/slider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => SliderChange()),
        ChangeNotifierProvider(create: (_) => FavoriteChange()),
      ],
      child: const MaterialApp(
        home: Favorite(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final count = Provider.of<Counter>(context, listen: false);
    // Timer.periodic(Duration(milliseconds: 100), (timer) {
    //   return count.increment();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Counter>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Consumer<Counter>(
        builder: (context, value, child) {
          print('this widget');
          return Text(
            value.counter.toString(),
            style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.increment();
        },
      ),
    );
  }
}
