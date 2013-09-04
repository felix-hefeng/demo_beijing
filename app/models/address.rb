class Address < ActiveRecord::Base
  belongs_to :agent
  attr_accessible :address1, :address2, :address3, :agent_id, :country, :county, :postcode, :town, :is_default
  after_create :set_defaulted

  default_scope :order => "id desc"
  validates_presence_of :address1, :country, :county, :town
  private

  def set_defaulted
    self.update_attributes(is_default: true) if agent.addresses.size == 1
  end

end
