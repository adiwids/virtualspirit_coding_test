require 'minitest/autorun'

require_relative '../lib/scanner.rb'

class ScannerTest < Minitest::Test
  def setup
    @files_dir = File.join(File.expand_path(File.dirname(__FILE__), '.'), 'files')
    @scanner = Scanner.new
  end

  def test_initialize
    assert @scanner.files.empty?
  end

  def test_cli_output
    assert_output(stdout = /Welcome!/) { @scanner.test_cli }
  end

  def test_scan_given_dir_path
    @scanner.scan @files_dir, 'txt'
    assert @scanner.files.any?
  end

  def test_scan_given_not_exist_path
    assert_raises(ArgumentError) { @scanner.scan './not-exist-dir', 'txt' }
  end

  def test_scan_empty_dir_path
    assert_raises(ArgumentError) { @scanner.scan File.join(@files_dir, 'empty-dir'), 'txt' }
    assert @scanner.files.empty?
  end

  def test_content_scan_output
    assert_output( stdout = /[\w+\\r\\n?]+\s(\d+)(\\r\\n)?/) { @scanner.scan @files_dir, 'txt' }
  end
end
