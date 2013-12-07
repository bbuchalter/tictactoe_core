require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

task :coverage do
  Rake::Task['collect_coverage'].invoke
  `open coverage/index.html`
end

task :lint do
  sh 'rubocop -c config/rubocop.yml'
end

task :collect_coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task['test'].invoke
end

task :build do
  Rake::Task['collect_coverage'].invoke
  Rake::Task['lint'].invoke
end

task :build_history do
  sh 'git rev-list --reverse master | while read rev; do echo -e "\n****\nBUILDING $rev" && git checkout -q $rev && rake; done; git checkout master'
end

task default: :build
