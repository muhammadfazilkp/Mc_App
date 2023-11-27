import 'package:hive/hive.dart';
import '../../model/visitors_model.dart';

class CustomNoteAdapter extends TypeAdapter<Visitors> {
  @override
  int get typeId => 0;

  @override
  Visitors read(BinaryReader reader) {
    try {
      final firstname = reader.readString();
      final lastname = reader.readString();
      return Visitors(firstname: firstname, lastname: lastname);
    } catch (e) {
      print('Error reading note: $e');
      return Visitors(firstname: '', lastname: '');
    }
  }

  @override
  void write(BinaryWriter writer, Visitors obj) {
    try {
      writer.writeString(obj.firstname);
      writer.writeString(obj.lastname);
    } catch (e) {
      print('Error writing note: $e');
    }
  }
}