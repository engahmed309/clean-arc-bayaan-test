import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
class SimpleBlocObserver extends BlocObserver{
@override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }
  
}