import 'package:mvelopes/model/add_edit/model/add_edit.dart';

abstract class AddEditService{
  Future<void> addDetails(TransationModel value);
  Future<List<TransationModel>> getDeatails ();
  Future<void> deleteDetails(String id);
  Future<void> updataeDetails(TransationModel value);
}