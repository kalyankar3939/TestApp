//
//  AppConstant.swift
//  BaseProject
//
//  Created by The Appineers on 27/08/19.
//  Copyright © 2019 The Appineers. All rights reserved.
//

import UIKit


///Constants user in the app
struct AppConstants {
    
    /// App color
    static let appColor = UIColor(named: "AppColor")
    /// App Name
    static let appName = "The Appineers"
    /// App delegate object
    static let appDelegate = UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
    /// Screen width
    static let screenWidth = UIScreen.main.bounds.size.width
    /// screen height
    static let screenHeight = UIScreen.main.bounds.size.height
    
    /// Base URL for API
    static let baseUrl = getBaseURL()
    /// Enable encryption for the api
    static var enableEncryption = false
    /// Enable checksum for the api
    static var enableChecksum = false
    /// Is debug mode on
    static var isDebug = false
    /// AES Encryption ket
    static let aesEncryptionKey = "CIT@WS!"
    /// Webservice checksum
    static let ws_checksum = "ws_checksum"
    
    //isDetailsViewapihit
    static var isDetailsViewapihit = false
    
    /// Device vendor identifier
    static let deviceId = UIDevice.current.identifierForVendor?.uuidString
    /// Device name
    static let device_name = UIDevice.current.name
    /// Device model
//    static let device_model = UIDevice.modelName
    /// Plateform
    static let platform = "iOS"
    /// OS Verison
    static let os_version = UIDevice.current.systemVersion
    
    /// Access Token
    static var accessToken: String?
    /// Disable button colorsi
    static let dissableButtonColor = #colorLiteral(red: 0.03921568627, green: 0.09411764706, blue: 0.3450980392, alpha: 0.5975462148)
    
    /// Date Format to be user in the app
    static let dobFormate = "MMM dd yyyy"
    static let dateFormate = "yyyy/MM/dd"
    static let dateddmmyyy = "MM-dd-yyyy"
    /// Placeholder color for textfield
    static let placeholderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    static let sendBtnTintColor = UIColor(named: "sendBtnTintColor")
    static let dealBreakerFirstcolor = UIColor.init(red: 234/255.0, green: 42/255.0, blue: 67/255.0, alpha: 1)
    static let dealBreakerSecondcolor = UIColor.init(red: 234/255.0, green: 207/255.0, blue: 0/255.0, alpha: 1)
    static let dealBreakerThirdcolor = UIColor.init(red: 0/255.0, green: 232/255.0, blue: 116/255.0, alpha: 1)
    static let dealBreakerdefaultcellBG = UIColor.init(red: 248/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1)
    static let selectedInterestbordor = UIColor.init(red: 1/255.0, green: 211/255.0, blue: 187/255.0, alpha: 1)
    static let sectionHeadercolor     = UIColor.init(red: 46/255.0, green: 42/255.0, blue: 42/255.0, alpha: 1)
    static let attButetxtcolor        = UIColor.init(red: 144/255.0, green: 154/255.0, blue: 160/255.0, alpha: 1)
    static let txtHeadercolor         = UIColor.init(red: 255/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1)
    static let aceptDatecolor         = UIColor.init(red: 255/255.0, green: 241/255.0, blue: 69/255.0, alpha: 1)
    static let optionalDatecolor      = UIColor.init(red: 28/255.0, green: 130/255.0, blue: 244/255.0, alpha: 1)
    static let bottomMarginColor      = UIColor(red: 168.0/255.0, green: 163.0/255.0, blue: 163.0/255.0, alpha: 0.2)
    static let lblDatepurplecolor     = UIColor(red: 128.0/255.0, green: 0/255.0, blue: 255.0/255.0, alpha: 1)
    static let lblDateyellowcolor     = UIColor.init(red: 208/255.0, green: 160/255.0, blue: 0/255.0, alpha: 1)
    static let pageControllercolor    = UIColor.init(red: 24/255.0, green: 91/255.0, blue: 113/255.0, alpha: 1)
    static let colorReachlocation     = UIColor.init(red: 32/255.0, green: 208/255.0, blue: 208/255.0, alpha: 1)
    static let colorNotreached        = UIColor.init(red: 129/255.0, green: 21/255.0, blue: 178/255.0, alpha: 1)
    static let pinkColor              = UIColor.init(red: 255/255.0, green: 219/255.0, blue: 224/255.0, alpha: 1)
    static let activecolor            = UIColor(red: 2/255.0, green: 78/255.0, blue: 20/255.0, alpha: 1.0)
    
    static let chatsendColor          = UIColor(red: 88/255.0, green: 218/255.0, blue: 235/255.0, alpha: 1.0)
    static let chatreceivedColor      = UIColor(red: 227/255.0, green: 237/255.0, blue: 243/255.0, alpha: 1.0)
    
