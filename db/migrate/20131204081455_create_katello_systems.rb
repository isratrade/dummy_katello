class CreateKatelloSystems < ActiveRecord::Migration
  def change
    create_table :katello_systems do |t|
      t.string :name

      t.timestamps
    end
  end
end
