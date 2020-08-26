class CalculateWebpageVisits
  def initialize(website_visits:, unique_visits: false)
    @website_visits = website_visits
    @unique_visits = unique_visits
    @webpage_visit_count = {}
  end

  def call
    calculate_webpage_visits
    descenging_order_of_webpages_per_visits
  end

  private

  attr_reader :website_visits, :unique_visits, :webpage_visit_count

  def calculate_webpage_visits
    website_visits.each do |site, ips|
      @webpage_visit_count[site] = unique_visits ? ips.uniq.count : ips.count
    end
  end

  def descenging_order_of_webpages_per_visits
    webpage_visit_count.sort_by(&:last).reverse
  end
end
