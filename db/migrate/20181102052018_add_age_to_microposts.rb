class AddAgeToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :child_age, :string
  end
end
