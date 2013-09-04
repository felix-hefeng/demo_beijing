class Address < ActiveRecord::Base
  belongs_to :agent
  attr_accessible :address1, :address2, :address3, :agent_id, :country, :county, :postcode, :town, :is_default
  after_create :set_defaulted

  default_scope :order => "id desc"

  private

  def set_defaulted
    self.update_attributes(is_default: true) if agent.addresses.size == 1
  end

end
