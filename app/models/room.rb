class Room < ActiveRecord::Base
  def complete_name
    "#{title}, #{location}"
  end


  validates_presence_of :title, :location
  validates_length_of :description, minimum: 20, allow_blank:false


end
