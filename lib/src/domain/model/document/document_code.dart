enum DocumentCode {
  uaIdCard(country: 'Ukraine', document: 'ID card', code: 'ua_id'),
  uaForeignPassport(country: 'Ukraine', document: 'Foreign passport', code: 'ua_fp'),
  geIdCard(country: 'Georgia', document: 'ID card', code: 'ge_id'),
  kzIdCard(country: 'Kazakhstan', document: 'ID card', code: 'kz_id'),
  inIdCard(country: 'Indonesia', document: 'ID card', code: 'in_id'),
  uzIdCard(country: 'Uzbekistan', document: 'ID card', code: 'uz_id'),
  uzForeignPassport(country: 'Uzbekistan', document: 'Foreign passport', code: 'uz_fp'),
  uzPersonalPassport(country: 'Uzbekistan', document: 'Personal passport', code: 'uz_pb');

  final String country;
  final String document;
  final String code;

  const DocumentCode({
    required this.country,
    required this.document,
    required this.code,
  });
}
