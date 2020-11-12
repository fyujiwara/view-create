class CreateMonthlyRegisteredUsers < ActiveRecord::Migration[6.0]
  def change
    create_view :monthly_registered_users
  end
end
