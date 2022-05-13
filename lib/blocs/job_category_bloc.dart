import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/job_category_model.dart';

class JobCategoryBloc {
  final _repository = Repository();
  final _jobCategoriesFetcher = PublishSubject<JobCategory>();

  Stream<JobCategory> get allJobCategories => _jobCategoriesFetcher.stream;

  fetchAllJobCategories() async {
    JobCategory itemModel = await _repository.fetchAllJobCategories();
    _jobCategoriesFetcher.sink.add(itemModel);
  }

  dispose() {
    _jobCategoriesFetcher.close();
  }
}

final bloc = JobCategoryBloc();