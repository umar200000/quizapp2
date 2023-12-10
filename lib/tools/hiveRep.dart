import 'package:hive/hive.dart';

class HiveRep{
 final Box _box = Hive.box("names1");
 final Box _box1 = Hive.box("result");


 saveTime(List<String> str){
   _box.put("time", str);
 }

 getTime() => _box.get("time",defaultValue: <String>[]);

 saveTimeJ(List<String> str){
   _box.put("time1", str);
 }

 getTimeJ() => _box.get("time1",defaultValue: <String>[]);

 saveTimeP(List<String> str){
   _box.put("time2", str);
 }

 getTimeP() => _box.get("time2",defaultValue: <String>[]);



 saveNames(String str){
   _box.put("lessonName", str);
 }

 getNames() => _box.get("lessonName",defaultValue: "");

 saveResult(List<String> str){
   _box1.put("history", str);
 }

 getResult() => _box1.get("history",defaultValue: <String>[]);

 saveResultJ(List<String> str){
   _box1.put("java", str);
 }

 getResultJ() => _box1.get("java",defaultValue: <String>[]);

 saveResultP(List<String> str){
   _box1.put("python", str);
 }

 getResultP() => _box1.get("python",defaultValue: <String>[]);

}