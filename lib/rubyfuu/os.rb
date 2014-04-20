require 'rbconfig'

module Rubyfuu
  class OS
    def self.host_os
      RbConfig::CONFIG['host_os']
    end

    def self.osx?
      host_os =~ /darwin/
    end

    def self.linux?
      host_os =~ /linux/
    end
  end
end
