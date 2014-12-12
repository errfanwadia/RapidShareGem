# rails generate rspec:install
# rails generate rspec:model upload

require 'rails_helper'

RSpec.describe Upload, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # it "has none to begin with" do
  #   expect(Upload.count).to eq 0
  # end

  before do
    @file = create(:upload)
  end

  it { expect(@file).to be_valid }

  it { expect(@file.file_file_name).to eq("test.jpeg") }

  it { expect(@file.file_content_type).to eq("image/jpeg") }

  it { expect(@file.file_file_size).to eq(1471266)}

  it {expect(@file.user_id).to eq(1)}

  describe "should save the file" do
    it "must save the file" do
      expect(@file).to be_a(Upload)
    end
  end

  describe "Should destroy the file" do
    it "destroy the file" do
      f = Upload.delete(1)
      expect(f).to eq(1)
    end
  end
end