require_relative '../lib/calculate_webpage_visits.rb'
require_relative 'fixtures/web_log_context.rb'

describe CalculateWebpageVisits do
  subject do
    described_class.new(website_visits: webpage_visits,
                        unique_visits: is_uniq?).call
  end

  include_context 'webpage_visits'

  context 'when all visits are calculated' do
    include_context 'visits_per_webpage'
    let(:is_uniq?) { false }

    it { is_expected.to eq visits_per_webpage }
  end

  context 'when only unique visits are calculated' do
    include_context 'uniq_visits_per_webpage'
    let(:is_uniq?) { true }

    it { is_expected.to eq uniq_visits_per_webpage }
  end
end
