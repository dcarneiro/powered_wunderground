require File.expand_path('../../test_helper', __FILE__)

module PoweredWunderground
  describe Response do
    def setup
      params = {
        'period'          => 0,
        'icon'            => 'partlycloudy',
        'icon_url'        => 'http://icons.wxug.com/i/c/k/partlycloudy.gif',
        'title'           => 'Terça-feira',
        'fcttext'         => 'Máxima de 68°F. Ventos O a 10 a 20 mph.',
        'fcttext_metric'  => 'Máxima de 20°C. Ventos O a 15 a 30 km/h.',
        'pop'             => '0'
      }
      @response = Response.new('PT', 'Porto', 'pt', params)
    end

    def test_to_s
      assert_equal 'Máxima de 20°C. Ventos O a 15 a 30 km/h.', @response.to_s
    end

    def test_powered_output
      expected = {
        original_text: 'Máxima de 20°C. Ventos O a 15 a 30 km/h.',
        decorated_text: 'Máxima de 20°C. Ventos Oeste de 15 a 30 km/h.',
        city: 'Porto',
        country: 'PT',
        language_code: 'pt'
      }

      assert_equal expected, @response.po
    end
  end
end
