require 'beaker-rspec'
require 'beaker-puppet'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    install_module
    install_module_dependencies

    # Install additional modules for soft deps
    install_module_from_forge('puppetlabs-java', '>= 2.1.0 < 5.0.0')
    install_module_from_forge('puppetlabs-apt', '>= 4.1.0 < 8.0.0')
  end
end
