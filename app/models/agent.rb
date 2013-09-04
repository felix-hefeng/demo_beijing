class Agent < ActiveRecord::Base
  has_many :addresses
  attr_accessible :agent_no, :first_name, :last_name

  def full_name
    first_name + " " + last_name
  end

end
