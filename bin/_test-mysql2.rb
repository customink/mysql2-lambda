require 'mysql2'

EXPECTED = [{"one"=>1}]

client = Mysql2::Client.new host: "mysql", username: "root", password: "root"
result = client.query("SELECT 1 AS one").each

if result == EXPECTED
  puts "PASSED! 🎉"
else
  abort "Result #{result.inspect} failed to be expected #{EXPECTED.inspect}"
end
