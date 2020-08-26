describe 'Parser' do
  let(:expected_script_output) do
    "Total visits per webpage:\n" \
    "Page /index has 3 visits\n" \
    "Page /about has 2 visits\n" \
    "Total unique visits per webpage:\n" \
    "Page /index has 2 unique visits\n" \
    "Page /about has 1 unique visits\n"
  end

  shared_examples 'parse.rb script executes correctly' do
    it { expect { system(command) }.to output(expected_script_output).to_stdout_from_any_process }
  end

  context 'when weblog has correct IPs and no empty lines' do
    let(:command) { 'ruby parser.rb spec/fixtures/spec_webserver.log' }

    it_behaves_like 'parse.rb script executes correctly'
  end

  context 'when weblog has empty lines' do
    let(:command) { 'ruby parser.rb spec/fixtures/spec_webserver_empty_lines.log' }

    it_behaves_like 'parse.rb script executes correctly'
  end

  context 'when weblog has incorerct IPs' do
    let(:command) { 'ruby parser.rb spec/fixtures/spec_webserver_incorrect_ips.log' }

    it_behaves_like 'parse.rb script executes correctly'
  end
end
