require 'spec_helper'

describe "Bookmark" do
  before(:each) { @bookmark = Bookmark.new(name: "Tutorial Site", 
                                   url: "http://railstutorial.org", 
                                   description: "A great Rails 3.2 tutorial. Highly recommended")}

  subject { @bookmark }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe "Without a name" do
    before { @bookmark.name = " " }
    it { should_not be_valid }
  end

  describe "With name too long" do
    before { @bookmark.name = "a"*129 }
    it { should_not be_valid }
  end

  describe "Without a URL" do
    before { @bookmark.url = " " }
    it { should_not be_valid}
  end

  describe "With URL too long" do
    before { @bookmark.url = "http://" + 'a'*250 }
    it { should_not be_valid }
  end

  describe "With description too long" do
    before { @bookmark.description = "a"*513 }
    it { should_not be_valid }
  end

  describe "With http" do
    before { @bookmark.url = "http://www.digg.com" }
    it { should be_valid }
  end

  describe "With https" do
    before { @bookmark.url = "https://www.digg.com" }
    it { should be_valid }
  end

  describe "With ftp" do
    before { @bookmark.url = "ftp://www.digg.com" }
    it { should be_valid }
  end

  describe "With file" do
    before { @bookmark.url = "file://www.digg.com" }
    it { should be_valid }
  end

  describe "With git" do
    before { @bookmark.url = "git://www.digg.com" }
    it { should be_valid }
  end

  # Need to think about formatting. It's easy to validate http/https/ftp/etc..
  # but what about javascript() and others. Maybe just leave it be for now
  # describe "With bad format" do
  #   before { @bookmark.url = "ht://digg.com" }
  #   it {should_not be_valid}
  # end
end