class AddColumnToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :address, :string
  end
end
