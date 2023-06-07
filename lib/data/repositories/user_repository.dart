import 'package:eds_test/data/models/models.dart';

abstract class UserRepository {
  Future<List<UserModel>> getAllUsers();
  Future<List<PostModel>> getAllPosts();
  Future<List<AlbumModel>> getAllAlbums();
  Future<List<PhotoModel>> getAllPhotos();
  Future<List<CommentModel>> getAllComments();
  Future<List<PostModel>> getPostsByUserId(int userId);
  Future<List<AlbumModel>> getAlbumsByUserId(int userId);
  Future<List<AlbumModelWithPhotos>> getAlbumsByUserIdWithPhotos(int userId);
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId);
  Future<List<CommentModel>> getCommentsByPostId(int postId);
  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  });
}