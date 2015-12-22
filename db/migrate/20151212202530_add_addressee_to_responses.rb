class AddAddresseeToResponses < ActiveRecord::Migration
  def change
  	add_column :responses, :addressee, :int
  end
end
