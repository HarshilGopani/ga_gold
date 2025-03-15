// coverage:ignore-file

/// A set of enums use all over the

/// RequestType
enum Request {
  get,
  post,
  put,
  patch,
  delete,
  awsFileUpload,
  awsUpload,
  getApiWithoutBaseURL,
  filePath,
}

/// MQTT Enums
enum MQTTConnectionState {
  Connected,
  disconnected,
  subscribed,
  unsubscribed,
  connecting
}

enum LoginType {
  email,
  facebook,
  google,
  twitter,
  phoneNumber,
  apple,
}

/// Types of Buttons
enum ButtonType {
  cancelled,
  continued,
}

enum MatchType {
  phone,
  email,
  link,
  none,
}

/// Type of message.
enum MessageType {
  error,
  success,
  information,
}

enum UserType {
  self,
  other,
}

enum MediaPickSource {
  CAMERA,
  IMAGE,
  VIDEO,
}

enum SignupType {
  PHONE,
  EMAIL,
}

enum AwsFileType {
  FILE,
  BASE64,
}

enum AwsMediaType {
  IMAGE,
  VIDEO,
  OTHER,
}

enum MediaType {
  IMAGE,
  VIDEO,
  OTHER,
}

enum TransactionType {
  ALL,
  CREDIT,
  DEBIT,
}
