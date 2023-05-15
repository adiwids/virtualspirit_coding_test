require 'minitest/autorun'

require_relative '../lib/scanner.rb'

class ScannerTest < Minitest::Test
  def setup
    @files_dir = File.join(File.expand_path(File.dirname(__FILE__), '.'), 'files')
    @scanner = Scanner.new
  end

  def test_cli_output
    assert_output(stdout = /Welcome!/) { @scanner.test_cli }
  end
end
