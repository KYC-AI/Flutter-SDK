// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_verification_repository_impl.dart' as _i15;
import '../data/api/base/api_base_repository_impl.dart' as _i13;
import '../data/general/configure_repository_impl.dart' as _i6;
import '../data/log/log_impl.dart' as _i12;
import '../domain/model/mapper/document_info_mapper.dart' as _i7;
import '../domain/model/mapper/face_info_mapper.dart' as _i8;
import '../domain/repository/api/api_verification_repository.dart' as _i14;
import '../domain/repository/general/configure_repository.dart' as _i5;
import '../domain/repository/log/log.dart' as _i11;
import '../domain/usecases/check_person_from_document_use_case.dart' as _i3;
import '../domain/usecases/check_person_use_case.dart' as _i4;
import '../domain/usecases/get_document_info_use_case.dart' as _i9;
import '../domain/usecases/get_face_info_use_case.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.CheckPersonFromDocumentUseCase>(
      () => _i3.CheckPersonFromDocumentUseCase());
  gh.lazySingleton<_i4.CheckPersonUseCase>(() => _i4.CheckPersonUseCase());
  gh.lazySingleton<_i5.ConfigureRepository>(
      () => _i6.ConfigureRepositoryImpl());
  gh.lazySingleton<_i7.DocumentInfoMapper>(() => _i7.DocumentInfoMapper());
  gh.lazySingleton<_i8.FaceInfoMapper>(() => _i8.FaceInfoMapper());
  gh.lazySingleton<_i9.GetDocumentInfoUseCase>(
      () => _i9.GetDocumentInfoUseCase());
  gh.lazySingleton<_i10.GetFaceInfoUseCase>(() => _i10.GetFaceInfoUseCase());
  gh.lazySingleton<_i11.Log>(() => _i12.LogImpl());
  gh.singleton<_i13.ApiBaseRepositoryImpl>(
      _i13.ApiBaseRepositoryImpl(get<_i5.ConfigureRepository>()));
  gh.lazySingleton<_i14.ApiVerificationRepository>(
      () => _i15.ApiVerificationRepositoryImpl(
            get<_i13.ApiBaseRepositoryImpl>(),
            get<_i5.ConfigureRepository>(),
          ));
  return get;
}
