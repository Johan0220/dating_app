import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

// Định nghĩa các trạng thái
abstract class ProfileUser extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends ProfileUser {}

class LoadingState extends ProfileUser {}

class LoadedState extends ProfileUser {
  final dynamic data;

  LoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class ErrorState extends ProfileUser {}

// Định nghĩa các sự kiện
abstract class MyEvent {}

class FetchDataEvent extends MyEvent {}

// Định nghĩa Bloc
class MyBloc extends Bloc<MyEvent, ProfileUser> {
  final Dio dio;

  MyBloc(this.dio) : super(InitialState());

  @override
  Stream<ProfileUser> mapEventToState(MyEvent event) async* {
    if (event is FetchDataEvent) {
      yield LoadingState();
      try {
        final response = await dio.get('https://my-api.com/data');
        yield LoadedState(response.data);
      } catch (e) {
        yield ErrorState();
      }
    }
  }
}