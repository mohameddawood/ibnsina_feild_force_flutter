class ApiResponse<T> {
  Status status;
  bool isSuccess;
  int statusCode;
  List<String> errorList = [];
  T data;
  String statusMessage;

  ApiResponse.loading(this.statusMessage) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.statusMessage, this.statusCode, {this.errorList})
      : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $statusMessage \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
