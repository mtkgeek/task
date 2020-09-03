import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task/app.dart';
import 'package:task/simple_bloc_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  EquatableConfig.stringify = kDebugMode;
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}