    static let babeDateCoinscolor     = UIColor(red: 45/255.0, green: 194/255.0, blue: 211/255.0, alpha: 1.0)
    static let honeyDateCoinscolor    = UIColor(red: 231/255.0, green: 84/255.0, blue: 128/255.0, alpha: 1.0)
    static let sweetDateCoinscolor    = UIColor(red: 32/255.0, green: 142/255.0, blue: 66/255.0, alpha: 1.0)
    /// Login type
    static var appType = LoginWith.socialEmail
    /// Background color user in the app
    static let backgroundColor = UIColor(named: "BackgroundColor")
    
    /// Subscription id for IAP
    static let subscriptionId = "goadfree"
    /// Is login skipped
    static var isLoginSkipped = false
    
    /// android purchase ids
    static let androidSubscriptionID = "com.app.whitelabel.one_month_subscription"
    static let androidGoAddFreeAId = "com.app.whitelabel.goadfree"
    
//    var appType = LoginWith.socialEmail
    
//    static let (kClientID,kGMSServicesAPIKey) = getServiceKey()
    static let subscriptionSharedSecretKey = getSubscriptionSecretKey()
    
    /// Banner AD Unit id
    static let bannerAdUnitID = "c9413c3746a91380"
    /// Interstitial AD Mob ID
    static let interstitialAdUnitId = ""
    static var finalUrl:[String] = []
    
    static var deletedId:[String] = []
    
    static var NearbyAPIKey = "AIzaSyCLlHTQK_4lzrVd2GgTkXSFMC_Dt9hz0SM"
    
}

func getBaseURL()-> String {
    #if QA
    return "http://34.227.134.31/Lease_My_Love-Web/leasemylove/WS/"
    #elseif DEVELOPMENT
//    return "http://18.211.58.235/Appineers_V4_Web/Appineers_V4/WS"
    return "http://34.227.134.31/Lease_My_Love-Web/leasemylove/WS/"

    #else
//    return "http://18.211.58.235/Appineers_V4_Web/Appineers_V4/WS"
//    return "http://54.80.150.240/Appineers_V4_Web/Appineers_V4/WS/"
    return "http://34.227.134.31/Lease_My_Love-Web/leasemylove/WS/"

//    return "http://100.24.42.250/Appineers_V4_Web/Appineers_V4/WS"
    #endif
}


func getSubscriptionSecretKey () -> String{
    #if QA
    return "e0ef6bdf06db42049f6562d2a84cdd5e"
    #elseif DEVELOPMENT
    return "e0ef6bdf06db42049f6562d2a84cdd5e"
    #else
    return "e0ef6bdf06db42049f6562d2a84cdd5e"
    #endif
    //e0ef6bdf06db42049f6562d2a84cdd5e - Client
    //888eecf613934b34846968adbd45e57f - James
}

/// Struct for the api
struct ApiServer {
    /// Local url
    static let local = ""
    /// URL for staging
    static let staging = "http://18.211.58.235/AppineersApp_V2/WS"
    /// URL for production
    static let prodcution = ""
}

/// Ad Mob Test details
struct AdMobTest {
    // Mark : Test Ids
//    /// Banner AD Unit id
//    static let bannerAdUnitID = "ca-app-pub-3940256099942544/2934735716"
//    /// Interstitial AD Mob ID
//    static let interstitialAdUnitId = "ca-app-pub-3940256099942544/4411468910"
//    /// Native AD Mob ID
//    static let nativeAdUnitId = "ca-app-pub-3940256099942544/3986624511"
//    /// Rewarded AD Mob ID
//    static let rewardedAdUnitId = "ca-app-pub-3940256099942544/1712485313"
    
    /// Banner AD Unit id
    static var bannerAdUnitID = ""
    /// Interstitial AD Mob ID
    static var interstitialAdUnitId = ""
    /// Native AD Mob ID
    static var nativeAdUnitId = ""
    /// Rewarded AD Mob ID
    static var rewardedAdUnitId = ""
}

/// MoPubTest details
struct MoPubTest {
    // Mark : Live Ids
    /// Banner AD Unit id
//    static var bannerAdUnitID = "0ac59b0996d947309c33f59d6676399f"
//    /// Interstitial AD Mob ID
//    static var interstitialAdUnitId = "4f117153f5c24fa6a3a92b818a5eb630"
    
    static var bannerAdUnitID = ""
    /// Interstitial AD Mob ID
    static var interstitialAdUnitId = ""
}

/// MoPubLive details
struct MoPubLive {
    // Mark : Live Ids
    /// Banner AD Unit id
//    static var bannerAdUnitID = "0ac59b0996d947309c33f59d6676399f"
//    /// Interstitial AD Mob ID
//    static var interstitialAdUnitId = "4f117153f5c24fa6a3a92b818a5eb630"
    /// Banner AD Unit id
    static var bannerAdUnitID = "c9413c3746a91380"
    /// Interstitial AD Mob ID
    static var interstitialAdUnitId = ""
}

