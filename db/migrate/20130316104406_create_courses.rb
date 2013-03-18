class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :coursedescription
      t.string :courseimage
      t.string :coursename
      t.string :coursetutor
      t.string :topics

      t.timestamps
    end
  end
end
