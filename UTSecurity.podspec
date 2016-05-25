Pod::Spec.new do |s|
  s.name         = "UTSecurity"
  s.version      = "0.0.1"
  s.summary      = "A short description of UTSecurity."
  s.homepage     = "https://github.com/sebarina/UTSecurity"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "sebarina.xl" => "sebarinaxu@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/sebarina/UTSecurity.git", :tag => "0.0.1" }
  s.source_files  = "UTSecurity/*.swift"
  s.preserve_path = 'CommonCrypto/module.modulemap'
  # s.module_map = 'CommonCrypto/module.modulemap'
  # s.pod_target_xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/CommonCrypto' }
  # s.libraries = 'xml2'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2', 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/UTSecurity/CommonCrypto' }
end
