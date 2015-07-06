module AR
  class Flow < ActiveRecord::Base
    has_many :positions
    has_one  :first_position, class_name: ::AR::Position
  end
end
