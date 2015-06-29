module PoweredWunderground
  class WeatherDecorator
    attr_reader :language_code, :text

    def initialize(language_code, text)
      @language_code = language_code
      @text = text
    end

    def decorate
      tokens = text.split('.')
      decorate_temperature_part(tokens)
      decorate_wind_part(tokens)
      "#{tokens.join('.')}."
    end

    def decorate_temperature_part(tokens)
      temperature_token_index = temperature_token_position(tokens)
      return if temperature_token_index.nil?
      tokens[temperature_token_index].sub!(/ (\d+)F$/, ' \1ºF')
    end

    def decorate_wind_part(tokens)
      wind_token_index = wind_token_position(tokens)
      return if wind_token_index.nil?
      wind_replacements.each do |replacement|
        tokens[wind_token_index].gsub!(" #{replacement[0]} ", " #{replacement[1]} ")
      end
      tokens[wind_token_index] = wind_pronoum_handling tokens[wind_token_index]
    end

    def temperature_token_position(tokens)
      tokens.index { |t| t.match /\s\d+(C|F)$/ }
    end

    def wind_token_position(tokens)
      tokens.index { |t| t.match wind_replacements['word'] }
    end

    def wind_replacements
      replacements_yaml['winds']
    end

    def replacements_yaml
      @yaml ||= YAML.load_file(replacement_file)
    end

    def wind_pronoum_handling(text)
      case language_code
      # replace: a 10 a 15 => de 10 a 15
      when 'pt' then text.gsub(/\s(a)(\s\d+\sa\s\d+)/, ' de\2')
      else text
      end
    end

    def replacement_file
      file = File.join __dir__, 'replacements', "#{language_code}.yml"
      fail "file not found #{file}" unless File.exist? file
      file
    end
  end
end
