require 'spec_helper'

# This should return the minimal set of attributes required to create a valid
# User. As you add validations to User, be sure to
# update the return value of this method accordingly.
def valid_attributes
    { content => "testing" } 
end

def valid_comment
    { }
end

describe "Comments" do
  before :each do
    3.times { Comment.create! valid_attributes }
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {:comment => valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "returns a 201 success" do
        post :create, {:comment => valid_attributes}
        response.status.should be(201)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:comment => {  }}, valid_session
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:comment => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "GET /comment/:id" do
    it "returns properly formatted JSON" do
      get :show, {:id => 1}
      JSON.parse(response.body).should be_json_eql
    end
  end

  describe "GET new" do
    it "assigns a new comment as @comment" do
      get :new
      assigns(:comment).should be_a_new(Comment)
    end
  end

  describe "GET edit" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :edit, {:id => comment.to_param}, valid_session
      assigns(:comment).should eq(comment)
    end
  end

  

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        # Assuming there are no other comments in the database, this
        # specifies that the Comment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comment.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => comment.to_param, :comment => { "these" => "params" }}, valid_session
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}, valid_session
        assigns(:comment).should eq(comment)
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}, valid_session
        response.should redirect_to(comment)
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => {  }}, valid_session
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {:id => comment.to_param}, valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, {:id => comment.to_param}, valid_session
      response.should redirect_to(comments_url)
    end
  end

  describe "GET index" do
    it "returns all the records" do
      get :index
      assigns(:groups).should eq([group])
    end
  end
end
