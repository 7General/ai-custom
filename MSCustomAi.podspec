

Pod::Spec.new do |s|
  s.name             = 'MSCustomAi'
  s.version          = '1.0.0'
  s.summary          = 'A collection of Swift utilities including theme management, UI extensions and helpers.'


  s.description      = <<-DESC
  MSCustomAi provides reusable Swift utilities for iOS apps, including
  theme/dark-mode management via SwiftTheme, tappable image views,
  and Dictionary convenience extensions.
                       DESC

  s.homepage         = 'https://github.com/7General'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huizhou.wang' => 'wanghuizhou21@163.com' }
  s.source           = { :git => 'https://github.com/7General/ai-custom.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_versions = ['5.0']

  s.source_files = 'MSCustomAi/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MSCustomAi' => ['MSCustomAi/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SwiftTheme'
end
