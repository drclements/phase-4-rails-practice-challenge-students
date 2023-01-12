class Student < ApplicationRecord
    belongs_to :instructor

    validates :name, presence: true
    validates :age,  numericality: {greater_than: 18}
    validates :instructor_id, presence: true
end
