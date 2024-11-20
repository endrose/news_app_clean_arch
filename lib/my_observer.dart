import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    log("Bloc : $bloc ---->  $change");
  }
}
