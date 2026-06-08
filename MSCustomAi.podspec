

Pod::Spec.new do |s|
  s.name             = 'MSCustomAi'
  s.version          = '1.0.0'
  s.summary          = 'A short description of MSCustomAi.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/huizhou.wang/MSCustomAi'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huizhou.wang' => 'wanghuizhou21@163.com' }
  s.source           = { :git => 'https://github.com/huizhou.wang/MSCustomAi.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'MSCustomAi/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MSCustomAi' => ['MSCustomAi/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SwiftTheme'
end
