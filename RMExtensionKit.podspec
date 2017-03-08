#
# Be sure to run `pod lib lint RMExtensionKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RMExtensionKit'
  s.version          = '1.2.0'
  s.summary          = 'Extension methods which simplifies the use of Cocoa classes iOS / OSX.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The RMExtensionKit is simple framework that contains any extension methods which simplifies the use of Cocoa classes iOS / OSX.
                       DESC

  s.homepage         = 'https://github.com/rondinellimorais/RMExtensionKit.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rondinelli Morais' => 'rondinellimorais@gmail.com' }
  s.source           = { :git => 'https://github.com/rondinellimorais/RMExtensionKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/rondmorais'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RMExtensionKit/Classes/**/*'

  # s.resource_bundles = {
  #   'RMExtensionKit' => ['RMExtensionKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
