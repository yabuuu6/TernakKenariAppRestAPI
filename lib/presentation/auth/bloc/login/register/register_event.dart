part of 'register_bloc.dart';

sealed class RegisterEvent {}

class RegisterRequested extends RegisterEvent{
  final RegisterRequsetModel requestModel;

  RegisterRequested({required this.requestModel});
}