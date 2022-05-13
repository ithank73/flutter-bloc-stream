class JobCategory{

  List<_Result> _results = [];

  JobCategory.fromJson(List<dynamic> parsedJson) {
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson.length; i++) {
      _Result result = _Result(parsedJson[i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

}

class _Result{
  late dynamic _id;
  late dynamic _name;



  _Result(parsedJson){
    _id = parsedJson['id'];
    _name = parsedJson['name'];
  }

  dynamic get id => _id;

  dynamic get name => _name;
}