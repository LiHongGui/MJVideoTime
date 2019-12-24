Pod::Spec.new do |s|


  s.name         = "MJVideoTime"
  s.version      = "1.0.1"
  s.summary      = "MJVideoTime,MJVideoTime"

  s.description  = <<-DESC
                            MJVideoTime---MJVideoTime
                   DESC

  s.homepage     = "https://github.com/LiHongGui/MJVideoTime.git"
 
  s.license      = { :type => "MIT", :file => "License" }


  s.author             = { "MichaelLi" => "1045359337@qq.com" }
 
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/LiHongGui/MJVideoTime.git", :tag => "#{s.version}" }

  s.source_files  = "MJVideoTime", "MJVideoTime.{h,m,xib}"

  s.requires_arc = true

end
