require_relative 'lib/parse_web_log.rb'
require_relative 'lib/group_webpages_and_visits.rb'
require_relative 'lib/calculate_webpage_visits'
require_relative 'lib/generate_page_views_report.rb'

log_path = ARGV.first
abort 'No argument found! Please pass the full log path as an argument' unless log_path
abort 'File does not exist!' unless File.exist?(log_path)
abort 'Provided file is empty!' if File.zero?(log_path)

parsed_log_lines = ParseWebLog.new(log_path: log_path).call
webpage_visits = GroupWebpagesAndVisits.new(webpages_and_ips: parsed_log_lines).call
visits_per_webpage = CalculateWebpageVisits.new(website_visits: webpage_visits, unique_visits: false).call
GeneratePageViewsReport.new(report_title: 'Total visits per webpage:',
                            webpage_visit_count: visits_per_webpage).call
uniq_visits_per_webpage = CalculateWebpageVisits.new(website_visits: webpage_visits, unique_visits: true).call
GeneratePageViewsReport.new(report_title: 'Total unique visits per webpage:',
                            webpage_visit_count: uniq_visits_per_webpage).call
