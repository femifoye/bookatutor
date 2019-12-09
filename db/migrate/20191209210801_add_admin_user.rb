class AddAdminUser < ActiveRecord::Migration[5.1]
  def change
    user = User.find(30)
    user.admin = true
    user.save
  end
end