/// Ad Mob Live details
struct AdMobLive {
    // Mark : Live Ids
//    /// Banner AD Unit id
//    static var bannerAdUnitID = "ca-app-pub-5439252228586946/7142817250"
//    /// Interstitial AD Mob ID
//    static var interstitialAdUnitId = "ca-app-pub-5439252228586946/4325082228"
//    /// Native AD Mob ID
//    static var nativeAdUnitId = "ca-app-pub-3940256099942544/3986624511"
//    /// Rewarded AD Mob ID
//    static var rewardedAdUnitId = "ca-app-pub-3940256099942544/1712485313"
    
    /// Banner AD Unit id
    static var bannerAdUnitID = ""
    /// Interstitial AD Mob ID
    static var interstitialAdUnitId = ""
    /// Native AD Mob ID
    static var nativeAdUnitId = ""
    /// Rewarded AD Mob ID
    static var rewardedAdUnitId = ""
    
    
}

// Subscription Ids
struct SubscriptionIds {
    static let subscriptionPeriods = ["monthly", "3months", "6months", "yearly"]
    static var daysArray = ["1 Month", "3 Month", "6 Month", "1 Year"]
    static var displayPriceArray = ["14.99", "13.99", "12.99", "9.99"]
    static var priceArray = ["14.99", "41.99", "77.99", "119.99"]
    static var offArray = ["", "$3 off", "$12 off", "$60 off"]
}

/// App Info
struct AppInfo {
    /// App Name
    static let kAppName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "Application"
    /// App Version
    static let kAppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    /// App Build version
    static let kAppBuildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1.0"
    /// App Bundle identifier
    static let kBundleIdentifier = Bundle.main.bundleIdentifier
    /// App Store ID
    static let kAppstoreID = "1480838689"
    /// Play store bundle id
    static let kAndriodAppId = "com.app.whitelabel"
}

struct AppleKeychainKeys {
    static let userIdentifier = "userIdentifier"
    static let userFirstName = "userIFirstName"
    static let userLastName = "userLastName"
    static let userEmail = "userEmail"
}

/// Social type
///
/// - facebook: Facebook
/// - google: Google
/// - none:none
enum SocialLoginType: String  {
/// Facebook
    case facebook = "facebook"
/// Google
    case google = "google"
    /// Apple
    case apple = "apple"
 /// None
    case none = ""
}

/// Device Plateform
struct Platform {
    
    /// Check if app is tested on simulator
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0 // Use this line in Xcode 7 or newer
    }
}

/// Userdefaults key
struct UserDefaultsKey {
    /// Device Token Key
    static let deviceTokenKey = "deviceTokenKey"
    /// Webservice token Key
    static let ws_token = "ws_token"
    /// User Detail
    static let userDetail = "user_detail"
    /// Notification Enabled
    static let notificationEnable = "notification_enable"
    /// Onboarding
    static let onboarding = "onboarding"
    //Splash Model key
    static let splashUserDetails = "config_detail"
    /// Retry Object
    static let retryUpload = "retry_upload"
    
    /// Additional Pop up show
    static let isAddress = "isAddress"
    /// Additional Pop up show only once
    static let isFirstTimeShow = "isFirstTimeShow"
    /// Accept Dating Instruction
    static let acceptDatInst = "acceptDatInst"
    /// firebaseID
    static let firebaseID = "firebaseID"

}

//// Enable or Disable Print Log
//public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
//    if AppConstants.isDebug == true {
//        let output = items.map { "\($0)" }.joined(separator: separator)
//        Swift.print(output, terminator: terminator)
//    }
//}

/// Position for the shadow
///
/// - top: Top
/// - bottom: Bottom
/// - full: Full
/// - line: Line
enum shadowPosition {
    /// - Position: Top
    case top
    /// - Position: bottom
    case bottom
    /// - Position: full
    case full
    /// - Position: line
    case line
}

/// Toast Notificaiton type
///
/// - Error: Error
/// - Success: Success
/// - Info: Info
enum NotificationType : String {
    /// - Type: Error
    case Error
    /// - Type: Success
    case Success
    /// - Type: Info
    case Info
}

/// Static page code
///
/// - privacyPolicy: PRivacy Polcy
/// - termsCondition: Terms and condition
/// - aboutUs: ABout Us
enum StaticPageCode: String {
    /// - Code: Privacy Policy
    case privacyPolicy = "privacypolicy"
    /// - Code: Terms And Conditions
    case termsCondition = "termsconditions"
    /// - Code: About US
    case aboutUs = "aboutus"
    /// - Code: Eula
    case eula = "eula"
}


/// Login with
///
/// - email: Email
/// - phone: Phone
/// - socialEmail: Social Email
/// - socialPhone: Social Phone
enum LoginWith {
    /// - Login With: Email
    case email
    /// - Login With: Phone
    case phone
    /// - Login With: SocialEmail
    case socialEmail
    /// - Login With: SocialPhone
    case socialPhone
}
