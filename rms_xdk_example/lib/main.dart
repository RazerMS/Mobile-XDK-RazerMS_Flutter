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
  late Map<String, dynamic> paymentDetails = {};

  @override
  void initState() {
    super.initState();
    paymentDetails = {
      'mp_username': '',
      'mp_password': '',
      'mp_merchant_ID': '',
      'mp_app_name': 'mobile',
      'mp_verification_key': '',

      // Mandatory String. Payment values
      'mp_order_ID': '',
      // Mandatory String. A value more than '1.00'
      'mp_amount': '1.01',
      'mp_currency': 'MYR',
      'mp_country': 'MY',

      // Optional String.
      //'mp_channel': '',
      // Use 'multi' for all available channels option. For individual channel seletion, please refer to "Channel Parameter" in "Channel Lists" in the MOLPay API Spec for Merchant pdf.
      'mp_bill_description': 'Reload Social Credit',
      'mp_bill_name': 'Razer Merchant',
      'mp_bill_email': 'mailto:faris.kamarudin@razer.com',
      'mp_bill_mobile': '+60102338716',

      'mp_silent_error': false,
      'mp_sandbox_mode': false,
      'mp_dev_mode': false,
      'mp_express_mode': false,
      'mp_preferred_token': 'new',
      'mp_ap_merchant_ID': '',
      'mp_advanced_email_validation_enabled': false,
      'mp_advanced_phone_validation_enabled': false,
      'mp_bill_name_edit_disabled': false,
      'mp_bill_email_edit_disabled': false,
      'mp_bill_mobile_edit_disabled': false,
      'mp_bill_description_edit_disabled': false,
      'mp_editing_enabled': false,
      'mp_disabled_channels': ['enetsD'],
      'mp_dpa_id': '',
      'mp_company': '',
      'mp_mc2p_key': [],
    };
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RMS XDK Example'),
        ),
        body: Column(
          children: [
            Expanded(
              child: new Column(
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            child: ListTile(
                              trailing:
                                  Text(paymentDetails['mp_order_ID'] ?? ''),
                              leading: Text('Order ID'),
                            ),
                          ),
                          SizedBox(),
                          Container(
                            child: ListTile(
                              trailing:
                                  Text(paymentDetails['mp_bill_name'] ?? ''),
                              leading: Text('Bill Name'),
                            ),
                          ),
                          SizedBox(),
                          Container(
                            child: ListTile(
                              trailing:
                                  Text(paymentDetails['mp_country'] ?? ''),
                              leading: Text('Country'),
                            ),
                          ),
                          SizedBox(),
                          Container(
                            child: ListTile(
                              trailing:
                                  Text(paymentDetails['mp_currency'] ?? ''),
                              leading: Text('Currency'),
                            ),
                          ),
                          SizedBox(),
                          Container(
                            child: ListTile(
                              trailing:
                                  Text(paymentDetails['mp_bill_mobile'] ?? ''),
                              leading: Text('Mobile'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  child: ListTile(
                    trailing: Text(paymentDetails['mp_amount'] ?? ''),
                    leading: Text('Total '),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  child: new ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.purple),
                    ),
                    child: const Text(
                      'Proceed to Payment',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      var result = MobileXDK.start(paymentDetails);
                      print("Result" + result.toString());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
