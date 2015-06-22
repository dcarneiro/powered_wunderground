module PoweredWunderground
  module LanguageMapper
    def fetch(language)
      map[language.upcase] || language.upcase
    end

    def map
      {
        'PT' => 'BR', # this makes me sad
      }
    end
  end
end