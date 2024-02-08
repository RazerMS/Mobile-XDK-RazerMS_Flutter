import 'package:flutter/material.dart';

import 'package:rms_mobile_xdk_flutter/rms_mobile_xdk_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RMS XDK Example'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new ElevatedButton(
                child: const Text('Start XDK'),
                onPressed: () async {
                  var paymentDetails = {
                    // Optional, REQUIRED when use online Sandbox environment and account credentials.
                    'mp_dev_mode': false,

                    // Mandatory String. Values obtained from Razer Merchant Services.
                    'mp_username': '<username>',
                    'mp_password': '<password>',
                    'mp_merchant_ID': '<merchantid>',
                    'mp_app_name': '<appname>',
                    'mp_verification_key': '<vkey123>',

                    // Mandatory String. Payment values.
                    'mp_amount': '1.10', // Minimum 1.01
                    'mp_order_ID': '<orderid123>',
                    'mp_currency': 'MYR',
                    'mp_country': 'MY',

                    // Optional String.
                    'mp_channel':
                        '', // Use 'multi' for all available channels option. For individual channel seletion, please refer to https://github.com/RazerMS/rms-mobile-xdk-examples/blob/master/channel_list.tsv
                    'mp_bill_description': '',
                    'mp_bill_name': '',
                    'mp_bill_email': '',
                    'mp_bill_mobile': '',
                    'mp_channel_editing':
                        false, // Option to allow channel selection.
                    'mp_editing_enabled':
                        false, // Option to allow billing information editing.

                    // Optional, for Escrow.
                    'mp_is_escrow': '0', // Put "1" to enable escrow

                    // Optional, for credit card BIN restrictions and campaigns.
                    'mp_bin_lock': ['414170', '414171'],

                    // Optional, for mp_bin_lock alert error.
                    'mp_bin_lock_err_msg': 'Only UOB allowed',

                    // WARNING! FOR TRANSACTION QUERY USE ONLY, DO NOT USE THIS ON PAYMENT PROCESS.
                    // Optional, provide a valid cash channel transaction id here will display a payment instruction screen. Required if mp_request_type is 'Receipt'.
                    'mp_transaction_id': '',
                    // Optional, use 'Receipt' for Cash channels, and 'Status' for transaction status query.
                    'mp_request_type': '',

                    // Optional, use this to customize the UI theme for the payment info screen, the original XDK custom.css file can be obtained at https://github.com/RazerMS/rms-mobile-xdk-examples/blob/master/custom.css.
                    'mp_custom_css_url': '',

                    // Optional, set the token id to nominate a preferred token as the default selection, set "new" to allow new card only.
                    'mp_preferred_token': '',

                    // Optional, credit card transaction type, set "AUTH" to authorize the transaction.
                    'mp_tcctype': '',

                    // Optional, required valid credit card channel, set true to process this transaction through the recurring api, please refer the Razer Merchant Services Recurring API pdf.
                    'mp_is_recurring': false,

                    // Optional, show nominated channels.
                    'mp_allowed_channels': ['credit', 'credit3'],

                    // Optional, simulate offline payment, set boolean value to enable.
                    'mp_sandbox_mode': true,

                    // Optional, required a valid mp_channel value, this will skip the payment info page and go direct to the payment screen.
                    'mp_express_mode': true,

                    // Optional, extended email format validation based on W3C standards.
                    'mp_advanced_email_validation_enabled': true,

                    // Optional, extended phone format validation based on Google i18n standards.
                    'mp_advanced_phone_validation_enabled': true,

                    // Optional, explicitly force disable user input.
                    'mp_bill_name_edit_disabled': true,
                    'mp_bill_email_edit_disabled': true,
                    'mp_bill_mobile_edit_disabled': true,
                    'mp_bill_description_edit_disabled': true,

                    // Optional, EN, MS, VI, TH, FIL, MY, KM, ID, ZH.
                    'mp_language': 'EN',

                    // Optional, Cash channel payment request expiration duration in hour.
                    'mp_cash_waittime': 48,

                    // Optional, allow bypass of 3DS on some credit card channels.
                    'mp_non_3DS': true,

                    // Optional, disable card list option.
                    'mp_card_list_disabled': true,

                    // Optional for channels restriction, this option has less priority than mp_allowed_channels.
                    'mp_disabled_channels': ['credit']
                  };

                  String? result = await MobileXDK.start(paymentDetails);
                  print("Result" + result.toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
