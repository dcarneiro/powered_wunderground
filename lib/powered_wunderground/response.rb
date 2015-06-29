module PoweredWunderground
  class Response
    attr_reader :country, :city, :language_code, :properties

    def initialize(country, city, language_code, properties)
      @country = country
      @city = city
      @language_code = language_code
      @properties = properties
    end

    def to_s
      properties[fcttext_field(country)]
    end

    def powered_output
      {
        country: country,
        city: city,
        language_code: language_code,
        original_text: to_s,
        decorated_text: decorated_text
      }
    end

    alias_method :po, :powered_output

    private

    def decorated_text
      WeatherDecorator.new(language_code, to_s).decorate
    end

    def fcttext_field(country)
      if imperial_system.include? country
        'fcttext'
      else
        'fcttext_metric'
      end
    end

    def imperial_system
      %w(US)
    end
  end
end
