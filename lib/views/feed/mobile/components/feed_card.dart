import 'package:booba2/helpers/lulz_imports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({
    Key? key,
    required String imageUrl,
    required String title,
    required String profilePicture,
  })  : _imageUrl = imageUrl,
        _title = title,
        _profilePicture = profilePicture,
        super(key: key);

  final double _width = 150;
  final String _imageUrl;
  final String _title;
  final String _profilePicture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          Container(
            width: _width.w,
            height: 250.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              image: DecorationImage(
                image: CachedNetworkImageProvider(_imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Title

          Padding(
            padding: _title.isNotEmpty
                ? EdgeInsets.only(top: 15.h, bottom: 15.h)
                : EdgeInsets.zero,
            child: Text(
              _title,
              style: LulzTextStyle.sm
                  ?.copyWith(fontSize: 12.sm, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
          ),

          /// Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Profile picture
              CircleAvatar(
                radius: 18.r,
                backgroundImage: CachedNetworkImageProvider(_profilePicture),
              ),

              ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => LulzColors.gradient1.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: const Icon(
                    Icons.favorite_border_outlined,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
