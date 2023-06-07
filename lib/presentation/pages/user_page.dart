import 'package:eds_test/data/models/user_model.dart';
import 'package:eds_test/presentation/pages/album_detail_page.dart';
import 'package:eds_test/presentation/pages/all_albums_page.dart';
import 'package:eds_test/presentation/pages/all_posts_page.dart';
import 'package:eds_test/presentation/pages/post_detail_page.dart';
import 'package:eds_test/logic/user/user_store.dart';
import 'package:eds_test/presentation/shared_widgets/album_card.dart';
import 'package:eds_test/presentation/shared_widgets/loader.dart';
import 'package:eds_test/presentation/shared_widgets/post_card.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  final UserModel user;
  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<UserStore>(context)..init(context, user);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(user.username),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: Observer(
        builder: (context) {
          return store.isLoading
              ? const Loader()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${user.name}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Email: ${user.email}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Phone: ${user.phone}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Website: ${user.website}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Working Company',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Name: ${user.company.name}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'BS: ${user.company.bs}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Catch phase: '${user.company.catchPhrase}'",
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Address',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'City: ${user.address.city}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Street: ${user.address.street}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'User Posts',
                              style: AppTextStyles.bodyTextStyle,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllPostsPage(
                                    user: user,
                                    posts: store.posts,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_right_alt_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      if (store.posts.isNotEmpty) ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (context, index) {
                          final post = store.posts[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostDetailPage(
                                    post: post,
                                  ),
                                ),
                              );
                            },
                            child: PostCard(
                              post: post,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'User Albums',
                              style: AppTextStyles.bodyTextStyle,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllAlbumsPage(
                                    user: user,
                                    albums: store.albums,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_right_alt_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      if (store.albums.isNotEmpty) ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (context, index) {
                          final album = store.albums[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumDetailPage(
                                    album: album,
                                  ),
                                ),
                              );
                            },
                            child: AlbumCard(
                              album: album,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
