require 'plantuml/version'
require 'pathname'

unless defined? JRUBY_VERSION
  raise 'JRuby is required.'
end

module JavaPlantUML
  JAR = Pathname.new(__dir__).join('..').join('vendor/plantuml/plantuml.8050.jar')
  PACKAGE = 'net.sourceforge.plantuml'

  require JAR
  include_package PACKAGE
end

module JavaIO
  PACKAGE = 'java.io'
  include_package PACKAGE
end

module PlantUML
  class Error < StandardError
  end

  class << self
    def run(script)
      file = JavaIO::File.createTempFile('plantuml', '.png')

      raise Error unless JavaPlantUML::SourceStringReader.new(script).generateImage(file)

      file
    end
  end
end
