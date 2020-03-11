

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatUtil{

  static final String PATTERN_FULL_DATE_TIME      = "EEEE-d-MMM-yyyy-HH:mm";
  static final String PATTERN_DATE_TIME           = "d MMMM yyyy HH:mm";
  static final String PATTERN_DATE_MON_YEAR       = "d MMM yyyy";
  static final String LOCALE_EN_US                = "en_US";
  static final String LOCALE_ID                   = "id_ID";
  static String dateFormat;
  TextEditingController _departureTime = new TextEditingController();
  TextEditingController _estimateTimeArrival = new TextEditingController();

  /// param : DateTime
  /// ex :  Monday, 27 Jan ,2020 14:53
  static String fullDateTime(DateTime dateTime){
    dateFormat = DateFormat(PATTERN_FULL_DATE_TIME,LOCALE_EN_US).format(dateTime).toString();
    return dateFormat ;
  }
  /// param : DateTime
  /// ex :  Monday, 27 Jan 2020
  static String fullDate(DateTime dateTime){
    dateFormat = DateFormat(PATTERN_DATE_MON_YEAR,LOCALE_EN_US).format(dateTime).toString();
    return dateFormat ;
  }
  /// param : DateTime
  /// ex :  27 January 2020 14:53
  static String fullTime(DateTime dateTime){
    dateFormat = DateFormat(PATTERN_DATE_TIME,LOCALE_EN_US).format(dateTime).toString();
    return dateFormat ;
  }
}