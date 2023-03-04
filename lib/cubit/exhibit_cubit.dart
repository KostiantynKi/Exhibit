import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_tast_kirkach_k/models/exhibit.dart';
import 'package:flutter_test_tast_kirkach_k/models/exhibits_loader.dart';

part 'exhibit_state.dart';

class ExhibitCubit extends Cubit<ExhibitState> {
  final ExhibitsLoader exhibitsLoader;

  ExhibitCubit({required this.exhibitsLoader}) : super(ExhibitLoading());

  Future<void> getExhibits() async {
    try {
      final List<Exhibit> exhibits = await exhibitsLoader.getExhibitList();
      emit(ExhibitLoaded(exhibits));
    } catch (e) {
      emit(ExhibitError('Failed to fetch exhibits'));
    }
  }
}
