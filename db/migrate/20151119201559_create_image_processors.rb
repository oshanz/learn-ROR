class CreateImageProcessors < ActiveRecord::Migration
  def change
    create_table :image_processors do |t|

      t.timestamps null: false
    end
  end
end
