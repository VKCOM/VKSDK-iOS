Pod::Spec.new do |s|
  s.name = 'VK-SDK'
  s.version = '0.101.2-alpha.10885179'
  s.summary = 'VK-SDK'
  s.authors = 'VK.com'

  s.homepage = 'https://platform.vk.com/docs/start-page'
  s.license = { :type => 'Copyright (c) 2020 - present, LLC “V Kontakte”', :text => <<-LICENSE
1. Permission is hereby granted to any person obtaining a copy of this Software to
use the Software without charge.

2. Restrictions
You may not modify, merge, publish, distribute, sublicense, and/or sell copies,
create derivative works based upon the Software or any part thereof.

3. Termination
This License is effective until terminated. LLC “V Kontakte” may terminate this
License at any time without any negative consequences to our rights.
You may terminate this License at any time by deleting the Software and all copies
thereof. Upon termination of this license for any reason, you shall continue to be
bound by the provisions of Section 2 above.
Termination will be without prejudice to any rights LLC “V Kontakte” may have as
a result of this agreement.

4. Disclaimer of warranty and liability
THE SOFTWARE IS MADE AVAILABLE ON THE “AS IS” BASIS. LLC “V KONTAKTE” DISCLAIMS
ALL WARRANTIES THAT THE SOFTWARE MAY BE SUITABLE OR UNSUITABLE FOR ANY SPECIFIC
PURPOSES OF USE. LLC “V KONTAKTE” CAN NOT GUARANTEE AND DOES NOT PROMISE ANY
SPECIFIC RESULTS OF USE OF THE SOFTWARE.
UNDER NO SIRCUMSTANCES LLC “V KONTAKTE” BEAR LIABILITY TO THE LICENSEE OR ANY
THIRD PARTIES FOR ANY DAMAGE IN CONNECTION WITH USE OF THE SOFTWARE.
    LICENSE
  }

  s.ios.deployment_target = '11.4'
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.9.0'
  s.default_subspecs = :none

  

  s.vendored_frameworks = 'VKSDK.xcframework'
  s.source = {
    :http => "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.101.2-alpha.10885179/VKSDK.zip",
    :sha256 => "79f6dd11580f278a96fd695362a78deebf5f73acb549b5270c97d80ed6fa79b5"
  }

end
