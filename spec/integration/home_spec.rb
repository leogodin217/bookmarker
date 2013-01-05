require 'spec_helper'

describe "Home Page" do
  subject { page }
  before { visit root_path }


  it {should have_content 'The Bookmarker'}
  it {should have_selector 'title', :text => 'The Bookmarker'}

  
end