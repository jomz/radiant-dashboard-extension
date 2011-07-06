# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-dashboard-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-dashboard-extension"
  s.version     = RadiantDashboardExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantDashboardExtension::AUTHORS
  s.email       = RadiantDashboardExtension::EMAIL
  s.homepage    = RadiantDashboardExtension::URL
  s.summary     = RadiantDashboardExtension::SUMMARY
  s.description = RadiantDashboardExtension::DESCRIPTION

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]

  s.post_install_message = %{
  Add this to your radiant project with:

    config.gem 'radiant-dashboard-extension', :version => '~> #{RadiantDashboardExtension::VERSION}'

  }
end
