import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:scd_app/models/bm_model.dart';
import 'package:scd_app/repository/user_repository.dart';

part 'bm_history_store.g.dart';

class BMHistoryStore = _BMHistoryStore with _$BMHistoryStore;

abstract class _BMHistoryStore with Store {
  final UserRepository userRepository = Get.find();

  @observable
  ObservableFuture<List<BMModel>> fetchBMHistoryFuture = ObservableFuture.value([]);

  @observable
  List<BMModel> showBMs = [];

  @action
  ObservableFuture fetchBMHistory() => fetchBMHistoryFuture = ObservableFuture(userRepository.fetchBMs());
}
