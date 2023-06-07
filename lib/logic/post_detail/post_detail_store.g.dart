// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostDetailStore on PostDetailStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'PostDetailStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$commentsAtom =
      Atom(name: 'PostDetailStoreBase.comments', context: context);

  @override
  List<CommentModel> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(List<CommentModel> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('PostDetailStoreBase.init', context: context);

  @override
  Future<void> init(BuildContext context, PostModel post) {
    return _$initAsyncAction.run(() => super.init(context, post));
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('PostDetailStoreBase.onSubmit', context: context);

  @override
  Future<void> onSubmit(BuildContext context,
      {required String name, required String email, required String body}) {
    return _$onSubmitAsyncAction.run(
        () => super.onSubmit(context, name: name, email: email, body: body));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
comments: ${comments}
    ''';
  }
}
