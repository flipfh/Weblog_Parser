require_relative '../lib/parse_web_log.rb'
require_relative 'fixtures/web_log_context.rb'

describe ParseWebLog do
  subject { described_class.new(log_path: log_path).call }

  include_context 'parsed_log_lines'

  shared_examples 'parses log correctly' do
    it { is_expected.to eq parsed_log_lines }
  end

  context 'when weblog has correct IPs and no empty lines' do
    let(:log_path) { 'spec/fixtures/spec_webserver.log' }

    it_behaves_like 'parses log correctly'
  end

  context 'when weblog has empty lines' do
    let(:log_path) { 'spec/fixtures/spec_webserver_empty_lines.log' }

    it_behaves_like 'parses log correctly'
  end

  context 'when weblog has incorerct IPs' do
    let(:log_path) { 'spec/fixtures/spec_webserver_incorrect_ips.log' }

    it_behaves_like 'parses log correctly'
  end
end
