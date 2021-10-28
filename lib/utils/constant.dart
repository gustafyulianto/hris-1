import 'package:flutter/material.dart';

// const kPrimaryColor = Color(0xFF00BF6D);
const kPrimaryColor = Color(0xFF1e77ec);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
// Colors
const Color kBlue = Color(0xFF306EFF);
const Color kLightBlue = Color(0xFF4985FD);
const Color kDarkBlue = Color(0xFF1046B3);
const Color kWhite = Color(0xFFFFFFFF);
const Color kGrey = Color(0xFFF4F5F7);
const Color kBlack = Color(0xFF2D3243);

const kDefaultPadding = 20.0;

// Animation
const Duration kButtonAnimationDuration = Duration(milliseconds: 600);
const Duration kCardAnimationDuration = Duration(milliseconds: 400);
const Duration kRippleAnimationDuration = Duration(milliseconds: 400);
const Duration kLoginAnimationDuration = Duration(milliseconds: 1500);

// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 32.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 16.0;
const double kSpaceL = 32.0;

class Url {

  //BASE URL
  // static final String BASE_URL = FlavorConfig.instance.values.baseUrl;
  static final String BASE_URL = 'http://127.0.0.1';

  // static final BASE_URL_SOCIOMILE = 'https://api-sm.s45.in';
  // static final SOCKET_URL_SOCIOMILE = 'https://push-sm.s45.in';

  // static final WORKSPACE_SHIFT_AGENTS = '/workspace/shift-agents';
  // static final WORKSPACE_CAMPAIGN = '/workspace/campaigns';

  // //NOTIFICATION
  // static final GET_ALL_NOTIFICATION = '/help/notifications/my-message';

  // //AUTH
  static final POST_LOGIN = '/login';
  // static final POST_CHANGE_PASSWORD = '/auth/profile/change-password';
  // static final CURRENT_USER = '/auth/profile';

  // //PROFILE
  // static final POST_UPLOAD_IMAGE = '/storage/files/';
  // static final GET_HISTORY_TRANSACTION = '/store/saldo/history';

  // //TEMPLATE MESSAGE
  // static final TEMPLATE_MESSAGES = '/ticketing/template-messages';

  // //SOCIOMILE/CHAT
  // static final GET_TICKETS = '/tickets';
  // static final GET_STREAMS = '/streams';
  // static final POST_REPLY = '/reply';
  // static final POST_EDIT_CUSTOMER = '/tickets/editable';
  // static final POST_UNLOCK_TICKET = '/tickets/unlock/';
}