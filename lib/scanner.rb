class Scanner
  attr_reader :files

  def initialize
    @files = []
  end

  def test_cli
    puts 'Welcome!'
  end

  def scan(dir, ext = 'txt')
    raise ArgumentError.new("#{dir} directory is not exist") unless Dir.exist? dir

    @files = Dir.glob(File.join(File.expand_path(dir), "*.#{ext}"))
    raise ArgumentError.new(".#{ext} file not found") if files.empty?
  end
end

