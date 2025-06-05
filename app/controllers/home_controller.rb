class HomeController < ApplicationController
  def index
    @total_count = ConfigurationItem.count
    @number_by_type = ConfigurationItem.group(:type).count
    @number_by_status = ConfigurationItem.group(:status).count
  end
end
