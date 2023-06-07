import 'package:eds_test/data/models/models.dart';
import 'package:eds_test/data/repositories/user_repository.dart';
import 'package:eds_test/domain/user_interactor.dart';

class UserInteractorImpl implements UserInteractor {
  final UserRepository _userRepository;

  UserInteractorImpl(this._userRepository);

  @override
  Future<List<UserModel>> getAllUsers() async {
    return _userRepository.getAllUsers();
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    return _userRepository.getAllPosts();
  }

  @override
  Future<List<AlbumModel>> getAllAlbums() async {
    return _userRepository.getAllAlbums();
  }

  @override
  Future<List<PhotoModel>> getAllPhotos() async {
    return _userRepository.getAllPhotos();
  }

  @override
  Future<List<CommentModel>> getAllComments() async {
    return _userRepository.getAllComments();
  }

  @override
  Future<List<PostModel>> getPostsByUserId(int userId) async {
    return _userRepository.getPostsByUserId(userId);
  }

  @override
  Future<List<AlbumModel>> getAlbumsByUserId(int userId) async {
    return _userRepository.getAlbumsByUserId(userId);
  }

  @override
  Future<List<AlbumModelWithPhotos>> getAlbumsByUserIdWithPhotos(
      int userId) async {
    return _userRepository.getAlbumsByUserIdWithPhotos(userId);
  }

  @override
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    return _userRepository.getPhotosByAlbumId(albumId);
  }

  @override
  Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    return _userRepository.getCommentsByPostId(postId);
  }

  @override
  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    return _userRepository.sendComment(
      name: name,
      email: email,
      body: body,
    );
  }
}
