$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "secure_download/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "secure_download"
  s.version     = SecureDownload::VERSION
  s.summary     = "Secure download for CarrierWave with CanCan"
  s.description = "Secure download for CarrierWave with CanCan"
  s.authors     = ["Tanapol Nearunchorn"]
  s.email       = 'tanapo.sh@gmail.com'
  s.homepage    = 'https://github.com/Stackle/secure_download'
  s.license     = 'MIT'
  
  s.files = Dir["{app,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  
  s.add_dependency "rails", '~> 3.2'
  s.add_dependency "cancan", '~> 1.6'
  s.add_dependency "carrierwave", '~> 0.9'
  s.add_dependency "activesupport", '~> 3.2'
end
