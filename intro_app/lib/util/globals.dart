import 'package:date_format/date_format.dart';
import 'package:fandl/util/colors.dart';
import 'package:fandl/util/constants.dart';
import 'package:fandl/util/dimentions.dart';
import 'package:fandl/util/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fandl/util/textStyles.dart';

Widget getSvg(String assetPath, String labelString) {
  Widget svg = SvgPicture.asset(
    assetPath,
    semanticsLabel: labelString,
  );
  return svg;
}

Widget getSvgSize80(String assetPath, String labelString) {
  Widget svg = SvgPicture.asset(
    assetPath,
    width: width80,
    height: height80,
    semanticsLabel: labelString,
  );
  return svg;
}

Widget getSvgSize130(String assetPath, String labelString) {
  Widget svg = SvgPicture.asset(
    assetPath,
    width: height130,
    height: height130,
    semanticsLabel: labelString,
  );
  return svg;
}

Widget getSvgSize100(String assetPath, String labelString) {
  Widget svg = SvgPicture.asset(
    assetPath,
    width: height100,
    height: height100,
    semanticsLabel: labelString,
  );
  return svg;
}

Widget getSvgSizeCustom(
    String assetPath, String labelString, double height, double width) {
  Widget svg = SvgPicture.asset(
    assetPath,
    width: width,
    height: height,
    semanticsLabel: labelString,
  );
  return svg;
}

Widget getSvgSizeCustomWithColor(String assetPath, String labelString,
    double height, double width, Color color) {
  Widget svg = SvgPicture.asset(
    assetPath,
    color: color,
    width: width,
    height: height,
    semanticsLabel: labelString,
  );
  return svg;
}

Widget getSvgWithoutSize(String assetPath, String labelString) {
  Widget svg = SvgPicture.asset(
    assetPath,
    semanticsLabel: labelString,
  );
  return svg;
}

void showSnackBar(String message, GlobalKey<ScaffoldState> _scaffoldKey) {
  // ignore: deprecated_member_use
  _scaffoldKey.currentState.showSnackBar(getSnackBar(message));
}

void showSnackBarAction(String message, GlobalKey<ScaffoldState> _scaffoldKey,
    BuildContext context) {
  // ignore: deprecated_member_use
  _scaffoldKey.currentState.showSnackBar(getSnackBarAction(message, context));
}

validateEmail(String value) {
  RegExp regex = new RegExp(emailPattern);
  if (!regex.hasMatch(value))
    return 'Please enter a valid mail';
  else
    return null;
}

String getDateTextFromCalender(DateTime dateTime) {
  String monthText = '${dateTime.month}';
  String dayText = '${dateTime.day}';
  String yearText = '${dateTime.year}';
  if (dateTime.month <= 9) {
    monthText = '0$monthText';
  }
  if (dateTime.day <= 9) {
    dayText = '0$dayText';
  }
  return '$dayText-$monthText-$yearText';
}

String getDateTextFromCalenderMonthName(String dateText) {
  try {
    DateTime dateTime = DateTime.parse(dateText);
    String dateString = formatDate(dateTime, [M, ' ', dd, ', ', yyyy]);
    print(dateString);
    print('dateTime');
    // print(dateTime);
    return dateString;
  } catch (exception) {
    print(exception);
    return '';
  }
  //print(formatDate(dateTime, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]))
  // print(new DateFormat.yMMMd().format(dateTime));
}

String getDateTextFromCalenderMonthNameOnly(String dateText) {
  try {
    DateTime dateTime = DateTime.parse(dateText);
    String dateString = formatDate(dateTime, [M, ' ', ', ', yyyy]);
    print(dateString);
    print('dateTime');
    // print(dateTime);
    return dateString;
  } catch (exception) {
    print(exception);
    return '';
  }
  //print(formatDate(dateTime, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]))
  // print(new DateFormat.yMMMd().format(dateTime));
}

String getYearTextFromCalender(DateTime dateTime) {
  String yearText = '${dateTime.year}';
  return '$yearText';
}

void _launchUrl(String url) async {
  // String url = 'tel:$phone';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

showLoadingAlert(BuildContext context, String alertMessage) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Container(
              height: height70,
              child: new Stack(
                alignment: Alignment.center,
                children: [
                  new Opacity(
                    opacity: opacity35,
                    child: const ModalBarrier(
                        dismissible: false, color: blackColor),
                  ),
                  Center(
                    child: Container(
                      height: height70,
                      width: MediaQuery.of(context).size.width / width1point5,
                      color: blackColor,
                      child: Row(
                        // shrinkWrap: true,
                        children: [
                          Container(
                            height: height100,
                            width: height100,
                            color: blackColor,
                            child: Image.asset(assetPathToLoader),
                          ),
                          // SizedBox(width: width5),
                          (alertMessage != null && alertMessage.length > 0)
                              ? Text(alertMessage,
                                  style: getTextStyleSFProBoldFs16(whiteColor))
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      });
}
