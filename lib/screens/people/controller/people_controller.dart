import 'package:flutter/material.dart';
import 'package:peepapp/screens/people/model/people_model.dart';

class PeopleController extends ChangeNotifier {
  final List<PeopleModel> _peoples = [
    PeopleModel(
      img: "",
      name: "Muzeer",
      whatIDo: "Staff Engineer",
      distance: 1.2,
      location: "Anudh,Pune,Maharastra",
      workAt: "VComply",
      status: "Married",
      intrests: "Development",
    ),
    PeopleModel(
      img: "",
      name: "Radha Hariharan",
      whatIDo: "Intern",
      distance: 0.5,
      location: "Hyderabad, Andra Pradesh",
      workAt: "VComply",
      status: "Single",
      intrests: "Cubing"
    ),
  ];

  late PeopleModel _selectedPeople;

  List<PeopleModel> get peoples => _peoples;
  PeopleModel get selectedPeople => _selectedPeople;

  void choosePeople(PeopleModel people) {
    _selectedPeople = people;
    notifyListeners();
  }
}
