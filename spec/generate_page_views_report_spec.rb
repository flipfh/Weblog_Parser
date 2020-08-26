require_relative '../lib/generate_page_views_report.rb'
require_relative 'fixtures/web_log_context.rb'

describe GeneratePageViewsReport do
  context 'when all visits are presented' do
    include_context 'visits_per_webpage'
    let(:generate_page_views_report) do
      described_class.new(report_title: title,
                          webpage_visit_count: visits_per_webpage).call
    end
    let(:title) { 'Total visits per webpage:' }
    let(:expected_output) do
      "Total visits per webpage:\n" \
      "Page /index has 3 visits\n" \
      "Page /about has 2 visits\n"
    end

    it 'expects output' do
      expect { generate_page_views_report }.to output(expected_output).to_stdout
    end
  end

  context 'when only unique visits are presented' do
    include_context 'uniq_visits_per_webpage'
    let(:generate_page_views_report) do
      described_class.new(report_title: title,
                          webpage_visit_count: uniq_visits_per_webpage).call
    end
    let(:title) { 'Total unique visits per webpage:' }
    let(:expected_output) do
      "Total unique visits per webpage:\n" \
      "Page /index has 2 unique visits\n" \
      "Page /about has 1 unique visits\n"
    end

    it 'expects output' do
      expect { generate_page_views_report }.to output(expected_output).to_stdout
    end
  end
end
