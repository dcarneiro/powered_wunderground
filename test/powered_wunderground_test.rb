require 'minitest/autorun'
require 'powered_wunderground'

class PoweredWundergroundTest < Minitest::Test
  def setup
    @api_key = 'my_awesome_key'
    @subject = PoweredWunderground.new(@api_key)
  end

  def test_version
    assert_equal '0.0.1', PoweredWunderground::VERSION
  end

  def test_base_api_url
    assert_equal @subject.base_api_url, "http://api.wunderground.com/api/my_awesome_key/"
  end
end
