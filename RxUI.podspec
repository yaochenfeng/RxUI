#
# Be sure to run `pod lib lint RxUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxUI'
  s.version          = '0.1.0'
  s.summary          = '基于RxSwift 封装一些组件使用.'
  s.swift_versions = ['5.0']

  s.description      = <<-DESC
  基于RxSwift 封装一些常用组件使用.
                       DESC

  s.homepage         = 'https://github.com/yaochenfeng/RxUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yaochenfeng' => '282696845@qq.com' }
  s.source           = { :git => 'https://github.com/yaochenfeng/RxUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Sources/RxUI/**/*.swift'
  s.dependency 'RxCocoa'
  
end
