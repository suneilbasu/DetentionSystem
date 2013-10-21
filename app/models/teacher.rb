class Teacher < ActiveRecord::Base
  has_many :detentions
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
