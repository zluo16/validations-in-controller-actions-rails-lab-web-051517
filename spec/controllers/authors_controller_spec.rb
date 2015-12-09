require "rails_helper"

RSpec.describe AuthorsController do
  let(:author) { Author.create!(name: "H. Jeff", email: "jeff@sbahj.info") }

  describe "showing an author" do
    it "shows an author" do
      get :show, id: author.id
      expect(assigns(:author)).to eq(author)
    end
  end

  describe "creating a valid author" do
    before { post :create, name: "S. Bro", email: "bro@sbahj.info" }

    it "creates successfully" do
      expect(Author.find_by(name: "S. Bro")).to_not be_nil
    end

    it "redirects to show page" do
      expect(response).to redirect_to(author_path(assigns(:author)))
    end
  end

  describe "creating an invalid author" do
    before { post :create, email: author.email }

    it "does not create" do
      expect(assigns(:author)).to be_new_record
    end

    it "has an error for missing name" do
      expect(assigns(:author).errors[:name]).to_not be_empty
    end

    it "has an error for non-unique email" do
      expect(assigns(:author).errors[:email]).to_not be_empty
    end

    it "renders the form again" do
      expect(response).to render_template(:new)
    end
  end
end
