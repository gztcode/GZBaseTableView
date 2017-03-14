

Pod::Spec.new do |s|


  s.name         = "GZBaseTableView"
  s.version      = "0.0.5"
  s.summary      = "一行代码实现创建tableView、方便、快捷"

  s.description  = <<-DESC
                一行代码实现创建tableView、方便、快捷
                   DESC

  s.homepage     = "https://github.com/gzios/GZBaseTableView"

  s.license      = "MIT"

  s.author             = { "郭振涛" => "gzhtios@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/gzios/GZBaseTableView.git", :tag => s.version }

  s.source_files  = "GZBaseTableView/GZBaseTableView/UIViewController+GZAdd.{h,m}"
    s.framework  = "UIKit"
    s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
