enum ApiStatus {
  success,
  error,
  loading,
}

class ApiResponse<T> {
  final ApiStatus status;
  final T? data;
  final String? message;
  final int? statusCode;
  
  ApiResponse({
    required this.status,
    this.data,
    this.message,
    this.statusCode,
  });
  
  factory ApiResponse.success({
    T? data,
    String? message,
    int? statusCode,
  }) {
    return ApiResponse(
      status: ApiStatus.success,
      data: data,
      message: message ?? 'Succès',
      statusCode: statusCode ?? 200,
    );
  }
  
  factory ApiResponse.error({
    required String message,
    int? statusCode,
  }) {
    return ApiResponse(
      status: ApiStatus.error,
      data: null,
      message: message,
      statusCode: statusCode ?? 500,
    );
  }
  
  factory ApiResponse.loading() {
    return ApiResponse(
      status: ApiStatus.loading,
      data: null,
      message: 'Chargement...',
    );
  }
  
  bool get isSuccess => status == ApiStatus.success;
  bool get isError => status == ApiStatus.error;
  bool get isLoading => status == ApiStatus.loading;
  
  @override
  String toString() {
    return 'ApiResponse(status: $status, data: $data, message: $message)';
  }
}