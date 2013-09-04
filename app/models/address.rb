class Address < ActiveRecord::Base
  belongs_to :agent
  attr_accessible :address1, :address2, :address3, :agent_id, :country, :county, :postcode, :town
end
