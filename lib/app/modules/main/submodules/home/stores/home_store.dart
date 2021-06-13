import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/home/models/news.dart';
import 'package:plant_care/app/modules/main/submodules/home/repositories/news_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final NewsRepository newsRepository;

  @observable
  ObservableList<NewsModel> newsList = ObservableList<NewsModel>.of([]);

  _HomeStoreBase(this.newsRepository) {
    loadNews();
  }

  @action
  loadNews() async {
    newsList = ObservableList<NewsModel>.of(await newsRepository.getAll());
  }
}
