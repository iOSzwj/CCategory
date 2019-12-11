
#

Pod::Spec.new do |spec|
  
  spec.name         = "CCategory"
  spec.version      = "0.2.1"
  spec.summary      = "中国共产党万岁"
  
  spec.description  = <<-DESC
  中国共产党始终代表中国先进生产力的发展要求
  中国共产党始终代表中国先进文化的前进方向
  中国共产党始终代表中国最广大人民的根本利益
  DESC
  
  spec.homepage     = "https://github.com/iOSzwj/CCategory"
  spec.license      = "MIT"
  spec.author             = { "hare27" => "hare27@foxmail.com" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/iOSzwj/CCategory.git", :tag => "#{spec.version}" }
  spec.source_files  = "Code", "ACode/*.h"
  spec.requires_arc = true
  spec.frameworks = 'UIKit', 'Foundation'
  spec.static_framework = true
  spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  
  spec.subspec 'Third' do |third|
    third.subspec 'MBProgressHUD' do |mb|
      mb.source_files = 'ACode/Third/MBProgressHUD/*.{h,m}'
    end
    third.subspec 'RealReachability' do |rr|
      rr.source_files = 'ACode/Third/RealReachability/**/*.{h,m}'
    end
    third.subspec 'WebViewJavascriptBridge' do |wj|
        wj.source_files = 'ACode/Third/WebViewJavascriptBridge/**/*.{h,m}'
    end
    third.subspec 'AFNetworking' do |afn|
        afn.source_files = 'ACode/Third/AFNetworking/**/*.{h,m}'
    end
  end
  
  spec.subspec 'Foundation' do |fou|
    fou.source_files = 'ACode/Foundation/*.{h,m}'
    fou.dependency 'CCategory/Third'
  end

  spec.subspec 'UIKit' do |uik|
    uik.source_files = 'ACode/UIKit/*.{h,m}'
  end

  spec.subspec 'WebKit' do |web|
    web.source_files = 'ACode/WebKit/*.{h,m}'
  end

  spec.subspec 'Api' do |api|
    api.source_files = 'ACode/Api/*.{h,m}'
    api.dependency 'CCategory/Third'
    api.dependency 'CCategory/UIKit'
  end
end
