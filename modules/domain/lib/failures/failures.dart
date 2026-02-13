abstract class Failure {}

class NetworkFailure extends Failure {} 

class ServerFailure extends Failure {
  final String? technicalMessage; 
  ServerFailure([this.technicalMessage]);
}
