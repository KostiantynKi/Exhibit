import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_tast_kirkach_k/cubit/exhibit_cubit.dart';
import 'package:flutter_test_tast_kirkach_k/exhibit_list_screen.dart';
import 'package:flutter_test_tast_kirkach_k/services/rest_exhibits_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exhibit App',
      home: BlocProvider(
        create: (_) => ExhibitCubit(exhibitsLoader: RestExhibitsLoader()),
        child: const ExhibitListScreen(),
      ),
    );
  }
}
