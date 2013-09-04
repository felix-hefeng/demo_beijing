class Agent < ActiveRecord::Base
  has_many :addresses do
    def remove_primary
      each do |address|
        address.update_attributes( is_default: false ) if address.is_default
      end
    end
  end
  attr_accessible :agent_no, :first_name, :last_name
  validates_presence_of :first_name, :last_name
  def full_name
    first_name + " " + last_name
  end

end
