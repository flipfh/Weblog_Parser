class GroupWebpagesAndVisits
  def initialize(webpages_and_ips:)
    @webpages_and_ips = webpages_and_ips
  end

  def call
    group_webpages_and_ips
  end

  private

  attr_reader :webpages_and_ips

  def group_webpages_and_ips
    Hash.new { |hash, key| hash[key] = [] }.tap { |hash| webpages_and_ips.each { |site, ip| hash[site] << ip } }
  end
end
