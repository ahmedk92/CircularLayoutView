#
# Be sure to run `pod lib lint CircularLayoutView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CircularLayoutView'
  s.version          = '0.3.0'
  s.summary          = 'A container view to layout subviews in a circular fashion.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A container view to layout subviews in a circular fashion..
                       DESC

  s.homepage         = 'https://github.com/ahmedk92/CircularLayoutView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ahmedk92' => 'ahmedkhalaf.92@gmail.com' }
  s.source           = { :git => 'https://github.com/ahmedk92/CircularLayoutView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ahmedkhalaf_92'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'

  s.source_files = 'CircularLayoutView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CircularLayoutView' => ['CircularLayoutView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
