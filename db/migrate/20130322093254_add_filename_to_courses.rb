class AddFilenameToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :filename, :string
  end
end
