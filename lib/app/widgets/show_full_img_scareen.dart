import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ga_gold/app/app.dart';
import 'package:ga_gold/data/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:video_player/video_player.dart';

class ShowFullScareenImage extends StatelessWidget {
  const ShowFullScareenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.whiteColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.twenty),
            bottomRight: Radius.circular(Dimens.twenty),
          ),
        ),
        backgroundColor: ColorsValue.whiteColor,
        elevation: Dimens.ten,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: Dimens.edgeInsets12,
            child: SvgPicture.asset(
              AssetConstants.ic_back,
            ),
          ),
        ),
        title: Text(
          'gallery'.tr,
          style: Styles.appColorW90020,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: ColorsValue.appColor,
          child: PhotoViewGallery.builder(
            backgroundDecoration: BoxDecoration(
              color: ColorsValue.whiteColor,
            ),
            builder: (BuildContext context, int index) {
              switch (Get.arguments[1]) {
                case "Photo":
                  return buildForImage(Get.arguments[0]);
                case "Video":
                  return buildForVideo(Get.arguments[0]);
                default:
                  return buildForImage(Get.arguments[0]);
              }
            },
            itemCount: 1,
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions buildForImage(image) {
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(ApiWrapper.imageUrl + image),
      initialScale: PhotoViewComputedScale.contained * 1,
      minScale: PhotoViewComputedScale.contained * 1,
    );
  }

  PhotoViewGalleryPageOptions buildForVideo(video) {
    return PhotoViewGalleryPageOptions.customChild(
      child: GalleryAllVideoPlayer(video),
      initialScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.contained,
    );
  }
}

class GalleryAllVideoPlayer extends StatefulWidget {
  dynamic video;

  GalleryAllVideoPlayer(this.video, {super.key});

  @override
  _GalleryAllVideoPlayerState createState() => _GalleryAllVideoPlayerState();
}

class _GalleryAllVideoPlayerState extends State<GalleryAllVideoPlayer> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  bool _visible = false;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      ApiWrapper.imageUrl + widget.video,
    );
    _controller!.setLooping(true);
    _initializeVideoPlayerFuture = _controller!.initialize();
    _initializeVideoPlayerFuture!.then((val) {
      setState(() {
        _controller!.play();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.whiteColor,
      body: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                if (_controller!.value.isPlaying) {
                  _controller!.pause();
                } else {
                  _controller!.play();
                }
                _visible = true;
              });
              Timer(const Duration(milliseconds: 1000), () {
                setState(() {
                  _visible = false;
                });
              });
            },
            child: Center(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                color: Colors.white,
                child: Icon(
                  !_controller!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: ColorsValue.appColor,
                  size: Dimens.sixty,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Dimens.twenty,
            left: Dimens.zero,
            right: Dimens.zero,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimens.fiftyFive),
              child: VideoProgressIndicator(
                _controller!,
                padding: Dimens.edgeInsets0,
                colors: VideoProgressColors(
                  playedColor: ColorsValue.whiteColor,
                  bufferedColor: ColorsValue.whiteColor.withAlpha(100),
                  backgroundColor: ColorsValue.whiteColor.withAlpha(100),
                ),
                allowScrubbing: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
