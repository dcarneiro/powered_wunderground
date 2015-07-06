require File.expand_path('../../test_helper', __FILE__)

module PoweredWunderground
  describe WeatherDecorator do
    describe '#decorate' do
      describe 'english strings' do
        it 'should convert E to East' do
          input = 'Thunderstorms, accompanied by locally heavy rainfall at times. High 73F. Winds E at 5 to 10 mph. Chance of rain 80%.'
          expected = "Thunderstorms, accompanied by locally heavy rainfall at times. High 73\xC2\xB0F. Winds East at 5 to 10 mph. Chance of rain 80%."

          subject = WeatherDecorator.new('en', input)
          assert_equal expected, subject.decorate
        end

        it 'should convert ENE to East-northeast' do
          input = 'Thunderstorms with locally heavy downpours. High 73F. Winds ENE at 5 to 10 mph. Chance of rain 90%.'
          expected = "Thunderstorms with locally heavy downpours. High 73\xC2\xB0F. Winds East-northeast at 5 to 10 mph. Chance of rain 90%."

          subject = WeatherDecorator.new('en', input)
          assert_equal expected, subject.decorate
        end

        it 'should convert 93F to 93°F' do
          input = 'Mostly cloudy early, then sunshine for the afternoon. High 93F. Winds NNW at 10 to 15 mph.'
          expected = "Mostly cloudy early, then sunshine for the afternoon. High 93\xC2\xB0F. Winds North-northwest at 10 to 15 mph."

          subject = WeatherDecorator.new('en', input)
          assert_equal expected, subject.decorate
        end

        it 'should also convert degrees in metric units (15C to 15ªC)' do
          input = 'Clear. Low 15C.'
          expected = "Clear. Low 15\xC2\xB0C."

          subject = WeatherDecorator.new('en', input)
          assert_equal expected, subject.decorate
        end
      end

      describe 'portuguese strings' do
        it 'should convert to a friendly expected' do
          input = 'Essencialmente limpo. Máxima de 29°C. Ventos ONO a 10 a 15 km/h.'
          expected = "Essencialmente limpo. Máxima de 29\xC2\xB0C. Ventos Oeste/Noroeste de 10 a 15 km/h."

          subject = WeatherDecorator.new('pt', input)
          assert_equal expected, subject.decorate
        end

        it 'should support strings with ' do
          input = 'Trovoadas. Máxima de 23°C. Ventos E a 10 a 15 km/h. Possib. de chuva 80%.'
          expected = "Trovoadas. Máxima de 23\xC2\xB0C. Ventos Este de 10 a 15 km/h. Possib. de chuva 80%."

          subject = WeatherDecorator.new('pt', input)
          assert_equal expected, subject.decorate
        end
      end
    end
  end
end
