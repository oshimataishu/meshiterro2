class RemoveUserFromPostimages < ActiveRecord::Migration[6.1]
  def change
    remove_column :postimages, :user, :integer
  end
end
