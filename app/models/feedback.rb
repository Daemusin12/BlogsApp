class Feedback < ApplicationRecord
    belongs_to :blog, counter_cache: true
    belongs_to :user
  
    validates :content, presence: true
end
