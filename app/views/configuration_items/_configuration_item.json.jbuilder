json.extract! configuration_item, :id, :name, :type, :status, :environment, :created_at, :updated_at
json.url configuration_item_url(configuration_item, format: :json)
