class CreateDigit < ActiveRecord::Migration[6.0]
  def change
    create_table :digits, primary_key: :digit
  end
end
