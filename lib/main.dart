import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/my_app.dart';

import 'core/utils/bloc_observer/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}


