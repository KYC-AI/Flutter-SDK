enum DocumentType {
  usaPassportCard(country: 'USA', document: 'Passport card', code: 'us_pc'),
  uaIdCard(country: 'Ukraine', document: 'ID card', code: 'ua_id'),
  uaForeignPassport(country: 'Ukraine', document: 'Foreign passport', code: 'ua_fp');

  final String country;
  final String document;
  final String code;

  const DocumentType({
    required this.country,
    required this.document,
    required this.code,
  });
}
