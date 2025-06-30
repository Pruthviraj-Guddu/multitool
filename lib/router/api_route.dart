//int PAGE_LIMIT = 10;

abstract class ApiRoute {
  static const getPlaces =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  static const getPlaceDetails =
      'https://maps.googleapis.com/maps/api/place/details/json';

  static const devURL = 'https://dev-api.blive.co.in/consumer';
  static const stagingURL = 'https://staging-api.blive.co.in/consumer';
  static const prodURL = 'https://core.blive.co.in/consumer';
  static const ngRok = 'https://vnsvkb67-4001.inc1.devtunnels.ms/consumer';

  static const baseURL = devURL;
  // static const baseURL = ngRok;
  static const mainURL = '$baseURL/api/v1';
  static const sendOtp = '$mainURL/sms/send-otp';
  static const verifyOtp = '$mainURL/sms/verify-otp';
  static const getUserProfile = '$mainURL/user';
  static const getOrganisations = '$mainURL/organization';
  static const getTranslations = '$mainURL/language-aaset';
  static const eKycFaceMatch = '$mainURL/e-kyc/face-match';
  static const eKycDL = '$mainURL/e-kyc/read-dl';
  static const eKycAddressProof = '$mainURL/e-kyc/local-address-proof';
  static const eKycAadharProod = '$mainURL/e-kyc/read-aadhaar';
  static const eKycDocumentStatus = '$mainURL/e-kyc/document-status';
  static const homePage = '$mainURL/user/home-page';
  static const vehicleBrands = '$mainURL/vehicle/brands';
  static const chargingStations = '$baseURL/api/v2/charging-station/list';
  static const downloadInvoice = '$baseURL/api/v2/invoice/generate';
  //------------FLEET-OPERATORS
  static const fleetOperatorListing = '$mainURL/fleet';
  static const fleetOperatorVehicles = '$mainURL/vehicle/get-vehicle';
  static const vehiclePlans = '$mainURL/vehicle/plan/locationbased';

  //------------PAYMENTS
  static const paymentStatus = '$mainURL/payment/security-deposit-status';
  static const securityDeposit = '$mainURL/payment/security-deposit';
  static const securityDepositDue = '$mainURL/payment/security-deposit-due';
  static const payRental = '$mainURL/payment/rental-due';
  static const productOverView = '$mainURL/vehicle/';

  // ----------- help and support

  static const helpAndSupport = "$mainURL/issue-tracker";
  static const closeTicket = '$mainURL/issue-tracker/close-ticket';
  static const sosAlert = '$mainURL/issue-tracker';

  //------------upload profile photo
  static const updateProfile = '$mainURL/user';
  static const uploadProfilePicture = '$mainURL/file-upload/single';
  static const planSummary = '$mainURL/vehicle/plan-summary';
  static const uploadMultiplePhoto = '$mainURL/file-upload/multi';

  // ----------- vehicle listing price-color filter
  static const priceColorFilter = '$mainURL/vehicle/fleet/brand-variant-list';

  //----------- faq
  static const faq = "$mainURL/issue-tracker/faq";
  //---------- vehicle details
  static const vehicleDetails = "$mainURL/vehicle/my-vehicle/vehicle/details";

  //----------- subscription

  static const fetchTransactionHistory =
      '$mainURL/subscription/EzyCutomer-transactions';
  static const subscription = '$mainURL/subscription';

  // to register the device
  static const termAndPrivacy = '$mainURL/setting/';

  // notification
  static const getNotification = '$mainURL/notification';
  static const markAsSeen = '$mainURL/notification/mark-seen';
  static const markAsSeenById = '$mainURL/notification/mark-seen-by-id/';

  // api
  static const appVersion = '$mainURL/app-key/app-info';
  static const paymentInfo = '$mainURL/app-key/payment-info';
  //------------ save token
  static const saveFcm = '$mainURL/user/device-register';

  // wallet
  static const walletDetails = '$mainURL/payment/wallet-details';

  static String getGooglePlacesUrl(String apiKey) =>
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$apiKey';
  static String getGooglePlaceDetailsUrl(String apiKey) =>
      'https://maps.googleapis.com/maps/api/place/details/json?key=$apiKey';

  static String getGoogleMapsNavigationUrl(String lat, String lng) =>
      'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';

  bool get isDevEnv {
    if (ApiRoute.baseURL.contains(ApiRoute.devURL)) {
      return false;
    }
    return true;
  }
}
