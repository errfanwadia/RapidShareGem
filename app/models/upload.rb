class Upload < ActiveRecord::Base
  belongs_to :user

  has_attached_file :file
  # attr_accessor :file
  #
  validates :file, :attachment_presence => true
  do_not_validate_attachment_file_type :file
end
