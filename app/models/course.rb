class Course < ActiveRecord::Base
  attr_accessible :coursedescription, :courseimage,:content_type,:filename,:attachment ,:coursename, :coursetutor, :topics,:category_id
  belongs_to :user
  belongs_to :category
  acts_as_commentable
   letsrate_rateable "quality"
  validates :coursename, presence: true
  validates :coursetutor, presence:true
  validates  :coursedescription,presence: true
  validates  :topics,presence: true
  validates  :category_id,presence: true
  
  def uploaded_file=(incoming_file)
        self.filename = incoming_file.original_filename
        self.content_type = incoming_file.content_type
        self.data = incoming_file.read
    end

    def filename=(new_filename)
        write_attribute("filename", sanitize_filename(new_filename))
    end

    private
    def sanitize_filename(filename)
        #get only the filename, not the whole path (from IE)
        just_filename = File.basename(filename)
        #replace all non-alphanumeric, underscore or periods with underscores
        just_filename.gsub(/[^\w\.\-]/, '_')
    end
end
