// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'UserStoreBase.isLoading', context: context);

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

  late final _$postsAtom = Atom(name: 'UserStoreBase.posts', context: context);

  @override
  List<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$albumsAtom =
      Atom(name: 'UserStoreBase.albums', context: context);

  @override
  List<AlbumModelWithPhotos> get albums {
    _$albumsAtom.reportRead();
    return super.albums;
  }

  @override
  set albums(List<AlbumModelWithPhotos> value) {
    _$albumsAtom.reportWrite(value, super.albums, () {
      super.albums = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('UserStoreBase.init', context: context);

  @override
  Future<void> init(BuildContext context, UserModel user) {
    return _$initAsyncAction.run(() => super.init(context, user));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
posts: ${posts},
albums: ${albums}
    ''';
  }
}
