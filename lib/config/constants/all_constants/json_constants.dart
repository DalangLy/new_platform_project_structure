String id({required Map<String, dynamic> json,}){
  return json['id'] as String;
}

DateTime createdDate({required Map<String, dynamic> json,}){
  return DateTime.parse(json['cd'] as String);
}

DateTime? modifiedDate({required Map<String, dynamic> json,}){
  return json['md'] == null ? null : DateTime.parse(json['md'] as String);
}

String createdUserId({required Map<String, dynamic> json,}){
  return json['cuid'] as String;
}

String? modifiedUserId({required Map<String, dynamic> json,}){
  return json['muid'] as String?;
}

String code({required Map<String, dynamic> json,}){
  return json['code'] as String;
}

String? description({required Map<String, dynamic> json,}){
  return json['desc'] as String?;
}

String periodId({required Map<String, dynamic> json,}){
  return json['pid'] as String;
}

String? shortText({required Map<String, dynamic> json,}){
  return json['stext'] as String?;
}

String? text({required Map<String, dynamic> json,}){
  return json['text'] as String?;
}

String? longText({required Map<String, dynamic> json,}){
  return json['ltext'] as String?;
}

String recordStatusTypeId({required Map<String, dynamic> json,}){
  return json['rstid'] as String;
}

String recordStatusTypeCode({required Map<String, dynamic> json,}){
  return json['rstcode'] as String;
}

String reasonCodeId({required Map<String, dynamic> json,}){
  return json['rcid'] as String;
}

String reasonCodeCode({required Map<String, dynamic> json,}){
  return json['rccode'] as String;
}

String? reasonCodeDescription({required Map<String, dynamic> json,}){
  return json['rcdesc'] as String?;
}

DateTime? periodBeginDate({required Map<String, dynamic> json,}){
  return json['pbd'] == null ? null : DateTime.parse(json['pbd'] as String);
}

DateTime? periodEndDate({required Map<String, dynamic> json,}){
  return json['ped'] == null ? null : DateTime.parse(json['ped'] as String);
}

double jsonToDouble({required Map<String, dynamic> json, required String field} ){
  return (json[field] as num).toDouble();
}

String jsonNonNullableString({required Map<String, dynamic> json, required String field}){
  return json[field] as String;
}

String? jsonNullableString({required Map<String, dynamic> json, required String field}){
  return json[field] as String?;
}

bool jsonNonNullableBool({required Map<String, dynamic> json, required String field}){
  return json[field] as bool;
}

List<T> jsonToListEntity<T>({required Map<String, dynamic> json, required String field, required Function(Map<String, dynamic> json,) eachJson}){
  return (json[field] as List<dynamic>).map<T>((e) => eachJson(e as Map<String, dynamic>)).toList();
}