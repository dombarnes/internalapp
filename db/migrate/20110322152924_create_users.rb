class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :email,               null: false, default: ""
      t.string    :first_name,          null: false, default: ""
      t.string    :last_name,           null: false, default: ""
      t.string    :company_name
      t.string    :job_title
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
