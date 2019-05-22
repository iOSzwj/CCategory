
#

Pod::Spec.new do |spec|

spec.name         = "CCategory"
spec.version      = "1.0.9"
spec.summary      = "中国共产党万岁"

spec.description  = <<-DESC
中国共产党始终代表中国先进生产力的发展要求
中国共产党始终代表中国先进文化的前进方向
中国共产党始终代表中国最广大人民的根本利益
DESC

spec.homepage     = "https://gitee.com/ioszwj/ZPCategory"
spec.license      = "MIT"
spec.author             = { "hare27" => "hare27@foxmail.com" }
spec.platform     = :ios, "9.0"
spec.source       = { :git => "git@gitee.com:ioszwj/ZPCategory.git", :tag => "#{spec.version}" }
spec.source_files  = "Code", "ACode/*.h"
spec.requires_arc = true
spec.frameworks = 'UIKit', 'Foundation'
spec.static_framework = true
spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }


spec.subspec 'Third' do |thi|
thi.source_files = 'ACode/Third/**/*.{h,m}'
end

spec.subspec 'Foundation' do |fou|
fou.source_files = 'ACode/Foundation/*.{h,m}'
fou.dependency 'ZPCategory/Third'
end

spec.subspec 'UIKit' do |uik|
uik.source_files = 'ACode/UIKit/*.{h,m}'
end

spec.subspec 'WebKit' do |web|
web.source_files = 'ACode/WebKit/*.{h,m}'
end

spec.subspec 'ZPTool' do |tool|
tool.source_files = 'ACode/ZPTool/*.{h,m}'
tool.dependency 'AFNetworking'
tool.dependency 'ZPCategory/Third'
tool.dependency 'ZPCategory/UIKit'

end
end
