import 'package:eds_test/data/models/post_model.dart';
import 'package:eds_test/logic/post_detail/post_detail_store.dart';
import 'package:eds_test/presentation/shared_widgets/comment_card.dart';
import 'package:eds_test/presentation/shared_widgets/custom_text_field.dart';
import 'package:eds_test/presentation/shared_widgets/loader.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PostDetailPage extends StatefulWidget {
  final PostModel post;

  const PostDetailPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  void _clearText() {
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
    super.dispose();
  }

  Future<void> _displayDialog(BuildContext context, PostDetailStore store) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          scrollable: true,
          title: const Text('Add new comment'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Name',
                    validatorMessage: 'Name cannot be empty',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: emailController,
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'E-mail',
                    validatorMessage: 'Email cannot be empty',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: commentController,
                    prefixIcon: const Icon(Icons.message),
                    hintText: 'Comment',
                    validatorMessage: 'Comment cannot be empty',
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                store.onSubmit(context,
                  name: nameController.text,
                  email: emailController.text,
                  body: commentController.text,
                );
                Navigator.of(context).pop();
                _clearText();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PostDetailStore>(context)..init(context, widget.post);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: Observer(
        builder: (context) {
          return store.isLoading
              ? const Loader()
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      widget.post.title,
                      style: AppTextStyles.title.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.post.body,
                      style: AppTextStyles.bodyTextStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('Comments:'),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final comment = store.comments[index];
                        return CommentCard(
                          username: comment.name,
                          comment: comment.body,
                          email: comment.email,
                        );
                      },
                      itemCount: store.comments.length,
                    ),
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 20,
        ),
        onPressed: () => _displayDialog(context, store),
      ),
    );
  }
}
