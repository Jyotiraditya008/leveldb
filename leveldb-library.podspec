Pod::Spec.new do |s|
  s.name         =  'leveldb-library'
  s.version      =  '1.22.6'
  s.license      =  'New BSD'
  s.summary      =  'A fast key-value storage library'
  s.description  =  'LevelDB is a fast key-value storage library written at Google that provides ' +
                    'an ordered mapping from string keys to string values.'
  s.homepage     =  'https://github.com/google/leveldb'
  s.authors      =  'The LevelDB Authors'

  s.cocoapods_version = '>= 1.12.0'

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'
  s.tvos.deployment_target = '11.0'
  s.watchos.deployment_target = '6.0'

  s.source       =  {
    :git => 'https://github.com/Jyotiraditya008/leveldb.git',
    :branch => 'fix-snappy-ios-base'
  }

  s.requires_arc = false

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'LEVELDB_IS_BIG_ENDIAN=0 ' +
                                      'LEVELDB_PLATFORM_POSIX=1 ' +
                                      'HAVE_FULLFSYNC=1',
    'HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}" "${PODS_TARGET_SRCROOT}/port" "${PODS_TARGET_SRCROOT}/include"',
    'WARNING_CFLAGS' => '-Wno-shorten-64-to-32 -Wno-comma -Wno-unreachable-code ' +
                        '-Wno-conditional-uninitialized -Wno-deprecated-declarations',
    'USE_HEADERMAP' => 'No'
  }

  s.header_dir = "leveldb"
  s.source_files = [
    "db/*.{cc,h}",
    "port/*.{cc,h}",
    "table/*.{cc,h}",
    "util/*.{cc,h}",
    "include/leveldb/*.h"
  ]

  s.public_header_files = [
    "include/leveldb/*.h"
  ]

  s.exclude_files = [
    "**/*_test.cc",
    "**/*_bench.cc",
    "db/leveldbutil.cc",
    "util/env_windows.cc",
    "util/testutil.cc"
  ]

  s.library = 'c++'
end
