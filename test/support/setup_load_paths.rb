require 'pathname'

base_dir = Pathname.new(File.expand_path(__FILE__)).dirname.parent.parent
lib_dir = base_dir + 'lib'
$LOAD_PATH.unshift(lib_dir.to_s)
