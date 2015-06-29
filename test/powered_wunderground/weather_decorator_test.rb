require File.expand_path('../../test_helper', __FILE__)

module PoweredWunderground
  describe WeatherDecorator do
    describe '#decorate' do
      describe 'english strings' do
        it 'should convert E to East' do
          input = 'Thunderstorms, accompanied by locally heavy rainfall at times. High 73F. Winds E at 5 to 10 mph. Chance of rain 80%.'
          expected = 'Thunderstorms, accompanied by locally heavy rainfall at times. High 73ºF. Winds East at 5 to 10 mph. Chance of rain 80%.'

          subject = WeatherDecorator.new('en', input)
          assert_equal subject.decorate, expected
        end

        it 'should convert ENE to East-northeast' do
          input = 'Thunderstorms with locally heavy downpours. High 73F. Winds ENE at 5 to 10 mph. Chance of rain 90%.'
          expected = 'Thunderstorms with locally heavy downpours. High 73ºF. Winds East-northeast at 5 to 10 mph. Chance of rain 90%.'

          subject = WeatherDecorator.new('en', input)
          assert_equal subject.decorate, expected
        end
      end

      describe 'portuguese strings' do
        it 'should convert to a friendly output' do
          input = 'Essencialmente limpo. Máxima de 29°C. Ventos ONO a 10 a 15 km/h.'
          expected = 'Essencialmente limpo. Máxima de 29°C. Ventos Oeste/Noroeste de 10 a 15 km/h.'

          subject = WeatherDecorator.new('pt', input)
          assert_equal subject.decorate, expected
        end

        it 'should support strings with ' do
          input = 'Trovoadas. Máxima de 23°C. Ventos E a 10 a 15 km/h. Possib. de chuva 80%.'
          expected = 'Trovoadas. Máxima de 23°C. Ventos Este de 10 a 15 km/h. Possib. de chuva 80%.'

          subject = WeatherDecorator.new('pt', input)
          assert_equal subject.decorate, expected
        end
      end
    end
  end
end
