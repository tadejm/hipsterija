class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
