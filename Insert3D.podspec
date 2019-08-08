#
# Be sure to run `pod lib lint Insert3D.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Insert3D'
  s.version          = '1.0.0'
  s.summary          = 'The fastest way to embed a 3D model in Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Viktoo/Insert3D'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'GPL', :file => 'LICENSE' }
  s.author           = { 'Viktor Makarskyy' => 'viktor@makarskyy.com' }
  s.source           = { :git => 'https://github.com/Viktoo/Insert3D.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/makarskyy'

  s.ios.deployment_target = '12.0'

  s.source_files = 'Insert3D/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Insert3D' => ['Insert3D/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
