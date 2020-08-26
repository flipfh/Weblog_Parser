shared_context 'parsed_log_lines' do
  let(:parsed_log_lines) do
    [['/index', '126.318.035.038'],
     ['/about', '722.247.931.582'],
     ['/index', '336.284.013.698'],
     ['/about', '722.247.931.582'],
     ['/index', '126.318.035.038']]
  end
end

shared_context 'webpage_visits' do
  let(:webpage_visits) do
    { '/index' => ['126.318.035.038', '336.284.013.698', '126.318.035.038'],
      '/about' => ['722.247.931.582', '722.247.931.582'] }
  end
end

shared_context 'visits_per_webpage' do
  let(:visits_per_webpage) { [['/index', 3], ['/about', 2]] }
end

shared_context 'uniq_visits_per_webpage' do
  let(:uniq_visits_per_webpage) { [['/index', 2], ['/about', 1]] }
end
