module PoweredWunderground
  module LanguageMapper
    def fetch_language(code)
      language_map[code.upcase] || code.upcase
    end

    def language_map
      {
        'PT' => 'BR', # this makes me sad
      }
    end
  end
end