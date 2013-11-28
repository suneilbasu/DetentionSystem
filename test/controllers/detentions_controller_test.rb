require 'test_helper'

class DetentionsControllerTest < ActionController::TestCase
  setup do
    @detention = detentions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detentions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create detention" do # one exists already
    assert_no_difference('Detention.count') do
      post :create, detention: {
        additional_notes: @detention.additional_notes,
        date: @detention.date,
        parent_detention: @detention.parent_detention,
        points: @detention.points,
        reason: @detention.reason,
        status: @detention.status,
        student_id: @detention.student_id,
        teacher_id: @detention.teacher_id,
        time: @detention.time,
      }
    end
  end

  test "should create detention" do
    @detention.date = Date.tomorrow()
    assert_difference('Detention.count') do
      post :create, detention: {
        additional_notes: @detention.additional_notes,
        date: @detention.date,
        parent_detention: @detention.parent_detention,
        points: @detention.points,
        reason: @detention.reason,
        status: @detention.status,
        student_id: @detention.student_id,
        teacher_id: @detention.teacher_id,
        time: @detention.time,
      }
    end

    assert_redirected_to detention_path(assigns(:detention))
  end

  test "should show detention" do
    get :show, id: @detention
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detention
    assert_response :success
  end

  test "should update detention" do
    patch :update, id: @detention, detention: {
      additional_notes: @detention.additional_notes,
      date: @detention.date,
      parent_detention: @detention.parent_detention,
      points: @detention.points,
      reason: @detention.reason,
      status: @detention.status,
      student_id: @detention.student_id,
      teacher_id: @detention.teacher_id,
      time: @detention.time
    }
    assert_redirected_to detention_path(assigns(:detention))
  end

  test "should destroy detention" do
    assert_difference('Detention.count', -1) do
      delete :destroy, id: @detention
    end

    assert_redirected_to detentions_path
  end
end
