// coverage:ignore-file
import 'dart:convert';
import 'dart:io' show Directory, File, FileMode, InternetAddress, Platform;
import 'dart:math';

import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/routes_management.dart';
import 'package:Ga_Gold/domain/domain.dart';
import 'package:connectivity_plus/connectivity_plus.dart'
    show Connectivity, ConnectivityResult;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_in_store_app_version_checker/flutter_in_store_app_version_checker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Utility {
  static Directory path = Directory('storage/emulated/0/Fanzly');
  static String? coutryCurrency;

  static String? profilePic;
  static GetProfileData? profileData;

  static InStoreAppVersionChecker checker = InStoreAppVersionChecker(
    appId: 'com.ga.gagold',
  );

  /// common header for All api
  static Map<String, String> commonHeader({
    Map<String, String>? otherHeader,
    bool isDefaultAuthorizationKeyAdd = true,
  }) {
    // var token = await _authRepository.getRefreshToken(isLoading: false);
    var header = <String, String>{
      'Content-Type': 'application/json',
    };
    if (isDefaultAuthorizationKeyAdd) {
      header.addAll({
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      });
    }

    if (otherHeader != null) {
      header.addAll(otherHeader);
    }
    return header;
  }

  static void showMessage(String? message, MessageType messageType,
      Function()? onTap, String actionName) {
    if (message == null || message.isEmpty) return;
    closeSnackbar();
    var backgroundColor = Colors.black;
    switch (messageType) {
      case MessageType.error:
        backgroundColor = Colors.red;
        break;
      case MessageType.information:
        backgroundColor = Colors.black.withOpacity(0.3);
        break;
      case MessageType.success:
        backgroundColor = Colors.green;
        break;
      default:
        backgroundColor = Colors.black;
        break;
    }
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          messageText: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          mainButton: TextButton(
            onPressed: onTap ?? Get.back,
            child: Text(
              actionName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: backgroundColor,
          margin: const EdgeInsets.all(15.0),
          borderRadius: 15,
          snackStyle: SnackStyle.FLOATING,
        );
      },
    );
  }

  static double getImageSizeMB(String filePath) {
    var file = File(filePath);
    final bytes = file.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    return mb;
  }

  static void disableScreenshot(noScreenshot) async {
    bool result = await noScreenshot.screenshotOff();
    debugPrint('Screenshot Off: $result');
  }

  static void launchLinkURL(String url) async {
    await launchUrl(Uri.parse(url)).onError(
      (error, stackTrace) {
        print("Url is not valid!");
        return false;
      },
    );
  }

  static Future<void> downloadPdf({
    required BuildContext context,
    required String url,
    required String fileName,
  }) async {
    try {
      // Request storage permission
      if (Platform.isAndroid) {
        if (!await Permission.storage.request().isGranted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Storage permission denied.")),
            );
          });
          return;
        }
      }

      // Get directory path
      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        throw Exception("Unable to get storage directory.");
      }

      String filePath = '${directory.path}/$fileName';
      print('Downloading to: $filePath');

      // Download using Dio
      await dio.Dio().download(
        url,
        filePath,
        options: dio.Options(followRedirects: true),
      );

      print('Download complete: $filePath');
      snacBar('Downloaded Successfully!', ColorsValue.lightYellow);
    } catch (e) {
      print('Error downloading file: $e');

      snacBar('Failed to download the file.', ColorsValue.lightYellow);
    }
  }

  static Future<bool> imagePermissionCheack(BuildContext context) async {
    bool status = false;
    bool statusVideos = false;
    bool permanentlyDenied = false;
    bool permanentlyVideoDenied = false;
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt < 33) {
        status = await Permission.storage.request().isDenied;
        permanentlyDenied =
            await Permission.storage.request().isPermanentlyDenied;
      } else {
        status = await Permission.photos.request().isDenied;
        permanentlyDenied =
            await Permission.photos.request().isPermanentlyDenied;
        statusVideos = await Permission.videos.request().isDenied;
        permanentlyVideoDenied =
            await Permission.videos.request().isPermanentlyDenied;
      }
    } else {
      status = await Permission.photos.request().isDenied;
      permanentlyDenied = await Permission.photos.request().isPermanentlyDenied;
    }
    if (status || permanentlyDenied || statusVideos || permanentlyVideoDenied) {
      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            title: Text(
              "Permission Needed!",
              style: Styles.blackColorW50018,
            ),
            content: Text(
              "Please give the Photos Permission for uploading the image.",
              style: Styles.redcolor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Allow",
                  style: Styles.redcolor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "Deny",
                  style: Styles.black50014,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ));
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> cameraPermissionCheack(BuildContext context) async {
    final status;
    var permanentlyDenied;
    status = await Permission.camera.request().isDenied;
    permanentlyDenied = await Permission.camera.request().isPermanentlyDenied;
    if (status || permanentlyDenied) {
      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            title: Text(
              "Permission Needed!",
              style: Styles.blackColorW50018,
            ),
            content: Text(
              "Please give the Camera Permission for capture image.",
              style: Styles.redcolor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Allow",
                  style: Styles.redcolor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "Deny",
                  style: Styles.black50014,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ));
      return false;
    } else {
      return true;
    }
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  // coverage:ignore-start
  static void printDLog(String message) {
    Logger().d('${StringConstants.appName}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(dynamic message) {
    Logger().i('${StringConstants.appName}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printLog(dynamic message) {
    Logger().log(Level.info, message);
  }

  /// Get First word of a name.
  ///
  static String? getNameInitials(String? firstName, String? lastName) =>
      '${firstName![0]}${lastName![0]}'.toUpperCase();

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('${StringConstants.appName}: $message');
  }

  /// Returns a error String by validating password.
  ///
  /// for at least one upper case, at least one digit,
  /// at least one special character and and at least 6 characters long
  /// return [List<bool>] for each case.
  /// Validation logic
  /// r'^
  ///   (?=.*[A-Z])             // should contain at least one upper case
  ///   (?=.*?[0-9])            // should contain at least one digit
  ///  (?=.*?[!@#\$&*~]).{8,}   // should contain at least one Special character
  /// $
  static String? validatePassword(String value) {
    if (value.trim().isNotEmpty) {
      // if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      if (value.contains(RegExp(r'[A-Z]'))) {
        if (value.contains(RegExp(r'[0-9]'))) {
          if (value.length < 6) {
            return 'shouldBe6Characters'.tr;
          } else {
            return null;
          }
        } else {
          return 'shouldHaveOneDigit'.tr;
        }
      } else {
        return 'shouldHaveOneUppercaseLetter'.tr;
      }
      // } else {
      //   return 'shouldHaveOneSpecialCharacter'.tr;
      // }
    } else {
      return 'passwordRequired'.tr;
    }
  }

  /// Returns true if email is Valid
  static bool emailValidator(String email) => EmailValidator.validate(email);

  /// Check if URL is valid
  static bool urlValidator(String value) {
    var pattern =
        r'((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?';
    var regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      // Try a DNS lookup to confirm internet access
      final result = await InternetAddress.lookup('api.kratosclub.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Print the details of the [response].
  static void printResponseDetails(Response? response) {
    if (response != null) {
      var isOkay = response.isOk;
      var statusCode = response.statusCode;
      var statusText = response.statusText;
      var method = response.request?.method ?? '';
      var path = response.request?.url.path ?? '';
      var query = response.request?.url.queryParameters ?? '';
      if (isOkay) {
        printILog(
            'Path: $path, Method: $method, Status Text: $statusText, Status Code: $statusCode, Query $query');
      } else {
        printELog(
            'Path: $path, Method: $method, Status Text: $statusText, Status Code: $statusCode, Query $query');
      }
    }
  }

  /// returns the date time in particular given formate
  static String getWeekDayMonthNumYear(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().format(dateTime);

  /// get formated [DateTime] eg. 12-01-2021
  static String getDayMonthYear(DateTime dateTime) =>
      '${getOnlyDate(dateTime)}-${DateFormat('MM').format(dateTime)}-${DateFormat.y().format(dateTime)}';

  /// get formated [DateTime] eg. 12
  static String getOnlyDate(DateTime dateTime) =>
      DateFormat('dd').format(dateTime);

  /// get formated [DateTime] eg. 12 Sep
  static String getDateAndMonth(DateTime dateTime) =>
      DateFormat('dd MMM').format(dateTime);

  /// get formated [DateTime]
  static String getWeekDay(DateTime dateTime) =>
      DateFormat.EEEE().format(dateTime);

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  static int _numOfWeeks(int year) {
    var dec28 = DateTime(year, 12, 28);
    var dayOfDec28 = int.parse(DateFormat('D').format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  // Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  static int weekNumber(DateTime date) {
    var dayOfYear = int.parse(DateFormat('D').format(date));
    var woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = _numOfWeeks(date.year - 1);
    } else if (woy > _numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  /// Show loader
  static void showLoader() async {
    if (Get.isDialogOpen == true) {
      Get.back<void>();
    }
    await Get.dialog<dynamic>(
      const Center(
        child: CircularProgressIndicator(),
      
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.7),
    );
  }

  static Widget loaderWidget() => const Center(
        child: CircularProgressIndicator(),
      );

  /// Close loader
  static void closeLoader() {
    closeDialog();
  }

  /// URL Launcher
  static void launchURL(String url) async => await canLaunchUrl(Uri.parse(url))
      ? await canLaunchUrl(Uri.parse(url))
      : showDialog('Could not open $url');

  /// Show info dialog
  static void showDialog(
    String message, {
    Function()? onPress,
    bool barrierDismissible = true,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: const Text('Info'),
        content: Text(
          message,
        ),
        actions: [
          CupertinoButton(
            onPressed: onPress ?? Get.back,
            child: Text(
              'Okay',
              style: TextStyle(color: Theme.of(Get.context!).primaryColor),
            ),
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  /// Show alert dialog
  static void showAlertDialog({
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPress,
            child: const Text('Yes'),
          ),
          const CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: closeDialog,
            child: Text('No'),
          )
        ],
      ),
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back<void>();
    }
  }

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen) {
      Get.back<void>();
    }
  }

  /// Show no internet dialog if there is no
  /// internet available.
  // static Future<void> showNoInternetDialog() async {
  //   await Get.dialog<void>(
  //     const NoInternetWidget(),
  //     barrierDismissible: false,
  //   );
  // }

  /// Show a message to the user.
  ///
  /// [message] : Message you need to show to the user.
  // ignore: comment_references
  /// [messageType] : Type of the message for different background color.
  // ignore: comment_references
  /// [onTap] : An event for onTap.
  // ignore: comment_references
  /// [actionName] : The name for the action.
  // static void showMessage(String? message, MessageType messageType,
  //     Function()? onTap, String actionName) {
  //   if (message == null || message.isEmpty) return;
  //   closeDialog();
  //   closeSnackbar();
  //   var backgroundColor = Colors.black;
  //   switch (messageType) {
  //     case MessageType.error:
  //       backgroundColor = Colors.red;
  //       break;
  //     case MessageType.information:
  //       backgroundColor = Colors.black.withOpacity(0.3);
  //       break;
  //     case MessageType.success:
  //       backgroundColor = Colors.green;
  //       break;
  //     default:
  //       backgroundColor = Colors.black;
  //       break;
  //   }
  //   Future.delayed(
  //     const Duration(seconds: 0),
  //     () {
  //       Get.rawSnackbar(
  //         messageText: Text(
  //           '${jsonDecode(message)['message']}',
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //         mainButton: TextButton(
  //           onPressed: onTap ?? Get.back,
  //           child: Text(
  //             actionName,
  //             style: const TextStyle(color: Colors.white),
  //           ),
  //         ),
  //         backgroundColor: backgroundColor,
  //         margin: const EdgeInsets.all(15.0),
  //         borderRadius: 15,
  //         snackStyle: SnackStyle.FLOATING,
  //       );
  //     },
  //   );
  // }

  /// Returns Platform type
  static String platFormType() {
    var value = kIsWeb
        ? 3
        : GetPlatform.isAndroid
            ? 1
            : 2;
    return value.toString();
  }

  /// Random number generator
  static int getRandomNumer() {
    var random = Random();
    return random.nextInt(100);
  }

  /// Return file size
  static String getFileSize(int size) {
    if (size == 0) {
      return '0 KB';
    } else {
      var val = size / pow(1024, (log(size) / log(1024)).floor());
      if (size < 1024) {
        return '$val KB';
      } else {
        return '${val.toStringAsFixed(1)} MB';
      }
    }
  }

  static String getFormatedDate(String date) {
    var date = DateTime.parse('2018-04-10T04:00:00.000Z');
    return Utility.getDayMonthYear(date);
  }

  /// Show error dialog from response model
  static void showInfoDialog(ResponseModel data,
      [bool isSuccess = false]) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: Text(isSuccess ? 'SUCCESS' : 'ERROR'),
        content: Text(
          jsonDecode(data.data)['Message'] as String,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: Text(
              'okay'.tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Bottomsheet to show only alerts to user.
  static void showInfoBottomSheet({
    required String icon,
    required String title,
    required String coloredTitle,
    String? description,
    double? titleSize,
    String? subTitle,
    double? subTitleSize,
    Widget? actions,
    Function()? onPress,
    bool isdismissible = true,
    Axis direction = Axis.vertical,
    double? fontSize,
    bool defaultSpaceBetweenColoredText = false,
  }) =>
      Get.bottomSheet<void>(
        Container(
          padding: Dimens.edgeInsets16,
          decoration: BoxDecoration(
            color: Theme.of(Get.context!).canvasColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Dimens.fourteen,
              ),
              topRight: Radius.circular(
                Dimens.fourteen,
              ),
            ),
          ),
          child: Container(
            margin: Dimens.edgeInsets0_20_0_0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (subTitle != null)
                  Text(
                    subTitle,
                    style: Styles.blackBold16,
                  ),
                if (description != null)
                  Text(
                    description,
                    style: Styles.black12.copyWith(
                      color: Theme.of(Get.context!).hintColor,
                    ),
                  ),
                if (actions == null) Dimens.boxHeight40,
                if (actions != null) actions,
                if (actions == null)
                  // CustomMaterialButton(
                  //   text: 'ok'.tr,
                  //   onTap: onPress,
                  // ),
                  // else
                  //   actions,
                  Dimens.boxHeight10,
              ],
            ),
          ),
        ),
        isScrollControlled: true,
        backgroundColor: Theme.of(Get.context!).canvasColor,
        isDismissible: isdismissible,
        enableDrag: isdismissible,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      );

  // /// Bottomsheet to show only alerts to user.
  // static void showAlertBottomSheet({
  //   String? title,
  //   Function()? onCancle,
  //   Function()? onConfirm,
  //   String? cancleCustomText,
  //   String? confirmCustomText,
  // }) =>
  //     Get.bottomSheet<void>(
  //       Container(
  //         color: isThemeDarkMode()
  //             ? Theme.of(Get.context!).canvasColor
  //             : ColorsValue.whiteColor,
  //         padding: Dimens.edgeInsets35,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               title ?? 'areYouSure'.tr,
  //               style: Styles.blackBold26,
  //             ),
  //             Dimens.boxHeight20,
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: PrimaryButton(
  //                     margin: Dimens.edgeInsets0_16_0_16,
  //                     style: Styles.cancleElevatedButtonTheme,
  //                     title: confirmCustomText ?? 'confirm'.tr,
  //                     onPress: onConfirm,
  //                     padding: Dimens.edgeInsets0,
  //                   ),
  //                 ),
  //                 Dimens.boxWidth10,
  //                 Expanded(
  //                   child: PrimaryButton(
  //                     margin: Dimens.edgeInsets0,
  //                     title: cancleCustomText ?? 'cancle'.tr,
  //                     onPress: onCancle,
  //                     padding: Dimens.edgeInsets0,
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //       isScrollControlled: true,
  //       backgroundColor: Theme.of(Get.context!).canvasColor,
  //     );

  static String imageOptimization({
    required String bucket,
    required String url,
    required int width,
    required int height,
    required int quality,
    bool progressive = true,
    bool mozjpeg = true,
    required int blur,
  }) {
    var map = '';
    if (blur == 0) {
      map =
          '{"bucket": "$bucket","key": "$url","edits": {"resize": {"width": $width},"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg}}}';
    } else {
      map =
          '{"bucket": "$bucket","key": "$url","edits": {"resize": {"width": $width},"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg},"blur": $blur}}';
    }
    var data = base64Encode(utf8.encode(map));
    return data;
  }

  static String imageOptimizationWithoutSize({
    required String bucket,
    required String key,
    required int quality,
    required bool progressive,
    required bool mozjpeg,
    required int blur,
  }) {
    var map = '';
    if (blur == 0) {
      map =
          '{"bucket": "$bucket","key": "$key","edits": {"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg}}}';
    } else {
      map =
          '{"bucket": "$bucket","key": "$key","edits": {"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg},"blur": $blur}}';
    }
    var data = base64Encode(utf8.encode(map));
    return data;
  }

  static Future<String> createFolder() async {
    var permissionGranted = false;
    if (await Permission.storage.request().isGranted) {
      permissionGranted = true;
      await Permission.manageExternalStorage.request();
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      permissionGranted = false;
    }
    printILog(permissionGranted);
    if (GetPlatform.isIOS) {
      var iosPath = await getApplicationDocumentsDirectory();
      var donwloadDirectory = Directory('${iosPath.path}/Fanzly');
      if (await donwloadDirectory.exists()) {
        return donwloadDirectory.path;
      } else {
        await donwloadDirectory.create();
        return donwloadDirectory.path;
      }
    } else {
      if (await path.exists()) {
        return path.path;
      } else {
        await path.create();
        return path.path;
      }
    }
  }

  /// Download file into private folder
  static Future<void> downloadFile(String? url, String? name) async {
    Get.back<dynamic>();
    Utility.showLoader();
    final appStorage = await createFolder();
    final extension = ".${url!.split('.').last}";
    final file = File('$appStorage/${name!}');

    printILog(extension);
    printDLog(file.path);
    printDLog(url);

    try {
      var progress = '';
      final response = await dio.Dio().get<dynamic>(
        url,
        options: dio.Options(
          responseType: dio.ResponseType.bytes,
          followRedirects: false,
          // receiveTimeout: 0
        ),
        onReceiveProgress: (rec, total) {
          progress = '${((rec / total) * 100).round()}%';
          debugPrint(progress);
        },
      );

      if (GetPlatform.isIOS) {
        // dynamic result = await ImageGallerySaverPlus.saveImage(
        //     Uint8List.fromList(response.data as List<int>),
        //     quality: 60,
        //     name: name);
        // printILog(result);
      } else {
        final d = response.data as List<int>;

        final ref = file.openSync(mode: FileMode.write);

        ref.writeFromSync(d);
        await ref.close();
      }

      Utility.closeDialog();
    } on Exception {
      Utility.closeDialog();
      printELog('Download Error');
      return;
    }
  }

  static void getReadMoreSheet({String? title, String? text}) {
    Get.bottomSheet<dynamic>(
      SafeArea(
        child: Container(
          height: Dimens.twoHundredEighty,
          constraints: const BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          color: ColorsValue.greyColor,
          child: Padding(
            padding: Dimens.edgeInsets15_20_15_0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Styles.white23,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back<void>();
                        },
                        child: const Icon(
                          Icons.cancel,
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight30,
                  Text(
                    text!,
                    style: Styles.white14,
                  ),
                  Dimens.boxHeight10,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // static bool isThemeDarkMode() {
  //   var repository = Get.find<Repository>();
  //   var themeMode = repository.getStoredValue(LocalKeys.isThemeDarkMode);
  //   return themeMode;
  // }

  // static String getStyledHtml(String content) {
  //   if (content.contains('rgb')) {
  //     debugPrint('contains======== true');
  //     var repository = Get.find<Repository>();
  //     var themeMode = repository.getStoredValue(LocalKeys.isThemeDarkMode);
  //     if (themeMode) {
  //       return content.replaceAll('<span style=\"color: rgb(44, 53, 60);\">',
  //           '<span style=\"color: rgb(255, 255, 255);\">');
  //     } else {
  //       return content;
  //     }
  //   } else {
  //     debugPrint('contains========== false');
  //     return content;
  //   }
  // }

  /// Compare password & confirm password.
  ///
  static bool comparePasswords(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    }
    return false;
  }

  /// Show Error bottomsheet.
  ///
  static void showErrorBottomSheet({
    required String? message,
    Function()? onPress,
    bool isDismissible = true,
    bool autoDismiss = true,
  }) async {
    await Get.bottomSheet<void>(
      Container(
        padding: Dimens.edgeInsets30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$message',
              style: Styles.blackBold16.copyWith(
                color: const Color.fromRGBO(235, 87, 87, 1),
              ),
            ),
            Dimens.boxHeight10,
            // CustomButton(
            //   width: Get.width - Dimens.sixty,
            //   onPress: onPress ?? Get.back,
            //   height: 50,
            //   title: 'ok'.tr,
            //   color: const Color.fromRGBO(235, 87, 87, 1),
            // ),
            // Dimens.boxHeight10,
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(255, 206, 206, 1),
      isScrollControlled: true,
      isDismissible: isDismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
    ).timeout(const Duration(seconds: 4), onTimeout: () {
      if (autoDismiss) {
        if (Get.isBottomSheetOpen!) {
          Get.back<void>();
        }
      }
    });
  }

  /// Method For Get Floated Snack Bar
  static void getRawSnackBar(
    String message,
    Color backgroundColor,
  ) async {
    Get.rawSnackbar(
      message: message,
      mainButton: TextButton(
        onPressed: Get.back,
        child: Text(
          'okay'.tr,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(15.0),
      borderRadius: 15,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static void snacBar(
    String message,
    Color backgroundColor,
  ) async {
    Get.rawSnackbar(
        message: message ?? "Internal Server error",
        backgroundColor: backgroundColor,
        margin: const EdgeInsets.all(15.0),
        borderRadius: 15,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP);
  }

  static errorMessage(String message) async {
    return Get.rawSnackbar(
        title: "Error",
        message: message,
        backgroundColor: Colors.red.shade400,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.error, color: Colors.white70),
        shouldIconPulse: true,
        instantInit: true);
  }

  static bool isLoginOrNot() {
    if (Get.find<Repository>().getStringValue(LocalKeys.authToken).isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  static Widget LoginNotWidget(String message) {
    return Scaffold(
      backgroundColor: ColorsValue.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dimens.boxHeight30,
              Center(
                child: SvgPicture.asset(
                  AssetConstants.ic_loginView,
                  fit: BoxFit.cover,
                  height: Get.height / 2.5,
                ),
              ),
              Center(
                child: Text(
                  'you_are_missing'.tr,
                  style: Styles.txtBlackColorW60016,
                ),
              ),
              Dimens.boxHeight10,
              Center(
                child: Text(
                  "${'sign_to_view'.tr}\n$message",
                  style: Styles.txtBlackColorW50014,
                  textAlign: TextAlign.center,
                ),
              ),
              Dimens.boxHeight10,
              InkWell(
                onTap: () {
                  RouteManagement.goToLoginView();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: Dimens.fourty,
                  width: Dimens.hundred,
                  decoration: BoxDecoration(
                    color: ColorsValue.lightYellow,
                    borderRadius: BorderRadius.circular(
                      Dimens.sixteen,
                    ),
                  ),
                  child: Text(
                    'sign_in'.tr,
                    style: Styles.whiteColorW80016,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // static String findResult(List<AddressComponent> results, key) {
  //   for (int i = 0; i < results.length; i++) {
  //     for (int j = 0; j < results[i].types!.length; j++) {
  //       if (results[i].types![j] == key) {
  //         return results[i].longName!;
  //       }
  //     }
  //   }
  //   return "";
  // }

  /// Video Type List For Every Platform
  static List<String> videoTypeList = [
    'webm',
    'mkv',
    'flv',
    'vob',
    'ogv',
    'ogg',
    'rrc',
    'gifv',
    'mng',
    'mov',
    'avi',
    'qt',
    'wmv',
    'yuv',
    'rm',
    'asf',
    'amv',
    'mp4',
    'm4p',
    'm4v',
    'mpg',
    'mp2',
    'mpeg',
    'mpe',
    'mpv',
    'm4v',
    'svi',
    '3gp',
    '3g2',
    'mxf',
    'roq',
    'nsv',
    'flv',
    'f4v',
    'f4p',
    'f4a',
    'f4b',
    'mod',
  ];

  /// Image Type List For Every Platform
  static List<String> imageTypeList = [
    'ase',
    'art',
    'bmp',
    'blp',
    'cd5',
    'cit',
    'cpt',
    'cr2',
    'cut',
    'dds',
    'dib',
    'djvu',
    'egt',
    'exif',
    'gif',
    'gpl',
    'grf',
    'icns',
    'ico',
    'iff',
    'jng',
    'jpeg',
    'jpg',
    'jfif',
    'jp2',
    'jps',
    'lbm',
    'max',
    'miff',
    'mng',
    'msp',
    'nitf',
    'ota',
    'pbm',
    'pc1',
    'pc2',
    'pc3',
    'pcf',
    'pcx',
    'pdn',
    'pgm',
    'PI1',
    'PI2',
    'PI3',
    'pict',
    'pct',
    'pnm',
    'pns',
    'ppm',
    'psb',
    'psd',
    'pdd',
    'psp',
    'px',
    'pxm',
    'pxr',
    'qfx',
    'raw',
    'rle',
    'sct',
    'sgi',
    'rgb',
    'int',
    'bw',
    'tga',
    'tiff',
    'tif',
    'vtf',
    'xbm',
    'xcf',
    'xpm',
    '3dv',
    'amf',
    'ai',
    'awg',
    'cgm',
    'cdr',
    'cmx',
    'dxf',
    'e2d',
    'egt',
    'eps',
    'fs',
    'gbr',
    'odg',
    'svg',
    'stl',
    'vrml',
    'x3d',
    'sxd',
    'v2d',
    'vnd',
    'wmf',
    'emf',
    'art',
    'xar',
    'png',
    'webp',
    'jxr',
    'hdp',
    'wdp',
    'cur',
    'ecw',
    'iff',
    'lbm',
    'liff',
    'nrrd',
    'pam',
    'pcx',
    'pgf',
    'sgi',
    'rgb',
    'rgba',
    'bw',
    'int',
    'inta',
    'sid',
    'ras',
    'sun',
    'tga'
  ];

  /// Method For Convert URL to local path and save in local
  static Future<File> imageURLToFile({required String imageUrl}) async {
    // generate random number.
    var rng = Random();
    // get temporary directory of device.
    var tempDir = await getTemporaryDirectory();
    // get temporary path from temporary directory.
    var tempPath = tempDir.path;
    // create a new file in temporary path with random file name.
    var file = File('$tempPath${rng.nextInt(100)}.png');
    // call http.get method and pass imageUrl into it to get response.
    var response = await http.get(Uri.parse(imageUrl));
    // write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
    // now return the file which is created with random name in
    // temporary directory and image bytes from response is written to // that file.
    return file;
  }

  /// Method For Get URL to Bytes
  static Future<Uint8List> urlToBytes({required String imageURL}) async {
    final data = await NetworkAssetBundle(Uri.parse(imageURL)).load(imageURL);
    final bytes = data.buffer.asUint8List();
    return bytes;
  }

  // static Future<filePicker.FilePickerResult?> pickPhotoVideo() async =>
  //     await filePicker.FilePicker.platform.pickFiles(
  //       type: filePicker.FileType.custom,
  //       allowMultiple: false,
  //       allowedExtensions: List.from(imageTypeList)..addAll(videoTypeList),
  //     );

  /// Method For Convert Duration To String
  static String durationToString({required Duration duration}) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    var twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    var twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    var hour = num.parse(twoDigits(duration.inHours));
    if (hour > 0) {
      return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
    } else {
      return '$twoDigitMinutes:$twoDigitSeconds';
    }
  }

  /// Age Calculator Method
  static int calculateAge(DateTime birthDate) {
    var currentDate = DateTime.now();
    var age = currentDate.year - birthDate.year;
    var month1 = currentDate.month;
    var month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      var day1 = currentDate.day;
      var day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  // static void showMessage(String? message, MessageType messageType,
  //     Function()? onTap, String actionName) {
  //   if (message == null || message.isEmpty) return;
  //   closeSnackbar();
  //   var backgroundColor = Colors.black;
  //   switch (messageType) {
  //     case MessageType.error:
  //       backgroundColor = Colors.red;
  //       break;
  //     case MessageType.information:
  //       backgroundColor = Colors.black.withOpacity(0.3);
  //       break;
  //     case MessageType.success:
  //       backgroundColor = Colors.green;
  //       break;
  //     default:
  //       backgroundColor = Colors.black;
  //       break;
  //   }
  //   Future.delayed(
  //     const Duration(seconds: 0),
  //     () {
  //       Get.rawSnackbar(
  //         snackPosition: SnackPosition.TOP,
  //         messageText: Text(
  //           message,
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //         mainButton: TextButton(
  //           onPressed: onTap ?? Get.back,
  //           child: Text(
  //             actionName,
  //             style: const TextStyle(color: Colors.white),
  //           ),
  //         ),
  //         backgroundColor: backgroundColor,
  //         margin: const EdgeInsets.all(15.0),
  //         borderRadius: 15,
  //         snackStyle: SnackStyle.FLOATING,
  //       );
  //     },
  //   );
  // }

  static AndroidDeviceInfo? androidInfo;

  static Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  // static Future<bool> saveFile(String url, String fileName) async {
  //   try {
  //     if (await _requestPermission(int.parse(androidInfo == null
  //                 ? "12"
  //                 : androidInfo!.version.release.toString()) >
  //             12
  //         ? Permission.photos
  //         : Permission.storage)) {
  //       Directory? directory;
  //       // directory = await getExternalStorageDirectory();
  //       // String newPath = "";
  //       // List<String> paths = directory!.path.split("/");
  //       // for (int x = 1; x < paths.length; x++) {
  //       //   String folder = paths[x];
  //       //   if (folder != "Android") {
  //       //     newPath += "/" + folder;
  //       //   } else {
  //       //     break;
  //       //   }
  //       // }
  //       // newPath = newPath + "/EventoPackage";
  //       // directory = Directory(newPath);

  //       try {
  //         if (Platform.isIOS) {
  //           var dir = await getLibraryDirectory();
  //           directory = Directory(dir.path + '/FestumEvento');
  //         } else {
  //           directory = Directory('/storage/emulated/0/Download/FestumEvento');
  //           // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
  //           // ignore: avoid_slow_async_io
  //           // if (!await directory.exists()) directory = await getExternalStorageDirectory();
  //         }
  //       } catch (err) {
  //         print("Cannot get download folder path");
  //       }
  //       var myPath = directory?.path;
  //       File saveFile = File(myPath! + "/$fileName");
  //       if (kDebugMode) {
  //         print(saveFile.path);
  //       }
  //       if (!await directory!.exists()) {
  //         await directory.create(recursive: true);
  //       }
  //       if (await directory.exists()) {
  //         Utility.showLoader();

  //         await dio.Dio()
  //             .download(
  //           url,
  //           saveFile.path,
  //         )
  //             .then((value) {
  //           Utility.closeLoader();
  //           Get.to(() => PdfViewerPage(saveFile.path));
  //         });
  //       }
  //     }
  //     return true;
  //   } catch (e) {
  //     //commonHelper.errorMessage(e);
  //     errorMessage(e.toString());
  //     return false;
  //   }
  // }

  static String getFileExtension(String fileName) {
    try {
      return ".${fileName.split('.').last}";
    } catch (e) {
      return "";
    }
  }

  static String getFormatedDateTime(int datea) {
    var date = DateTime.fromMillisecondsSinceEpoch(datea);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String timeAgo(String d) {
    DateTime dateTime = DateTime.parse(d);
    Duration diff = DateTime.now().difference(dateTime);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "just now";
  }
}

String? validateEmail(String value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}

Widget Loader() {
  return Center(
      child: Lottie.asset(
    AssetConstants.loader,
    height: 100,
    width: 100,
  ));
}

extension StringCasingExtension on String {
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');
}

extension DateTimex on DateTime {
  String get dateFormate => DateFormat('dd, MMM yyyy').format(this);
}

extension DateFormatExtension on DateTime {
  String formatToDDMMYYYY() {
    return "${this.day.toString().padLeft(2, '0')}/${this.month.toString().padLeft(2, '0')}/${this.year}";
  }
}
