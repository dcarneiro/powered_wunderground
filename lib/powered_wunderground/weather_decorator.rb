module PoweredWunderground
  class WeatherDecorator
    attr_reader :language_code, :text

    def initialize(language_code, text)
      @language_code = language_code
      @text = text
    end

    def decorate
      tokens = text.split(".")
      replacements.each do |replacement|
        tokens[-1].gsub!(" #{replacement[0]} ", " #{replacement[1]} ")
      end
      tokens[-1] = wind_pronoum_handling tokens[-1]
      "#{tokens.join('.')}."
    end

    def replacements
      YAML::load_file(replacement_file)['winds']
    end

    def wind_pronoum_handling(text)
      case language_code
      # replace: a 10 a 15 => de 10 a 15
      when 'pt' then text.gsub(/\s(a)(\s\d+\sa\s\d+)/, ' de\2')
      else text
      end
    end

    def replacement_file
      file = File.join 'lib', 'powered_wunderground', 'replacements', "#{language_code}.yml"
      fail "file not found" unless File.exists? file
      file
    end
  end
end
