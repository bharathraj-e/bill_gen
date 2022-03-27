import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

CancelFunc loader() {
  return BotToast.showCustomLoading(
    toastBuilder: (_) => const CircularProgressIndicator(),
    allowClick: false,
    animationDuration: const Duration(milliseconds: 400),
    animationReverseDuration: const Duration(milliseconds: 400),
    backButtonBehavior: BackButtonBehavior.ignore,
    clickClose: false,
    crossPage: true,
    backgroundColor: Colors.white38,
    ignoreContentClick: true,
  );
}
