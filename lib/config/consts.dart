
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Size for the "smaller" icons, e.g. when they belong to less important items
/// and we don't want to fill the whole screen
const double ICON_SIZE_SMALL = 20;

/// Default wger server during login
const DEFAULT_SERVER_PROD = 'https://api.supcoder.com';
const DEFAULT_SERVER_TEST = 'http://localhost:8000/';

// Debug mode Login Data
const TESTSERVER_USER_NAME = 'user';
const TESTSERVER_PASSWORD = 'flutteruser';



/// Time to locally cache values such as ingredients, etc
const DAYS_TO_CACHE = 20;

/// Name of the submit button in forms
const SUBMIT_BUTTON_KEY_NAME = 'submit-button';

/// Local Preferences keys
const PREFS_USER = 'userData';
const PREFS_LAST_SERVER = 'lastServer';

const DEFAULT_ANIMATION_DURATION = Duration(milliseconds: 200);
const DEFAULT_ANIMATION_CURVE = Curves.bounceIn;

final DateFormatLists = DateFormat('yyyy-MM-dd');

