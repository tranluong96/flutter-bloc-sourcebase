// flutter singleton pattern
class DataServiceMgmt {
  static final DataServiceMgmt _instance = DataServiceMgmt._internal();
  factory DataServiceMgmt() => _instance;
  DataServiceMgmt._internal();

  //khởi tạo biến count
  int count = 0;
  void incrementCount() {
    count++;
  }

  void decrementCount() {
    count--;
  }

  //clear all data
  void clearAllData() {
    count = 0;
  }

  static DataServiceMgmt get instance => _instance;
}
