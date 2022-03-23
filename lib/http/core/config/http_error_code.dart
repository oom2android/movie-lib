class HttpErrorCode {






  static Map<int, String> msg = {
    200: "成功",
    400: '请求语法错误',
    401: '没有权限',
    403: '服务器拒绝执行',
    404: '无法连接服务器',
    405: '请求方法被禁止',
    500: '服务器内部错误',
    502: '无效的请求',
    503: '服务器挂了',
    505: '不支持HTTP协议请求',
  };

  static String getMsg(int code) {
    return msg[code] ?? "未知错误";
  }
}
