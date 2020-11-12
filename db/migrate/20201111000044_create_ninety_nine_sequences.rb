class CreateNinetyNineSequences < ActiveRecord::Migration[6.0]
  def change
    create_view :ninety_nine_sequences
  end
end
