import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'print.dart';

Future<bool> confirm(String text,
    {String content = '',
    String? ok,
    String? cancel,
    bool barrierDismissible = true}) async {
  ok = ok ?? "Ok";
  cancel = cancel ?? "Cancel";
  bool? ret = await Get.dialog<bool>(
      AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        title: Center(
          child: SizedBox(
            width: Get.width,
            child: Text(
              text,
              textAlign: TextAlign.center,
              // style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        content:
            content.isEmpty ? null : Text(content, textAlign: TextAlign.center),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: Text(ok.toUpperCase()),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: Get.back,
                  child: Text(
                    cancel.toUpperCase(),
                    // style: const TextStyle(color: ColorConst.teal),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
      barrierDismissible: barrierDismissible);
  return ret ?? false;
}

void toast(String? msg, {bool long = false, Alignment? alignment}) {
  dPrint(msg);
  alignment ??= Alignment.bottomCenter;

  BotToast.showCustomText(
    toastBuilder: (_) {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0xFF323232),
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        // alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(0),
        constraints: BoxConstraints(
          maxWidth: 568.0,
          minWidth: GetPlatform.isMobile && Get.width < 568 ? Get.width : 350.0,
        ),
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Text(
          msg ?? '',
          style: GoogleFonts.roboto(fontSize: 14, color: Colors.white),
        ),
      );
    },
    animationDuration: const Duration(milliseconds: 100),
    animationReverseDuration: const Duration(milliseconds: 100),
    align: alignment,
    backButtonBehavior: BackButtonBehavior.close,
    duration: Duration(milliseconds: long ? 4000 : 3000),
    clickClose: false,
    crossPage: true,
    onlyOne: true,
  );
}
