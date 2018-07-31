class Poll < ApplicationRecord
  def self.all_selected selected_poll_ids
    poll_array = []
    selected_poll_ids.each do |id|
      poll_array << find_by(id: id)
    end
    poll_array
  end
end
