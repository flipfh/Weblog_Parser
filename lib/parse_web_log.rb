class ParseWebLog
  def initialize(log_path:)
    @log_path = log_path
  end

  def call
    read_each_line
    remove_empty_lines
    split_webpage_and_ip
    remove_lines_with_invalid_ips
  end

  private

  attr_reader :log_path, :webpages_and_ips
  attr_accessor :weblog_lines

  def read_each_line
    @weblog_lines = File.readlines(log_path)
  end

  def remove_empty_lines
    weblog_lines.reject! { |line| line == "\n" }
  end

  def split_webpage_and_ip
    @webpages_and_ips = weblog_lines.each.map { |line| line.split(' ') }
  end

  def remove_lines_with_invalid_ips
    webpages_and_ips.select { |_page, ip| ip.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/) }
  end
end
