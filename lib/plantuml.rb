require 'plantuml/version'
require 'pathname'
require 'tempfile'
require 'open3'

module PlantUML
  class << self
    def root
      Pathname.new(__dir__).join('..')
    end

    def java
      @java ||= Pathname.new(`which java`.chomp)
    end

    def jar
      @jar ||= root.join('vendor/plantuml/plantuml.8050.jar')
    end

    def run(script)
      cmdline = [java, '-jar', jar, '-p'].join(' ')
      Open3.popen3(cmdline) do |stdin, stdout, stderr|
        stdin.puts(script)
        stdin.close

        Tempfile.open do |t|
          t.puts(stdout.read)
          t
        end
      end
    end
  end
end
