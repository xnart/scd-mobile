import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';

import '../main.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  _ConnectivityStore() {
    connectivityStream = ObservableStream(connectivity.onConnectivityChanged);
  }

  @observable
  ObservableStream<ConnectivityResult> connectivityStream;
}
