class Blog < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    belongs_to :user
    has_many :feedbacks, dependent: :destroy
end
