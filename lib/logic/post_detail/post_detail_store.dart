import 'package:eds_test/data/models/models.dart';
import 'package:eds_test/domain/user_interactor.dart';
import 'package:eds_test/utils/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'post_detail_store.g.dart';

class PostDetailStore = PostDetailStoreBase with _$PostDetailStore;

abstract class PostDetailStoreBase with Store {
  final UserInteractor _userInteractor;

  PostDetailStoreBase(this._userInteractor);

  @observable
  bool isLoading = true;

  @observable
  List<CommentModel> comments = [];

  @action
  Future<void> init(BuildContext context, PostModel post) async {
    try {
      comments = await _userInteractor.getCommentsByPostId(post.id);
    } on Exception catch (e) {
      ErrorHandler.showGetCommentsError(context);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> onSubmit(
    BuildContext context, {
    required String name,
    required String email,
    required String body,
  }) async {
    try {
      await _userInteractor.sendComment(
        name: name,
        email: email,
        body: body,
      );
    } on Exception catch (e) {
      ErrorHandler.showPostCommentError(context);
    }
  }
}
