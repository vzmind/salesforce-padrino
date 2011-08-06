class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.text :api_key_private
      t.text :api_key_public
    end
  end

  def self.down
    drop_table :settings
  end
end
