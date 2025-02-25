// coverage:ignore-file
import 'dart:convert';
import 'dart:io' show Directory, File, FileMode, Platform;
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:ga_gold/app/app.dart';
import 'package:ga_gold/domain/domain.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Utility {
  static Directory path = Directory('storage/emulated/0/Fanzly');

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
        // 'Authorization':
        //     'Token ${Get.find<Repository>().getStringValue(LocalKey.isDefaultAuthorizationKeyAdd)}',
      });
    }

    if (otherHeader != null) {
      header.addAll(otherHeader);
    }
    return header;
  }

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

  static String getFormatedDateTime(int datea) {
    var date = DateTime.fromMillisecondsSinceEpoch(datea);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async =>
      await InternetConnectionChecker().hasConnection;

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

  /// createDate '2018-04-10T04:00:00.000Z' To Time and date
  static String getFormatedTime(String dateTime) {
    var date = DateTime.parse(dateTime);
    var format = DateFormat('HH:MM');
    return format.format(date);
  }

  ///TimeStemp To Get DateFormat
  static String parseTimeStamp(int value) {
    var date = DateTime.fromMillisecondsSinceEpoch(value);
    var d12 = DateFormat('dd MMMM yyyy, hh:mm a').format(date);
    return d12;
  }

  // Date Format Change
  static String dateStringConvertDate(String tod) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var date = inputFormat.parse(tod);
    var formattedTime = DateFormat('dd/MM/yyyy');
    return formattedTime.format(date);
  }

  // Time Format Change
  static String timeStringConvertTimeHH(String tod) {
    var inputFormat = DateFormat('HH:mm');
    var date = inputFormat.parse(tod);
    var formattedTime = DateFormat('HH:mm a');
    return formattedTime.format(date);
  }

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

  ////imageOptimization
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

  /// imageOptimizationWithoutSize
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

  //createFolder
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
        // dynamic result = await ImageGallerySaver.saveImage(
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

  static bool isThemeDarkMode() {
    var repository = Get.find<Repository>();
    var themeMode = repository.getStoredValue(LocalKeys.isThemeDarkMode);
    return themeMode;
  }

  /// Compare password & confirm password.
  ///
  static bool comparePasswords(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    }
    return false;
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

  // SnackBar
  static void snacBar(
    String message,
    Color backgroundColor,
  ) async {
    Get.rawSnackbar(
        message: message,
        backgroundColor: backgroundColor,
        margin: const EdgeInsets.all(15.0),
        borderRadius: 15,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP);
  }

  // Error Message
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

  static Future<FilePickerResult?> pickPhotoVideo() async =>
      await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: List.from(imageTypeList)..addAll(videoTypeList),
      );

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

  // Get File Extension
  static String getFileExtension(String fileName) {
    try {
      return ".${fileName.split('.').last}";
    } catch (e) {
      return "";
    }
  }

  static String dateTimeTodayWithDate(timeDate) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeDate);

    final DateTime dtToday = DateTime.now();
    final DateTime dtYesterday =
        DateTime.now().subtract(const Duration(days: 1));
    final DateFormat formatter = DateFormat("dd-MM-yyyy");
    final DateFormat formatterDateTime = DateFormat("dd,MMMM yyyy hh:mm a");
    final DateFormat timeFormat = DateFormat("hh:mm a");

    return formatter.format(dateTime) == formatter.format(dtToday)
        ? "Today ${timeFormat.format(dateTime)}"
        : formatter.format(dateTime) == formatter.format(dtYesterday)
            ? "Yesterday ${timeFormat.format(dateTime)}"
            : formatterDateTime.format(dateTime);
  }

  static bool timeToNext(sendTime) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(sendTime);

    String timeApi = DateFormat('hh-mm').format(dateTime);
    DateTime currentTime = DateTime.now();

    DateTime targetTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      int.parse(timeApi.split('-').first),
      int.parse(timeApi.split('-').last),
    );

    bool within10Minutes =
        currentTime.isAfter(targetTime.subtract(const Duration(minutes: 10))) &&
            currentTime.isBefore(targetTime.add(const Duration(minutes: 10)));

    // Display the result
    print(within10Minutes);
    return within10Minutes;
  }

  static String timestempToTime(int time) {
    var dt = DateTime.fromMillisecondsSinceEpoch(time);

    final todayDate = DateTime.now();

    final today = DateTime(todayDate.year, todayDate.month, todayDate.day);
    final yesterday =
        DateTime(todayDate.year, todayDate.month, todayDate.day - 1);
    String difference = '';
    final aDate = DateTime(dt.year, dt.month, dt.day);

    if (aDate == today) {
      difference = "Today";
    } else if (aDate == yesterday) {
      difference = "Yesterday";
    } else {
      difference = DateFormat.yMMMd().format(dt).toString();
    }

    return difference;
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

  /// Image And Video Permssion Cheack
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
              "પરવાનગીની જરૂર છે!",
              style: Styles.blackColorW50018,
            ),
            content: Text(
              "કૃપા કરીને છબી અપલોડ કરવા માટે ફોટાની પરવાનગી આપો.",
              style: Styles.redColor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "પરવાનગી આપે છે",
                  style: Styles.redColor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "નામંજૂર કરો",
                  style: Styles.blackColorW50014,
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

  /// Camera Permission Chan
  static Future<bool> cameraPermissionCheack(BuildContext context) async {
    final bool status;
    bool permanentlyDenied;
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
              style: Styles.redColor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Allow",
                  style: Styles.redColor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "Deny",
                  style: Styles.blackColorW50014,
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

  /// Audio Permission
  static Future<bool> audioPermissionCheack(BuildContext context) async {
    final bool status;
    bool permanentlyDenied;
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt < 33) {
        status = await Permission.storage.request().isDenied;
        permanentlyDenied =
            await Permission.storage.request().isPermanentlyDenied;
      } else {
        status = await Permission.audio.request().isDenied;
        permanentlyDenied =
            await Permission.audio.request().isPermanentlyDenied;
      }
    } else {
      status = await Permission.microphone.request().isDenied;
      permanentlyDenied =
          await Permission.microphone.request().isPermanentlyDenied;
    }
    if (status || permanentlyDenied) {
      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            title: Text(
              "Permission Needed!",
              style: Styles.blackColorW50018,
            ),
            content: Text(
              "Please give the Audio Permission for uploading the audio.",
              style: Styles.redColor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Allow",
                  style: Styles.redColor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "Deny",
                  style: Styles.blackColorW50014,
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

  /// Microphone Permission
  static Future<bool> microphonePermissionCheack(BuildContext context) async {
    final bool status;
    bool permanentlyDenied;
    status = await Permission.microphone.request().isDenied;
    permanentlyDenied =
        await Permission.microphone.request().isPermanentlyDenied;
    // }
    if (status || permanentlyDenied) {
      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            title: Text(
              "Permission Needed!",
              style: Styles.blackColorW50018,
            ),
            content: Text(
              "Please give the Microphone Permission for voice call.",
              style: Styles.redColor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Allow",
                  style: Styles.redColor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "Deny",
                  style: Styles.blackColorW50014,
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

  /// FilePicker Permission
  static Future<bool> filePickPermissionCheack() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final bool status;
    bool permanentlyDenied;
    if (Platform.isIOS) {
      status = await Permission.storage.request().isDenied;
      permanentlyDenied =
          await Permission.storage.request().isPermanentlyDenied;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.version.sdkInt < 33) {
        status = await Permission.storage.request().isDenied;
        permanentlyDenied =
            await Permission.storage.request().isPermanentlyDenied;
      } else {
        status = await Permission.photos.request().isDenied;
        permanentlyDenied =
            await Permission.photos.request().isPermanentlyDenied;
      }
    }
    if (status || permanentlyDenied) {
      Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          title: Text(
            "Permission Needed!",
            style: Styles.blackColorW50018,
          ),
          content: Text(
            "Please give the Storage Permission for uploading the File.",
            style: Styles.redColor50014,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Allow",
                style: Styles.redColor50014,
              ),
              onPressed: () async {
                Get.back();
                await openAppSettings();
              },
            ),
            TextButton(
              child: Text(
                "Deny",
                style: Styles.blackColorW50014,
              ),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  /// Location Permission
  static Future<bool> locationPermissionCheack() async {
    final status = await Permission.locationWhenInUse.request().isDenied;
    var permanentlyDenied =
        await Permission.locationWhenInUse.request().isPermanentlyDenied;
    if (status || permanentlyDenied) {
      // ignore: use_build_context_synchronously
      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            title: Text(
              "Permission Needed!",
              style: Styles.blackColorW50018,
            ),
            content: Text(
              "Please give the Location Permission for Current Location.",
              style: Styles.redColor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Allow",
                  style: Styles.redColor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "Deny",
                  style: Styles.blackColorW50014,
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

  /// Contact Permission
  static Future<bool> contactPermissionCheack() async {
    final status = await Permission.contacts.request().isDenied;
    var permanentlyDenied =
        await Permission.contacts.request().isPermanentlyDenied;
    if (status || permanentlyDenied) {
      // ignore: use_build_context_synchronously
      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            title: Text(
              "Permission Needed!",
              style: Styles.blackColorW50018,
            ),
            content: Text(
              "Please give the Contacts Permission for get contact.",
              style: Styles.redColor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Allow",
                  style: Styles.redColor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "Deny",
                  style: Styles.blackColorW50014,
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

  /// Notification Permission
  static Future<bool> notificationPermissionCheack() async {
    final status = await Permission.notification.request().isDenied;
    var permanentlyDenied =
        await Permission.notification.request().isPermanentlyDenied;
    if (status || permanentlyDenied) {
      // ignore: use_build_context_synchronously
      Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            title: Text(
              "Permission Needed!",
              style: Styles.blackColorW50018,
            ),
            content: Text(
              "Please give the Notification Permission for notification.",
              style: Styles.redColor50014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Allow",
                  style: Styles.redColor50014,
                ),
                onPressed: () async {
                  Get.back();
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "Deny",
                  style: Styles.blackColorW50014,
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

  // Image Fix Size Upload
  static double getImageSizeMB(String filePath) {
    var file = File(filePath);
    final bytes = file.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    return mb;
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

// Widget Loader() {
//   return Center(
//       child: Lottie.asset(
//     AssetConstants.loader,
//     height: 100,
//     width: 100,
//   ));
// }
