class CreateCharities < ActiveRecord::Migration[6.0]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
