# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Kalanhall/Specs.git'
inhibit_all_warnings!
target 'Project' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Project
  pod 'KLLeaks'
  pod 'KLConsole'

  pod 'LoginService', :path=>'/Users/kalan/Desktop/Swift/LoginService'
  pod 'LoginServiceInterface', :path=>'/Users/kalan/Desktop/Swift/LoginServiceInterface'
  
  pod 'HomeService', :path=>'/Users/kalan/Desktop/Swift/HomeService'
  pod 'HomeServiceInterface', :path=>'/Users/kalan/Desktop/Swift/HomeServiceInterface'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '5.0'
        end
    end
end
