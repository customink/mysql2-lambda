Gem::Specification.new do |s|
  s.name = 'mysql2-lambda'
  s.version = '0.5.3.0'
  s.authors = ['Ken Collins']
  s.license = "MIT"
  s.email = ['kcollins@customink.com']
  s.homepage = 'https://github.com/customink/mysql2-lambda'
  s.rdoc_options = ['--charset=UTF-8']
  s.summary = 'Precompiled Mysql2 gem for AWS Lambda.'
  s.metadata = {
    'bug_tracker_uri'   => "#{s.homepage}/issues",
    'changelog_uri'     => "#{s.homepage}/releases/tag/#{s.version}",
    'homepage_uri'      => s.homepage,
    'source_code_uri'   => "#{s.homepage}/tree/#{s.version}",
  }
  s.required_ruby_version = '>= 2.5.5'
  s.files = Dir.glob('./**/*')
end
