#
#  Be sure to run `pod spec lint VSAlert.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "VSAlert"
  spec.version      = "0.0.1"
  spec.summary      = "This library shows alert with different features."

  spec.description  = <<-DESC
  This cocoapods library shows alert. It helps you to show Simple alert with customisable Action buttons. You can also use it to show loading with Title and description.
                   DESC

  spec.homepage     = "https://github.com/vatsal1992/VSALert"

  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "vatsal1992" => "shuklavatsal1992@gmail.com" }

  
  spec.ios.deployment_target = "13.0"

  spec.swift_version = "4.2"

  spec.source       = { :git => "https://github.com/vatsal1992/VSALert.git", :tag => "#{spec.version}" }

  spec.source_files  = "VSAlert", "VSAlert/**/*.{h,m,swift}"

end
