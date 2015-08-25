#
# Be sure to run `pod lib lint UILifeCycleClosure.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UILifeCycleClosure"
  s.version          = "1.0.0"
  s.summary          = "A short description of UILifeCycleClosure."

  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/ukitaka/UILifeCycleClosure"
  s.license          = 'MIT'
  s.author           = { "ukitaka" => "yuki.takahashi.1126@gmail.com" }
  s.source           = { :git => "https://github.com/ukitaka/UILifeCycleClosure.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'UILifeCycleClosure' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit'
  s.dependency 'ISMethodSwizzling'
  s.dependency 'Aspects'
end
