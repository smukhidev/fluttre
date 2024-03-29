# flutter-shurjopay-sdk-example
Flutter shurjoPay SDK Example

[![pub package](https://img.shields.io/pub/v/shurjopay_sdk.svg)](https://pub.dartlang.org/packages/shurjopay_sdk)

### GIT Command
```git_command
git init
git remote add origin https://github.com/smukhidev/fluttre.git
git remote -v
git fetch && git checkout master
git add .
git commit -m "Add Readme & Git Commit File"
git pull
git push --all
git status
git remote show origin
git status
```

# Usage

Flutter Environment: `flutter environment sdk and flutter version`

    sdk: ">=2.18.1 <3.0.0"
    flutter: ">=2.5.0"

Add dependencies: <kbd>shurjopay_sdk</kbd>

```git_request_dependencies
dependencies:
    connectivity_plus: ^2.3.7
    http: ^0.13.5
    webview_flutter: ^3.0.4
    shurjopay_sdk: ^latest_version
```

Import package:

```git_request_import
import "package:shurjopay_sdk/shurjopay_sdk.dart";
```

Android build.gradle

```git_build_gradle
android {
    compileSdkVersion 32
    
    defaultConfig {
        minSdkVersion 20
    }
}
```

Android AndroidManifest.xml

```git_android_manifest_xml
<uses-permission android:name="android.permission.INTERNET"/>
```

### Request Data Model Setup:

```git_request_data_model_setup
// TODO request data model setup
RequiredRequestData requiredRequestData = RequiredRequestData(
    username:           "username",
    password:           "password",
    prefix:             "prefix",
    currency:           "currency",
    amount:             1,
    orderId:            "order_id",
    discountAmount:     0,
    discPercent:        0,
    customerName:       "customer_name",
    customerPhone:      "customer_phone",
    customerEmail:      "customer_email",
    customerAddress:    "customer_address",
    customerCity:       "customer_city",
    customerState:      "customer_state",
    customerPostcode:   "customer_postcode",
    customerCountry:    "customer_country",
    returnUrl:          "return_url",
    cancelUrl:          "cancel_url",
    clientIp:           "client_ip",
    value1:             "value1",
    value2:             "value2",
    value3:             "value3",
    value4:             "value4",
);
```

### Response Listener:

```git_response_listener_setup
// TODO response listener
onSuccess:          (BuildContext context, TransactionInfo transactionInfo, ErrorSuccess errorSuccess)
onFailed:           (BuildContext context, String message)
```

### Response Listener Setup:

```git_response_listener_setup
// TODO request response listener setup
ShurjopaySdk shurjopaySdk = ShurjopaySdk(
    onSuccess: (BuildContext context, TransactionInfo transactionInfo, ErrorSuccess errorSuccess) {
        // TODO you get success response, if the transection is succefully completed.
    },
    onFailed: (BuildContext context, String message) {
        // TODO you get failed response, if the transection is failed or canceled.
    }
);
```

### Payment Request Setup:

```git_payment_request_setup
// TODO payment request setup
shurjopaySdk.makePayment(
    context:    context,
    sdkType:    "sdk request type live or sandbox", //TODO live/sandbox request
    data:       requiredRequestData,
);
```

### Response Listener Setup Extended:

```git_response_listener_setup_extended
// TODO request response listener setup
ShurjopaySdk shurjopaySdk = ShurjopaySdk(
    /// TODO you get success response, if the transection is succefully completed.
    onSuccess: (BuildContext context, TransactionInfo? transactionInfo, ErrorSuccess errorSuccess) {
        switch (errorSuccess.esType) {
            case ESType.INTERNET_SUCCESS:
                debugPrint("DEBUG_LOG_PRINT: surjoPay SDK SUCCESS: ${errorSuccess.message}");
                break;
            case ESType.SUCCESS:
                debugPrint("DEBUG_LOG_PRINT: surjoPay SDK SUCCESS TransactionInfo:");
                transactionInfo?.onPrint();
                break;
        }
        debugPrint("DEBUG_LOG_PRINT: surjoPay SDK SUCCESS: ${errorSuccess.esType.name}");
    },

    /// TODO you get failed response, if the transection is failed or canceled.
    onFailed: (BuildContext context, ErrorSuccess errorSuccess) {
        switch (errorSuccess.esType) {
            case ESType.INTERNET_ERROR:
                debugPrint("DEBUG_LOG_PRINT: surjoPay SDK ERROR: ${errorSuccess.message}");
                break;
            case ESType.HTTP_CANCEL:
                debugPrint("DEBUG_LOG_PRINT: surjoPay SDK ERROR: ${errorSuccess.message}");
                break;
            case ESType.ERROR:
                debugPrint("DEBUG_LOG_PRINT: surjoPay SDK ERROR: ${errorSuccess.message}");
                break;
        }
        debugPrint("DEBUG_LOG_PRINT: surjoPay SDK ERROR: ${errorSuccess.message}");
    },
);
```

### Payment Request Type:
```git_payment_request_type
// TODO payment request type
AppConstants.SDK_TYPE_SANDBOX
// TODO or
AppConstants.SDK_TYPE_LIVE
```

### Payment Success Respons:

```git_payment_respons_data
onSuccess: (BuildContext context, TransactionInfo transactionInfo) {
    // TODO you get success response, if the transection is succefully completed.
    int?    id                  = transactionInfo.id;
    String  orderId             = transactionInfo.orderId;
    String? currency            = transactionInfo.currency;
    double? amount              = transactionInfo.amount;
    double? payableAmount       = transactionInfo.payableAmount;
    double? discsountAmount     = transactionInfo.discsountAmount;
    double? discPercent         = transactionInfo.discPercent;
    double? usdAmt              = transactionInfo.usdAmt;
    double? usdRate             = transactionInfo.usdRate;
    String? cardHolderName      = transactionInfo.cardHolderName;
    String? cardNumber          = transactionInfo.cardNumber;
    String? phoneNo             = transactionInfo.phoneNo;
    String? bankTrxId           = transactionInfo.bankTrxId;
    String? invoiceNo           = transactionInfo.invoiceNo;
    String? bankStatus          = transactionInfo.bankStatus;
    String? customerOrderId     = transactionInfo.customerOrderId;
    int?    spCode              = transactionInfo.spCode;
    String? spMassage           = transactionInfo.spMassage;
    String? name                = transactionInfo.name;
    String? email               = transactionInfo.email;
    String? address             = transactionInfo.address;
    String? city                = transactionInfo.city;
    String? transactionStatus   = transactionInfo.transactionStatus;
    String? dateTime            = transactionInfo.dateTime;
    String? method              = transactionInfo.method;
    String? value1              = transactionInfo.value1;
    String? value2              = transactionInfo.value2;
    String? value3              = transactionInfo.value3;
    String? value4              = transactionInfo.value4;
}
```

### Payment Request Data Model (Data Type):

```git_payment_request_data_type
CheckoutRequestData
String  token;
int     storeId;
String  prefix;
String  currency;
String  returnUrl;
String  cancelUrl;
double  amount;
String  orderId;
double? discsountAmount;
double? discPercent;
String  clientIp;
String  customerName;
String  customerPhone;
String? customerEmail;
String  customerAddress;
String  customerCity;
String? customerState;
String? customerPostcode;
String? customerCountry;
String? value1;
String? value2;
String? value3;
String? value4;
```

### Payment Respons Data Model (Data Type):

```git_payment_response_data_type
TransactionInfo
int?    id;
String  orderId;
String? currency;
double? amount;
double? payableAmount;
double? discsountAmount;
double? discPercent;
double? usdAmt;
double? usdRate;
String? cardHolderName;
String? cardNumber;
String? phoneNo;
String? bankTrxId;
String? invoiceNo;
String? bankStatus;
String? customerOrderId;
int?    spCode;
String? spMassage;
String? name;
String? email;
String? address;
String? city;
String? transactionStatus;
String? dateTime;
String? method;
String? value1;
String? value2;
String? value3;
String? value4;
```
## Flutter shurjoPay SDK v2 `Version` `<1.2.0`

### Response Listener (`Version <1.2.0`):

```git_response_listener_setup_old1
// TODO response listener
onSuccess:          (BuildContext context, TransactionInfo transactionInfo)
onFailed:           (BuildContext context, String message)
onInternetFailed:   (BuildContext context, String message)
```
### Response Listener Setup (`Version <1.2.0`):

```git_response_listener_setup
// TODO request response listener setup
ShurjopaySdk shurjopaySdk = ShurjopaySdk(
    onSuccess: (BuildContext context, TransactionInfo transactionInfo) {
        // TODO you get success response, if the transection is succefully completed.
    },
    onFailed: (BuildContext context, String message) {
        // TODO you get failed response, if the transection is failed or canceled.
    },
    onInternetFailed: (BuildContext context, String message) {
        // TODO you get internet failed message, if the internet is not connected or on internet.
    },
);
```
### Payment Request Setup (`Version <1.2.0`):

```git_payment_request_setup
// TODO payment request setup
shurjopaySdk.makePayment(
    context:    context,
    sdkType:    "sdk request type live or sandbox", //TODO live/sandbox request
    data:       requiredRequestData,
);
```

Flutter shurjoPay SDK v2
