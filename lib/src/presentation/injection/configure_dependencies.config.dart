// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_verification_repository_impl.dart' as _i14;
import '../../data/api/base/api_base_repository_impl.dart' as _i12;
import '../../data/general/configure_repository_impl.dart' as _i5;
import '../../data/log/log_impl.dart' as _i11;
import '../../domain/model/mapper/document_info_mapper.dart' as _i6;
import '../../domain/model/mapper/face_info_mapper.dart' as _i7;
import '../../domain/repository/api/api_verification_repository.dart' as _i13;
import '../../domain/repository/general/configure_repository.dart' as _i4;
import '../../domain/repository/log/log.dart' as _i10;
import '../../domain/usecases/check_person_use_case.dart' as _i3;
import '../../domain/usecases/get_document_info_use_case.dart' as _i8;
import '../../domain/usecases/get_face_info_use_case.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.CheckPersonUseCase>(() => _i3.CheckPersonUseCase());
  gh.lazySingleton<_i4.ConfigureRepository>(
      () => _i5.ConfigureRepositoryImpl());
  gh.lazySingleton<_i6.DocumentInfoMapper>(() => _i6.DocumentInfoMapper());
  gh.lazySingleton<_i7.FaceInfoMapper>(() => _i7.FaceInfoMapper());
  gh.lazySingleton<_i8.GetDocumentInfoUseCase>(
      () => _i8.GetDocumentInfoUseCase());
  gh.lazySingleton<_i9.GetFaceInfoUseCase>(() => _i9.GetFaceInfoUseCase());
  gh.lazySingleton<_i10.Log>(() => _i11.LogImpl());
  gh.singleton<_i12.ApiBaseRepositoryImpl>(
      _i12.ApiBaseRepositoryImpl(get<_i4.ConfigureRepository>()));
  gh.lazySingleton<_i13.ApiVerificationRepository>(
      () => _i14.ApiVerificationRepositoryImpl(
            get<_i12.ApiBaseRepositoryImpl>(),
            get<_i4.ConfigureRepository>(),
          ));
  return get;
}
