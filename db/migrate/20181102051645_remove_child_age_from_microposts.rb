class RemoveChildAgeFromMicroposts < ActiveRecord::Migration[5.1]
  def change
    remove_column :microposts, :tag, :string
  end
end
