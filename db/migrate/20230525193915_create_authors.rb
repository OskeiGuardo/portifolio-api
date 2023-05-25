class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :description
      t.string :title
      t.string :github
      t.jsonb :social_medias, default: {}

      t.timestamps
    end
  end
end
