class WelcomeController < ApplicationController
	def index
		@user = current_user 
		@weed_count = Inventory.where({category: "weed"}).count
		@baked_dino_count = Inventory.where({category: "bakeddinos"}).count
		@dino_count = Inventory.where({category: "dinos"}).count
	end
end 