class CreateVisitations < ActiveRecord::Migration[5.2]
  def change
    create_table :visitations do |t|
      t.datetime :date 
      t.references :alien, foreign_key: {on_delete: :cascade}
      t.references :earthling, foreign_key: {on_delete: :cascade}
    end
  end
end
