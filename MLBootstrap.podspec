Pod::Spec.new do |s|
 s.name = 'MLBootstrap'
 s.version = '1.0.3'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Bootstrap for swift apps'
 s.homepage = 'http://micheltlutz.me'
 s.social_media_url = 'https://twitter.com/michel_lutz'
 s.authors = { "Michel Lutz" => "michel_lutz@icloud.com" }
 s.source = { :git => "https://github.com/micheltlutz/MLBootstrap.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "11.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.resources = "Resources/**/*"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
     ss.framework  = "Foundation"
     ss.framework  = "UIKit"
 end
end
