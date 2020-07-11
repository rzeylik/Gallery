class CreateSimilarImages < ActiveRecord::Migration[6.0]
  def change
    create_table :similar_images do |t|
      t.string :title
      t.string :image
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
