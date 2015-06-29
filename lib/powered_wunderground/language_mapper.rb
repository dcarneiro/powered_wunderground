module PoweredWunderground
  module LanguageMapper
    def fetch_language(code)
      language_map[code.upcase] || code.upcase
    end

    # The weather underground language codes are here:
    #   http://www.wunderground.com/weather/api/d/docs?d=language-support&MR=1
    def language_map
      {
        'ES' => 'SP',
        'PT' => 'BR', # this makes me sad
      }
    end
  end
end
