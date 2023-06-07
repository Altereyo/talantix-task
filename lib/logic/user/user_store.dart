import 'package:eds_test/data/models/models.dart';
import 'package:eds_test/domain/user_interactor.dart';
import 'package:eds_test/utils/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final UserInteractor _userInteractor;

  UserStoreBase(this._userInteractor);

  @observable
  bool isLoading = true;

  @observable
  List<PostModel> posts = [];

  @observable
  List<AlbumModelWithPhotos> albums = [];

  @action
  Future<void> init(BuildContext context, UserModel user) async {
    try {
      posts = await _userInteractor.getPostsByUserId(user.id);
      albums = await _userInteractor.getAlbumsByUserIdWithPhotos(user.id);
    } on Exception catch (e) {
      ErrorHandler.showGetUserDataError(context);
    } finally {
      isLoading = false;
    }
  }
}
