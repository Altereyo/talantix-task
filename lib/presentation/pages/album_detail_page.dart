import 'package:carousel_slider/carousel_slider.dart';
import 'package:eds_test/data/models/album_model.dart';
import 'package:eds_test/presentation/shared_widgets/loader.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final AlbumModelWithPhotos album;
  const AlbumDetailPage({
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(album.title),
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(height: 400),
          itemCount: album.photos.length,
          itemBuilder: (context, index, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(
                      album.photos[index].url,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(album.photos[index].title)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
