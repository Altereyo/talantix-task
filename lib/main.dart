import 'package:eds_test/data/repositories/user_repository.dart';
import 'package:eds_test/data/repositories/user_repository_impl.dart';
import 'package:eds_test/domain/user_interactor.dart';
import 'package:eds_test/domain/user_interactor_impl.dart';
import 'package:eds_test/presentation/pages/home_page.dart';
import 'package:eds_test/logic/home/home_store.dart';
import 'package:eds_test/logic/post_detail/post_detail_store.dart';
import 'package:eds_test/logic/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final UserRepository userRepository = UserRepositoryImpl();
  final UserInteractor userInteractor = UserInteractorImpl(userRepository);

  runApp(
    MultiProvider(
      providers: [
        Provider<HomeStore>(
          create: (_) => HomeStore(userInteractor),
        ),
        Provider<UserStore>(
          create: (_) => UserStore(userInteractor),
        ),
        Provider<PostDetailStore>(
          create: (_) => PostDetailStore(userInteractor),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Task Application',
        home: HomePage(),
      ),
    ),
  );
}
