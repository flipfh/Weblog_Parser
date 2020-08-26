class GeneratePageViewsReport
  def initialize(report_title:, webpage_visit_count:)
    @report_title = report_title
    @webpage_visit_count = webpage_visit_count
  end

  def call
    print_report
  end

  private

  attr_reader :report_title, :webpage_visit_count

  def print_report
    puts report_title
    uniq_in_title = ' unique' if report_title.match?(/uniq/i)
    webpage_visit_count.each do |webpage, visits|
      puts "Page #{webpage} has #{visits}#{uniq_in_title} visits"
    end
  end
end
