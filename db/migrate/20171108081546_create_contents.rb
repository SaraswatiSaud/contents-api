class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
