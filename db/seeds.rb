user = User.create(
  email: "123@123.com",
  password: "123123"
)

cnpj1 = "13790732000174"
cnpj2 = "23198636000195"

report_serialized = File.read("tmp/data_for_seed_13790732000174.txt")
report1 =  JSON.parse(report_serialized)
report_serialized = File.read("tmp/data_for_seed_23198636000195.txt")
report2 =  JSON.parse(report_serialized)

report1 = CompanyReport.create(
  cnpj: cnpj1,
  data: report1,
)
report2 = CompanyReport.create(
  cnpj: cnpj2,
  data: report2,
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

puts "Use the username: #{user.email} password: #{user.password} "
