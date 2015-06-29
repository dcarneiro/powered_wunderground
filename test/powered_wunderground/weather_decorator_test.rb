require File.expand_path('../../test_helper', __FILE__)

module PoweredWunderground
  describe WeatherDecorator do
    describe '#decorate' do
      describe 'portuguese strings' do
        it 'should convert to a friendly output' do
          input = "Essencialmente limpo. Máxima de 29°C. Ventos ONO a 10 a 15 km/h."
          expected = "Essencialmente limpo. Máxima de 29°C. Ventos Oeste/Noroeste de 10 a 15 km/h."

          subject = WeatherDecorator.new('pt', input)
          assert_equal subject.decorate, expected
        end
      end
    end
  end
end
