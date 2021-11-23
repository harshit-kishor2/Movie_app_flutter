import 'package:equatable/equatable.dart';

class DatesEntity extends Equatable {
  const DatesEntity({
    required this.maximum,
    required this.minimum,
  });

  final DateTime maximum;
  final DateTime minimum;

  @override
  List<Object> get props => [maximum, minimum];
}
