class DashboardLinks < ActiveRecord::Migration
  def self.up
    create_table :dashboard_links do |t|
      t.column :title,            :string
      t.column :cssclass,         :string
      t.column :path,             :string
      t.column :created_by_id,    :integer
      t.column :updated_by_id,    :integer
      t.column :created_at,       :datetime
      t.column :updated_at,       :datetime
    end
    
  end

  def self.down
    create_table :dashboard_links
  end
end
