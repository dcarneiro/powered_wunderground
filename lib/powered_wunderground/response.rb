module PoweredWunderground
  class Response
    attr_reader :country, :city, :properties

    def initialize(country, city, properties)
      @country = country
      @city = city
      @properties = properties
    end

    def to_s
      properties[fcttext_field(country)]
    end

    def powered_output
      {
        text: to_s,
        city: city,
        country: country
      }
    end

    alias_method :po, :powered_output

    private

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
