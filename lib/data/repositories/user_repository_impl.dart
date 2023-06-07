import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eds_test/data/models/models.dart';
import 'package:eds_test/data/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  @override
  Future<List<UserModel>> getAllUsers() async {
    final response = await dio.get<String>('/users');
    final jsonResponse =
        List<Map<String, dynamic>>.from(jsonDecode(response.data!) as List);
    return jsonResponse.map(UserModel.fromMap).toList();
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await dio.get<String>('/posts');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(PostModel.fromMap).toList();
  }

  @override
  Future<List<AlbumModel>> getAllAlbums() async {
    final response = await dio.get<String>('/albums');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(AlbumModel.fromMap).toList();
  }

  @override
  Future<List<PhotoModel>> getAllPhotos() async {
    final response = await dio.get<String>('/photos');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(PhotoModel.fromMap).toList();
  }

  @override
  Future<List<CommentModel>> getAllComments() async {
    final response = await dio.get<String>('/comments');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(CommentModel.fromMap).toList();
  }

  @override
  Future<List<PostModel>> getPostsByUserId(int userId) async {
    final response = await dio.get<String>('/user/$userId/posts');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(PostModel.fromMap).toList();
  }

  @override
  Future<List<AlbumModel>> getAlbumsByUserId(int userId) async {
    final response = await dio.get<String>('/user/$userId/albums');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(AlbumModel.fromMap).toList();
  }

  @override
  Future<List<AlbumModelWithPhotos>> getAlbumsByUserIdWithPhotos(int userId) async {
    final response = await dio.get<String>('/user/$userId/albums?_embed=photos');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(AlbumModelWithPhotos.fromMap).toList();
  }

  @override
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    final response = await dio.get<String>('/albums/$albumId/photos');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(PhotoModel.fromMap).toList();
  }

  @override
  Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    final response = await dio.get<String>('/posts/$postId/comments');
    final jsonResponse =
        List<Map<String, dynamic>>.from(json.decode(response.data!) as List);
    return jsonResponse.map(CommentModel.fromMap).toList();
  }

  @override
  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    await dio.post<String>(
      '/comments',
      data: {
        'name': name,
        'email': email,
        'body': body,
      },
    );
  }
}
