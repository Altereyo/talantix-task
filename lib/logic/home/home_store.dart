import 'package:eds_test/data/models/models.dart';
import 'package:eds_test/domain/user_interactor.dart';
import 'package:eds_test/utils/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final UserInteractor _userInteractor;

  HomeStoreBase(this._userInteractor);
  @observable
  bool isLoading = true;

  @observable
  List<UserModel> users = [];

  @action
  Future<void> init(BuildContext context) async {
    try {
      users = await _userInteractor.getAllUsers();
    } on Exception catch (e) {
      ErrorHandler.showGetUsersError(context);
    } finally {
      isLoading = false;
    }
  }
}
