require 'test_helper'

class JobseekersControllerTest < ActionController::TestCase
  setup do
    @jobseeker = jobseekers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobseekers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobseeker" do
    assert_difference('Jobseeker.count') do
      post :create, jobseeker: {name: @jobseeker.name, password_hash: @jobseeker.password_hash, password_salt: @jobseeker.password_salt, phonenumber: @jobseeker.phonenumber, resume: @jobseeker.resume, skills: @jobseeker.skills }
    end

    assert_redirected_to jobseeker_path(assigns(:jobseeker))
  end

  test "should show jobseeker" do
    get :show, id: @jobseeker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobseeker
    assert_response :success
  end

  test "should update jobseeker" do
    patch :update, id: @jobseeker, jobseeker: {name: @jobseeker.name, password_hash: @jobseeker.password_hash, password_salt: @jobseeker.password_salt, phonenumber: @jobseeker.phonenumber, resume: @jobseeker.resume, skills: @jobseeker.skills }
    assert_redirected_to jobseeker_path(assigns(:jobseeker))
  end

  test "should destroy jobseeker" do
    assert_difference('Jobseeker.count', -1) do
      delete :destroy, id: @jobseeker
    end

    assert_redirected_to jobseekers_path
  end
end
