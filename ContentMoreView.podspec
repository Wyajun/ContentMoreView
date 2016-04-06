#ContentMoreView.podspec
Pod::Spec.new do |s|
  s.name         = "ContentMoreView"
  s.version      = "1.0.0"
  s.summary      = "tab标签view"

  s.homepage     = "https://github.com/Wyajun/ContentMoreView"
  s.license      = { :type => 'BSD' }
  s.author       = { "YaJun Wang" => "yajunst@163.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/Wyajun/ContentMoreView.git", :tag => s.version}
  s.source_files  = '滚动视图/ScrollView/*.{h,m}'
  s.requires_arc = true
end