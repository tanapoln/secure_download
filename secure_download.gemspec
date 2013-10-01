$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "secure_download/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "secure_download"
  s.version     = SecureDownload::VERSION
  s.summary     = "Secure download for CarrierWave and CanCan"
  s.description = "A simple hello world gem"
  s.authors     = ["Tanapol Nearunchorn"]
  s.email       = 'tanapo.sh@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/secure_download'
  s.license     = 'MIT'
  
  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  
  s.add_dependency "rails"
  s.add_dependency "cancan"
  s.add_dependency "carrierwave"
  s.add_dependency "activesupport"
end
