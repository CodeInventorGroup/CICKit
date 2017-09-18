# Copyright 2015-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.

apple_asset_catalog(
  name = 'Assets.xcassets',
  dirs = [
    'CIComponentKitDemo/Supporting Files/Assets.xcassets',
  ],
  app_icon = 'AppIcon',
)
apple_bundle(
  name = 'CIKitDemoBundle',
  binary = ':CIKitDemoBinary',
  extension = 'app',
  info_plist = 'CIComponentKitDemo/Supporting Files/Info.plist',
)

apple_binary(
  name = 'CIKitDemoBinary',
  deps = [':Assets.xcassets'],
  preprocessor_flags = ['-fobjc-arc', '-Wno-objc-designated-initializers'],
  headers = glob([
    'CIComponentKitDemo/*.h',
  ]),
  srcs = glob([
    'CIComponentKitDemo/*.m',
    'CIComponentKitDemo/Supporting Files/main.m'
  ]),
  frameworks = [
    '$SDKROOT/System/Library/Frameworks/UIKit.framework',
    '$SDKROOT/System/Library/Frameworks/Foundation.framework',
  ],
)

apple_package(
  name = 'CIKitDemoPackage',
  bundle = ':CIKitDemoBundle',
)

