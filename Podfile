# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://cdn.cocoapods.org'
source 'https://github.com/Kalanhall/Specs.git'
inhibit_all_warnings!
target 'Project' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Project
  pod 'MLeaksFinder'
  # 开发阶段指向源码库，发布版本直接指向私有库
  pod 'LoginService', :git=>'https://github.com/Kalanhall/LoginService.git'
  pod 'LoginServiceInterface', :git=>'https://github.com/Kalanhall/LoginServiceInterface.git'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '5.0'
        end
    end
end
