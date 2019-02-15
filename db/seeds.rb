user = User.create(
  email: "123@123.com",
  password: "123123",
  admin: true,
)

cnpj1 = "13790732000174"
cnpj2 = "23198636000195"
cnpj3 = "21567511000160"

report_serialized = File.read("tmp/data_for_seed_13790732000174.txt")
report1 =  JSON.parse(report_serialized)
report_serialized = File.read("tmp/data_for_seed_23198636000195.txt")
report2 =  JSON.parse(report_serialized)
report_serialized = {"info"=>{"env"=>"HOMOLOG", "type"=>"rule", "version"=>"2", "end_time"=>"13/02/2019 14:43:58.380", "start_time"=>"13/02/2019 14:43:52.639", "process_name"=>"big-data-corp", "compiler_version"=>"v3", "external_sources"=>[{"data"=>{"Result"=>{"Emails"=>[{"Type"=>"corporate", "IsMain"=>true, "IsActive"=>false, "IsRecent"=>false, "Priority"=>1, "CreationDate"=>"2017-01-01T00:00:00Z", "EmailAddress"=>"dario@apisassociados.com.br", "LastUpdateDate"=>"2018-08-03T00:00:00Z", "LastPassageDate"=>"2018-08-03T00:00:00Z", "EmailBadPassages"=>0, "FirstPassageDate"=>"2017-01-01T00:00:00Z", "ValidationStatus"=>"", "EmailQueryPassages"=>-1, "EmailTotalPassages"=>10, "LastValidationDate"=>"0001-01-01T00:00:00Z", "EmailCrawlingPassages"=>-1, "EmailNumberOfEntities"=>-1, "EmailValidationPassages"=>-1, "EmailMonthAveragePassages"=>-1}], "Phones"=>[{"Type"=>"WORK", "IsMain"=>true, "Number"=>"55435222", "AreaCode"=>"11", "HasOptIn"=>false, "IsActive"=>false, "IsRecent"=>false, "PlanType"=>"", "Priority"=>1, "Complement"=>"", "CountryCode"=>"55", "CreationDate"=>"2014-12-15T00:00:00Z", "CurrentCarrier"=>"", "LastUpdateDate"=>"2014-12-15T00:00:00Z", "LastPassageDate"=>"2014-12-15T00:00:00Z", "FirstPassageDate"=>"2014-12-15T00:00:00Z", "PhoneBadPassages"=>0, "IsInDoNotCallList"=>false, "PhoneQueryPassages"=>-1, "PhoneTotalPassages"=>10, "PortabilityHistory"=>[], "PhoneCrawlingPassages"=>10, "PhoneValidationPassages"=>0, "PhoneMonthAveragePassages"=>10}], "Domains"=>[], "Addresses"=>[{"City"=>"SAO BERNARDO DO CAMPO", "Type"=>"HOME", "State"=>"SP", "Title"=>"", "IsMain"=>true, "Number"=>"111", "Country"=>"Brazil", "ZipCode"=>"09750730", "HasOptIn"=>false, "IsActive"=>false, "IsRecent"=>false, "Latitude"=>0.0, "Priority"=>1, "Typology"=>"RUA", "Longitude"=>0.0, "Complement"=>"SALA 613 B", "IsRatified"=>false, "AddressMain"=>"JOSE VERSOLATO", "BuildingCode"=>"6B-DF-6E-AC-FA-B9-EE-14-19-F6-F4-C9-33-C8-EA-06", "CreationDate"=>"2014-12-15T00:00:00Z", "Neighborhood"=>"CENTRO", "HouseholdCode"=>"0B-A0-4C-30-4C-3C-A4-87-FA-C5-F1-4D-3F-E1-D9-FA", "LastUpdateDate"=>"2014-12-15T00:00:00Z", "LastPassageDate"=>"2014-12-15T00:00:00Z", "FirstPassageDate"=>"2014-12-15T00:00:00Z", "BuildingBadPassages"=>0, "AdditionalOutputData"=>{"IbgeCode"=>"3548708"}, "HouseholdBadPassages"=>0, "BuildingQueryPassages"=>-1, "BuildingTotalPassages"=>1, "HouseholdQueryPassages"=>-1, "HouseholdTotalPassages"=>1, "BuildingCrawlingPassages"=>0, "HouseholdCrawlingPassages"=>0, "HouseholdNumberOfEntities"=>1, "BuildingNumberOfHouseholds"=>-1, "BuildingValidationPassages"=>0, "HouseholdValidationPassages"=>0, "BuildingMonthAveragePassages"=>0, "HouseholdMonthAveragePassages"=>0}, {"City"=>"SAO BERNARDO DO CAMPO", "Type"=>"HOME", "State"=>"SP", "Title"=>"", "IsMain"=>false, "Number"=>"111", "Country"=>"Brazil", "ZipCode"=>"09750730", "HasOptIn"=>false, "IsActive"=>false, "IsRecent"=>false, "Latitude"=>0.0, "Priority"=>2, "Typology"=>"RUA", "Longitude"=>0.0, "Complement"=>"SALA 3703", "IsRatified"=>false, "AddressMain"=>"JOSE VERSOLATO", "BuildingCode"=>"6B-DF-6E-AC-FA-B9-EE-14-19-F6-F4-C9-33-C8-EA-06", "CreationDate"=>"2018-08-03T00:00:00Z", "Neighborhood"=>"CENTRO", "HouseholdCode"=>"04-5E-D2-30-5D-97-6B-1E-AC-B4-D1-F3-DA-A5-71-3F", "LastUpdateDate"=>"2014-12-15T00:00:00Z", "LastPassageDate"=>"2014-12-15T00:00:00Z", "FirstPassageDate"=>"2014-12-15T00:00:00Z", "BuildingBadPassages"=>0, "AdditionalOutputData"=>{"IbgeCode"=>"3548708"}, "HouseholdBadPassages"=>0, "BuildingQueryPassages"=>-1, "BuildingTotalPassages"=>1, "HouseholdQueryPassages"=>-1, "HouseholdTotalPassages"=>1, "BuildingCrawlingPassages"=>0, "HouseholdCrawlingPassages"=>0, "HouseholdNumberOfEntities"=>1, "BuildingNumberOfHouseholds"=>-1, "BuildingValidationPassages"=>0, "HouseholdValidationPassages"=>0, "BuildingMonthAveragePassages"=>0, "HouseholdMonthAveragePassages"=>0}], "BasicData"=>{"Age"=>4.0, "Aliases"=>{}, "TradeName"=>"FIXAMED", "Activities"=>[{"Code"=>"4645101", "IsMain"=>true, "Activity"=>"COMERCIO ATACADISTA DE INSTRUMENTOS E MATERIAIS PARA USO MEDICO, CIRURGICO, HOSPITALAR E DE LABORATORIOS"}], "TaxRegimes"=>{"Simples"=>true}, "FoundedDate"=>"2014-12-15T00:00:00Z", "LegalNature"=>{"Code"=>"2062", "Activity"=>"SOCIEDADE EMPRESARIA LIMITADA"}, "TaxIdNumber"=>"21567511000160", "TaxIdOrigin"=>"Receita Federal", "TaxIdStatus"=>"ATIVA", "CreationDate"=>"2014-12-15T00:00:00Z", "OfficialName"=>"FIXAMED COMERCIO IMPORTACAO E EXPORTACAO DE PRODUTOS MEDICOS E HOSPITALARES LTDA", "TaxIdCountry"=>"Brazil", "IsHeadquarter"=>true, "LastUpdateDate"=>"2018-10-18T00:00:00Z", "HeadquarterState"=>"", "NameUniquenessScore"=>-1.0, "AdditionalOutputData"=>{"Capital"=>"5000.00"}, "AlternativeIdNumbers"=>{}}, "MatchKeys"=>"doc{21567511000160}", "OnlineAds"=>[], "Processes"=>{"Lawsuits"=>[{"Type"=>"Indefinido", "State"=>"SP", "Value"=>10524.0, "Number"=>"0005604-17.2018.8.26.0161", "Status"=>"", "Parties"=>[{"Doc"=>"09180382860", "Name"=>"LUIZ FERNANDO PARREIRA MILENA", "Type"=>"Relator", "Polarity"=>"Undefined", "PartyDetails"=>{}}, {"Doc"=>"22187947807", "Name"=>"GILMARA MICHELE DA SILVA", "Type"=>"Requerente", "Polarity"=>"Active", "PartyDetails"=>{}}, {"Doc"=>"", "Name"=>"MOVIDA LOCACOES DE VEICULOS S/A", "Type"=>"Requerido", "Polarity"=>"Passive", "PartyDetails"=>{}}, {"Doc"=>"21567511000160", "Name"=>"FIXAMED", "Type"=>"Requerido", "Polarity"=>"Passive", "PartyDetails"=>{}}], "Updates"=>[], "CourtName"=>"tjsp", "CourtType"=>"Cível", "Petitions"=>[], "CourtLevel"=>"1", "LastUpdate"=>"2018-05-03T16:04:45.605Z", "NoticeDate"=>"2018-04-17T00:00:00", "CaptureDate"=>"2018-05-03T16:04:45.605Z", "MainSubject"=>"INCLUSÃO INDEVIDA EM CADASTRO DE INADIMPLENTES", "PublicationDate"=>"2018-04-19T00:00:00"}], "TotalLawsuits"=>2, "TotalLawsuitsAsAuthor"=>2, "TotalLawsuitsAsDefendant"=>0}, "Relationships"=>{"TotalOwned"=>0, "TotalOwners"=>2, "Relationships"=>[{"CreationDate"=>"2017-07-28T00:00:00Z", "LastUpdateDate"=>"2018-08-03T00:00:00Z", "RelationshipName"=>"SOCIO-ADMINISTRADOR", "RelationshipType"=>"QSA", "RelatedEntityName"=>"GRACIELLE MARTINS DA SILVA DE OLIVEIRA", "RelationshipLevel"=>"Direct", "RelatedEntityTaxIdType"=>"CPF", "RelatedEntityTaxIdNumber"=>"34296585860", "RelatedEntityTaxIdCountry"=>"Brazil"}, {"CreationDate"=>"2017-01-01T00:00:00Z", "LastUpdateDate"=>"2018-08-03T00:00:00Z", "RelationshipName"=>"SOCIO-ADMINISTRADOR", "RelationshipType"=>"QSA", "RelatedEntityName"=>"LUIS HENRIQUE DE OLIVEIRA", "RelationshipLevel"=>"Direct", "RelatedEntityTaxIdType"=>"", "RelatedEntityTaxIdNumber"=>"", "RelatedEntityTaxIdCountry"=>"Brazil"}], "TotalEmployees"=>0, "TotalRelationships"=>2}, "EconomicGroups"=>{"EconomicGroups"=>[{"TotalPEPs"=>-1, "TotalCities"=>1, "TotalEmails"=>1, "TotalOwners"=>2, "TotalPeople"=>6, "TotalPhones"=>1, "TotalStates"=>1, "TotalBranches"=>0, "TotalLawsuits"=>-1, "TotalPassages"=>-1, "TotalWebsites"=>0, "TotalAddresses"=>2, "TotalCompanies"=>0, "TotalSanctioned"=>-1, "MainCompanyTaxId"=>"21567511000160", "TotalBadPassages"=>-1, "TotalIncomeRange"=>"ACIMA DE 1MM ATE 2.5MM", "EconomicGroupType"=>"First-level", "TotalHeadquarters"=>-1, "EconomicActivities"=>[], "TotalEmployeesRange"=>"006 A 009", "TotalActiveCompanies"=>-1, "TotalInactiveCompanies"=>-1}]}, "ActivityIndicators"=>{"HasActivity"=>true, "IncomeRange"=>"ACIMA DE 1MM ATE 2.5MM", "EmployeesRange"=>"006 A 009", "NumberOfBranches"=>0}, "MediaProfileAndExposure"=>{}}, "Status"=>{"emails"=>{"Code"=>0, "Message"=>"OK"}, "phones"=>{"Code"=>0, "Message"=>"OK"}, "domains"=>{"Code"=>0, "Message"=>"OK"}, "addresses"=>{"Code"=>0, "Message"=>"OK"}, "processes"=>{"Code"=>0, "Message"=>"OK"}, "basic_data"=>{"Code"=>0, "Message"=>"OK"}, "online_ads"=>{"Code"=>0, "Message"=>"OK"}, "relationships"=>{"Code"=>0, "Message"=>"OK"}, "activity_indicators"=>{"Code"=>0, "Message"=>"OK"}, "economic_group_data"=>{"Code"=>0, "Message"=>"OK"}, "media_profile_and_exposure"=>{"Code"=>-1201, "Message"=>"DATASET IS TOO SLOW. PLEASE TRY AGAIN IN A FEW MINUTES"}}, "QueryId"=>"cc3a364c-7845-4fd2-acf0-f737c1c08531", "ElapsedMilliseconds"=>4591}, "step"=>"bigDataCorp", "source_type"=>"Big Boost Bureau Ver 2.0"}], "output_size_bytes"=>7798, "process_execution_id"=>"9afb4c83-69d6-4cc9-8086-793e6e223baf", "was_needed_to_deploy"=>true, "process_execution_date"=>1550076238380, "process_execution_time"=>"00:00:05.741", "process_execution_time_millis"=>5741}, "result"=>{"value"=>{}}}
report3 = report_serialized.to_hash

report1 = CompanyReport.create(
  cnpj: cnpj1,
  data: report1,
)
report2 = CompanyReport.create(
  cnpj: cnpj2,
  data: report2,
)
report3 = CompanyReport.create(
  cnpj: cnpj3,
  data: report3,
)

report_requests1 = ReportRequest.create(
  cnpj: cnpj1,
  user: user,
  company_report: report1,
)
report_requests2 = ReportRequest.create(
  cnpj: cnpj2,
  user: user,
  company_report: report2,
)
report_requests3 = ReportRequest.create(
  cnpj: cnpj3,
  user: user,
  company_report: report3,
)

puts "Use the username: #{user.email} password: #{user.password} "
