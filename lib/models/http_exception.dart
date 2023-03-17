class HttpException implements Exception{
  final String message;
  HttpException(responseData, {required this.message});

  @override
  String toString(){
    return message;
  }
}