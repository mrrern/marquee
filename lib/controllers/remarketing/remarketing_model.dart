import 'package:freezed_annotation/freezed_annotation.dart';

part 'remarketing_model.freezed.dart';
part 'remarketing_model.g.dart';

@freezed
abstract class RemarketingUserModel with _$RemarketingUserModel {
  const factory RemarketingUserModel({
    required String id,
    required String nombre,
    required String email,
    required DateTime fechaCreacion,
    required bool tieneBodaActiva,
    bool? isSelected,
    String? bodaId,
    required String mailto,
  }) = _RemarketingUserModel;

  factory RemarketingUserModel.fromJson(Map<String, dynamic> json) =>
      _$RemarketingUserModelFromJson(json);
}
