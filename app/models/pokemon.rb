class Pokemon < ActiveRecord::Base
	belongs_to :trainer
	validates :name, presence: true, uniqueness: true
	def apply_damage
		if self.health <= 10
			self.update_attributes(:health => 0)
		else
			self.update_attributes(:health => self.health - 10)
		end
	end

	def apply_heal
		if self.health >= 90
			self.update_attributes(:health => 100)
		else
			self.update_attributes(:health => self.health + 10)
		end
	end

	def add_experience
		if self.experience >= 90
			self.experience = 0
			self.level += 1
		else
			self.experience += 10
		end
		self.update_attributes(:experience => self.experience, :level => self.level)
	end
end
