require File.expand_path('../test_helper', __FILE__)
require 'powered_wunderground'

class PoweredWundergroundTest < Minitest::Test
  def setup
    @api_key = 'my_awesome_key'
  end

  def test_initialize_by_string
    conn = PoweredWunderground.new(@api_key)
    assert conn.class, PoweredWunderground::Connection
    assert conn.language, 'EN'
  end

  def test_initialize_by_hash
    conn = PoweredWunderground.new(api_key: @api_key, language: 'es')
    assert conn.class, PoweredWunderground::Connection
    assert conn.language, 'ES'
  end
end
