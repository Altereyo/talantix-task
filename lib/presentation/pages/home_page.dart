import 'package:eds_test/logic/home/home_store.dart';
import 'package:eds_test/presentation/pages/user_page.dart';
import 'package:eds_test/presentation/shared_widgets/loader.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context)..init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('All Users'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: Observer(
        builder: (context) {
          return store.isLoading
              ? const Loader()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: store.users.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    final user = store.users[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(
                              user: user,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: AppColors.gray,
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          horizontalTitleGap: 8,
                          title: Text(
                            user.username,
                            style: AppTextStyles.title,
                          ),
                          subtitle: Text(
                            user.name,
                            style: AppTextStyles.subtitle,
                          ),
                          leading: const Icon(
                            Icons.person,
                            size: 32,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
