import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:peepapp/common/api_service.dart';
import 'package:peepapp/screens/people/model/people_model.dart';
import 'package:peepapp/screens/splash/controller/login_controller.dart';

class PeopleController extends ChangeNotifier {
  final List<PeopleModel> _peoples = [];

  late PeopleModel _selectedPeople;

  bool loadingPeopleDetails = true;

  List<PeopleModel> get peoples => _peoples;
  PeopleModel get selectedPeople => _selectedPeople;

  void choosePeople(PeopleModel people) {
    _selectedPeople = people;
    notifyListeners();
  }

  void getPeopleList() async {
    String query = r"""{
      nearbyUsers(userId: _user.id) {
        content {
          id
          name
          userId
        }
        number
        size
        totalElements
        totalPages
      }
    }""";
    // query = query.replaceAll("_userDetails.id", HomeController.userData!.id);
    final decodedToken = JwtDecoder.decode(LoginController.userToken);
    query = query.replaceAll("_user.id", '"${decodedToken['sub']}"');
    loadingPeopleDetails = true;
    notifyListeners();
    log(decodedToken.toString());
    final result = await ApiService.apiDelegate(
      reqMethod: "POST",
      endPoint: "graphql",
      isGraphSql: true,
      payload: query,
    ).then((value) {
      log(value.data.toString());
      _peoples.clear();
      value.data['data']["nearbyUsers"]["content"].forEach((people) => {
            _peoples.add(PeopleModel.fromMap(people)),
          });
      // _peoples = PeopleModel.fromMap(value.data);
      // _userDetails.token = LoginController.userToken;
      loadingPeopleDetails = false;
      notifyListeners();
      return value;
    }).onError<DioError>((error, stackTrace) {
      return error;
    });
    // return result;
  }
}
