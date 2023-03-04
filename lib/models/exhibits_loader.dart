import 'package:flutter_test_tast_kirkach_k/models/exhibit.dart';

abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}
