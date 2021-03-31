#import "IosSharePlugin.h"
#if __has_include(<ios_share/ios_share-Swift.h>)
#import <ios_share/ios_share-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ios_share-Swift.h"
#endif

@implementation IosSharePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIosSharePlugin registerWithRegistrar:registrar];
}
@end
