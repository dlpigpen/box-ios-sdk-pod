#
#  Be sure to run `pod spec lint box-ios-sdk-pod.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "box-ios-sdk-pod"
  spec.version      = "0.0.3"
  spec.summary      = "A other version of box ios sdk pod. Helper-Framework that save your time to work with cloud storage services"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
  A other version of box ios sdk pod. Helper-Framework that save your time to work with cloud storage services
                   DESC

  spec.homepage     = "http://hamado-ltd.com"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "Lovely Girl" => "ducnguyen571989@gmail.com" }
  # Or just: spec.author    = "Lovely Girl"
  # spec.authors            = { "Lovely Girl" => "ducnguyen571989@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/Lovely Girl"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
  spec.platform     = :ios, "7.0"

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/dlpigpen/box-ios-sdk-pod.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = "BoxContentSDK/BoxContentSDK/*.{h,m}", "BoxContentSDK/BoxContentSDK/**/*.{h,m}"
  #mspec.exclude_files = "BoxContentSDK/BoxContentSDK/External/ISO8601DateFormatter/BOXISO8601DateFormatter.{h,m}", "BoxContentSDK/BoxContentSDK/External/KeychainItemWrapper/BOXKeychainItemWrapper.{h,m}"

  spec.public_header_files = "BoxContentSDK/BoxContentSDK/*.h", "BoxContentSDK/BoxContentSDK/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  #spec.framework  = "UIKit"
  spec.frameworks = "Security", "QuartzCore", "AssetsLibrary"
  spec.header_dir = 'BoxContentSDK'

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"
  spec.static_framework = true
  spec.resource_bundles = {
    'BoxContentSDKResources' =>  [
      "BoxContentSDK/BoxContentSDKResources/Assets/*.*",
      "BoxContentSDK/BoxContentSDKResources/Icons/*.*",
      "BoxContentSDK/BoxContentSDKResources/*.lproj"
    ]
  }

  spec.xcconfig = { "OTHER_LDFLAGS": "-ObjC -all_load" }
  spec.module_name =  "BoxContentSDK"


  #spec.requires_arc = true

  spec.subspec 'logger' do |logger|
    logger.source_files = "BoxContentSDK/BoxContentSDK/BOXLog.h"
  end

  spec.subspec 'no-arc' do |noarc|
      noarc.requires_arc = false
      noarc.dependencies = { "box-ios-sdk-pod/logger": []}
      noarc.source_files = "BoxContentSDK/BoxContentSDK/External/KeychainItemWrapper/BOXKeychainItemWrapper.{h,m}", "BoxContentSDK/BoxContentSDK/External/ISO8601DateFormatter/BOXISO8601DateFormatter.{h,m}"
  end
  
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
