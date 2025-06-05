class HomeController < ApplicationController
  def index
    @total_count = ConfigurationItem.count
    @number_by_type = ConfigurationItem.group(:type).count
    @number_by_status = ConfigurationItem.group(:status).count
  end

  def report
    # TODO add pagination
    @configuration_items = ConfigurationItem.all

    if ConfigurationItem::TYPES.include?(params[:type])
      @configuration_items = @configuration_items.where(type: params[:type])
    end

    if ConfigurationItem::STATUSES.include?(params[:status])
      @configuration_items = @configuration_items.where(status: params[:status])
    end

    if ConfigurationItem::ENVIRONMENTS.include?(params[:environment])
      @configuration_items = @configuration_items.where(environment: params[:environment])
    end
  end
end
