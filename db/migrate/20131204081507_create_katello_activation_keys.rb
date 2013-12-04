class CreateKatelloActivationKeys < ActiveRecord::Migration
  def change
    create_table :katello_activation_keys do |t|
      t.string :name

      t.timestamps
    end
  end
end
