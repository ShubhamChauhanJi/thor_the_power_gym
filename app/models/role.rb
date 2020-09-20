class Role < ApplicationRecord
	before_save :set_name
	validates :name, uniqueness: true
	has_many :users ,dependent: :destroy

	def set_name
		self.name = self.name.downcase
	end
end
