import 'package:get_it/get_it.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/domain/use_cases/agent_use_cases.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/domain/use_cases/upload_apartment_case.dart';
import 'package:keja_hunt/core/features/agents/agent_unit_upload/domain/use_cases/upload_unit_case.dart';

void setupAgentDI(GetIt locator) {
  locator.registerLazySingleton<AgentUseCases>(
    () => AgentUseCases(
      uploadUnitCase: UploadUnitCase(),
      uploadApartmentCase: UploadApartmentCase(),
    ),
  );
}
