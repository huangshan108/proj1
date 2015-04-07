class Pokemon < ActiveRecord::Base
	belongs_to :trainer
	validates :name, presence: true, uniqueness: true
	def apply_damage
		if self.health <= 10
			self.destroy
		else
			self.update_attributes(:health => self.health - 10)
		end
	end
end
