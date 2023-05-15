class Scanner
  attr_reader :files

  def initialize
    @files = []
  end

  def test_cli
    puts 'Welcome!'
  end

  # scan homogenous files content and count similar content
  # Output: {file content} {similar files count}
  def scan(dir, ext = 'txt')
    raise ArgumentError.new("#{dir} directory is not exist") unless Dir.exist? dir

    @files = Dir.glob(File.join(File.expand_path(dir), "*.#{ext}"))
    raise ArgumentError.new(".#{ext} file not found") if files.empty?

    count_by_content.each do |content, count|
      puts "#{content.gsub(/\\\\r\\\\n/, "\r\n")} #{count}"
    end
  end

  private

  # TODO: use threaded files reading and temp SQLite database for large file indexing
  def count_by_content
    result = {}
    files.each do |path|
      content = File.read(path).gsub(/\r\n/, "\\r\\n")
      result[content] ||= 0
      result[content] += 1
    end

    result
  end
end

