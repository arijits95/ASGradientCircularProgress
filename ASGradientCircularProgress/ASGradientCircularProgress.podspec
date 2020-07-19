Pod::Spec.new do |spec|

  spec.name         = "ASGradientCircularProgress"
  spec.version      = "0.0.1"
  spec.summary      = "This is a simple circular progress view, where the progress is shown using a gradient rather than a single colour."

  spec.description  = <<-DESC
  ASGradientCircularProgress is a lightweight circular progress view with gradient. The progress view is animatable to any progress point within 100 i.e, from 0 to 100 percent. The circular progress view can also be used as a download progress for a download task.
                   DESC

  spec.homepage     = "https://github.com/arijits95/ASGradientCircularProgress"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Arijit" => "arijits95@gmail.com" }

  spec.ios.deployment_target = "11.0"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/arijits95/ASGradientCircularProgress.git", :tag => "#{spec.version}" }
  spec.source_files  = "ASGradientCircularProgress/Source/*.{swift}"

end
