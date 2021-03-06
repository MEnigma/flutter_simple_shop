import 'dart:convert';

import 'file:///D:/shop/flutter_simple_shop-master/lib/network/request_params_util.dart';
import 'aes_util.dart';

/// 加密请求工具类
class RequestUtil{

  /// 对参数进行加密发送给服务器
  /// [params] 请求参数
  /// 返回处理加工的数据
  /// 提交服务器的原始数据
  static ServerEncryptionData handleParams(Map<String, String> params){
    Map<String, String> newParams = RequestParamsUtils.keySort(params);
    String paramsToken = RequestParamsUtils.generateToken(newParams);
    String data = AesUtil.encryptAESCbc128WithPadding7(base64Encode(utf8.encode(json.encode(newParams))));
    return ServerEncryptionData(paramsToken, data);
  }
}

/// 封装
class ServerEncryptionData{
  String paramsToken;
  String  data;
  ServerEncryptionData(this.paramsToken,this.data);
}