import 'dart:math';

import "package:flutter/material.dart";
import "package:shurjopay_sdk/shurjopay_sdk.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo shurjoPaySDK",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Flutter Demo shurjoPaySDK"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Pay By shurjoPay SDK"),
          onPressed: () {
            onShurjopaySdk(context);
          },
        ),
      ),
    );
  }

  void onShurjopaySdk(BuildContext context) {
    // TODO request data model setup
    int orderId = Random().nextInt(1000);
    RequiredRequestData requiredRequestData = RequiredRequestData(
      username: "username",
      password: "password",
      prefix: "prefix",
      currency: "BDT",
      amount: 1,
      orderId: "PPD$orderId",
      discountAmount: 0,
      discPercent: 0,
      customerName: "customer name",
      customerPhone: "01xxxxxxxxx",
      customerEmail: null,
      customerAddress: "customer address",
      customerCity: "customer city",
      customerState: null,
      customerPostcode: null,
      customerCountry: null,
      returnUrl: "YourReturnUrl",
      cancelUrl: "YourCancelUrl",
      clientIp: "ip",
      value1: null,
      value2: null,
      value3: null,
      value4: null,
    );
    // TODO request response listener setup
    ShurjopaySdk shurjopaySdk = ShurjopaySdk(
      /// TODO you get success response, if the transection is succefully completed.
      onSuccess: (BuildContext context, TransactionInfo? transactionInfo, ErrorSuccess errorSuccess) {
        switch (errorSuccess.esType) {
          case ESType.INTERNET_SUCCESS:
            debugPrint(
                "DEBUG_LOG_PRINT: surjoPay SDK SUCCESS: ${errorSuccess.message}");
            return;
          case ESType.SUCCESS:
            onTransaction(transactionInfo);
            return;
        }
        debugPrint(
            "DEBUG_LOG_PRINT: surjoPay SDK SUCCESS: ${errorSuccess.esType.name}");
      },

      /// TODO you get failed response, if the transection is failed or canceled.
      onFailed: (BuildContext context, ErrorSuccess errorSuccess) {
        switch (errorSuccess.esType) {
          case ESType.INTERNET_ERROR:
            debugPrint(
                "DEBUG_LOG_PRINT: surjoPay SDK ERROR: ${errorSuccess.message}");
            return;
          case ESType.HTTP_CANCEL:
            debugPrint(
                "DEBUG_LOG_PRINT: surjoPay SDK ERROR: ${errorSuccess.message}");
            return;
          case ESType.ERROR:
            debugPrint(
                "DEBUG_LOG_PRINT: surjoPay SDK ERROR: ${errorSuccess.message}");
            return;
        }
        debugPrint(
            "DEBUG_LOG_PRINT: surjoPay SDK ERROR: ${errorSuccess.message}");
      },
    );
    // TODO payment request setup
    shurjopaySdk.makePayment(
      context: context,
      sdkType: AppConstants.SDK_TYPE_SANDBOX, //TODO live/sandbox request
      data: requiredRequestData,
    );
  }

  void onTransaction(TransactionInfo? transactionInfo) {
    debugPrint("DEBUG_LOG_PRINT: surjoPay SDK SUCCESS TransactionInfo:");
    transactionInfo?.onPrint();
  }

  RequiredRequestData get requestData {
    RequiredRequestData requiredRequestData = RequiredRequestData(
      username: "username",
      password: "password",
      prefix: "prefix",
      currency: "currency",
      amount: 1,
      orderId: "order_id",
      discountAmount: 0,
      discPercent: 0,
      customerName: "customer_name",
      customerPhone: "customer_phone",
      customerEmail: "customer_email",
      customerAddress: "customer_address",
      customerCity: "customer_city",
      customerState: "customer_state",
      customerPostcode: "customer_postcode",
      customerCountry: "customer_country",
      returnUrl: "return_url",
      cancelUrl: "cancel_url",
      clientIp: "client_ip",
      value1: "value1",
      value2: "value2",
      value3: "value3",
      value4: "value4",
    );
    return requiredRequestData;
  }
}
