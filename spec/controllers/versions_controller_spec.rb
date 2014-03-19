require "spec_helper"

describe Outpost::VersionsController do
  render_views

  before :each do
    @user = create :user
    controller.stub(:current_user) { @user }
  end

  describe "GET /activity" do
    it "lists all recent activity" do
      post1 = create :post
      post2 = create :post
      post3 = create :post

      get :activity
      versions = assigns(:versions)

      versions.should include post3.versions.first
      versions.should include post2.versions.first
      versions.should include post1.versions.first
    end
  end


  describe "GET /index" do
    it "lists activity for a record" do
      post1 = create :post
      post2 = create :post

      get :index, resources: "posts", resource_id: post1.id
      assigns(:versions).should eq post1.versions.to_a
    end
  end

  describe "GET /show" do
    it "gets the requested version" do
      post = create :post

      get :show, {
        :resources        => "posts",
        :resource_id      => post.id,
        :version_number   => 1
      }

      assigns(:version).should eq post.versions.first
    end
  end
end
