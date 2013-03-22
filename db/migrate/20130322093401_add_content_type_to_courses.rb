class AddContentTypeToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :content_type, :string
  end
end
