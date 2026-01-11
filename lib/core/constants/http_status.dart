
class HttpStatus {
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int noContent = 204;
  
  static const int movedPermanently = 301;
  static const int found = 302;
  
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int paymentRequired = 402;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int conflict = 409;
  static const int tooManyRequests = 429;

  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;
  
  static bool isSuccess(int code) => code >= 200 && code < 300;
  static bool isRedirect(int code) => code >= 300 && code < 400;
  static bool isClientError(int code) => code >= 400 && code < 500;
  static bool isServerError(int code) => code >= 500 && code < 600;
  static bool isError(int code) => isClientError(code) || isServerError(code);
  
}