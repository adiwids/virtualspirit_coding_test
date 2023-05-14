require 'minitest/autorun'

require_relative '../lib/scanner.rb'

class ScannerTest < Minitest::Test
  def setup
    @scanner = Scanner.new
  end

  def test_cli_output
    assert_output(stdout = /Welcome!/) { @scanner.cli_output }
  end
end
