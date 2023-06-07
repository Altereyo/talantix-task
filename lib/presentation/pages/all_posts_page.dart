import 'package:eds_test/data/models/post_model.dart';
import 'package:eds_test/data/models/user_model.dart';
import 'package:eds_test/presentation/pages/post_detail_page.dart';
import 'package:eds_test/presentation/shared_widgets/post_card.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AllPostsPage extends StatefulWidget {
  final UserModel user;
  final List<PostModel> posts;

  const AllPostsPage({
    required this.user,
    required this.posts,
    Key? key,
  }) : super(key: key);

  @override
  State<AllPostsPage> createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(widget.user.username),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: widget.posts.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) {
          final post = widget.posts[index];
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
    );
  }
}
