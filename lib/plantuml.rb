require 'plantuml/version'
require 'pathname'
require 'tempfile'
require 'open3'

module PlantUML
  class Error < StandardError
  end

  class << self
    def root
      Pathname.new(__dir__).join('..')
    end

    def java_cmd
      @java ||= Pathname.new(`which java`.chomp)
    end

    def jar
      @jar ||= root.join('vendor/plantuml/plantuml.8050.jar')
    end

    def run(script)
      if defined? JRUBY_VERSION

        java.lang.System.out.println('Hello JRuby')

        return
      end

      cmd = [java_cmd, '-Djava.awt.headless=true', '-jar', jar, '-p'].join(' ')

      Open3.popen3(cmd) do |i, o, e, w|
        i.puts(script)
        i.close

        err = e.read
        raise Error, err unless w.value.success? && err.empty?

        file = Tempfile.open { |t| t.puts(o.read); t }
        file.close
        file
      end
    end
  end
end
