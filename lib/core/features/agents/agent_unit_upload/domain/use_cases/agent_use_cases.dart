import 'package:keja_hunt/core/features/agents/agent_unit_upload/domain/use_cases/upload_apartment_case.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/domain/use_cases/upload_unit_case.dart';

class AgentUseCases {
  final UploadUnitCase uploadUnitCase;
  final UploadApartmentCase uploadApartmentCase;

  AgentUseCases({
    required this.uploadUnitCase,
    required this.uploadApartmentCase,
  });
}
