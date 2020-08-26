require_relative '../lib/group_webpages_and_visits.rb'
require_relative 'fixtures/web_log_context.rb'

describe GroupWebpagesAndVisits do
  subject { described_class.new(webpages_and_ips: parsed_log_lines).call }

  context 'when webpages and visits are properly grouped in hash' do
    include_context 'parsed_log_lines'
    include_context 'webpage_visits'

    it { is_expected.to eq webpage_visits }
  end
end
