#
# Be sure to run `pod lib lint PleaseHold.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PleaseHold'
  s.version          = '0.2.0'
  s.summary          = 'Quick and easy progress UIView to place in your app.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
In the moments when you need to show a blocking progress UIView in your app, PleaseHold is a quick way to put one in your app. Configured with default settings that will work for most use cases, but customizable enough to cover more. Do us all a favor, and avoid blocking views 😉. 
                       DESC

  s.homepage         = 'https://github.com/levibostian/PleaseHold-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Levi Bostian' => 'levi.bostian@gmail.com' }
  s.source           = { :git => 'https://github.com/levibostian/PleaseHold-iOS.git', :tag => s.version.to_s }  

  s.ios.deployment_target = '10.0'
  s.swift_version = "5.0"

  s.source_files = 'PleaseHold/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PleaseHold' => ['PleaseHold/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
