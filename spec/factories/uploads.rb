# rails g factory_girl:model Upload
include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :upload do
    file { fixture_file_upload(Rails.root.join('spec','test_uploads','test.jpeg'), 'image/jpeg') }
    user
  end
end
