require 'test_helper'

class TutorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutor = tutors(:one)
  end

  test "should get index" do
    get tutors_url
    assert_response :success
  end

  test "should get new" do
    get new_tutor_url
    assert_response :success
  end

  test "should create tutor" do
    assert_difference('Tutor.count') do
      post tutors_url, params: { tutor: { description: @tutor.description, education: @tutor.education, headline: @tutor.headline, subjects: @tutor.subjects, teaching_style: @tutor.teaching_style, user_id: @tutor.user_id, work_experience: @tutor.work_experience, years_teaching: @tutor.years_teaching } }
    end

    assert_redirected_to tutor_url(Tutor.last)
  end

  test "should show tutor" do
    get tutor_url(@tutor)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutor_url(@tutor)
    assert_response :success
  end

  test "should update tutor" do
    patch tutor_url(@tutor), params: { tutor: { description: @tutor.description, education: @tutor.education, headline: @tutor.headline, subjects: @tutor.subjects, teaching_style: @tutor.teaching_style, user_id: @tutor.user_id, work_experience: @tutor.work_experience, years_teaching: @tutor.years_teaching } }
    assert_redirected_to tutor_url(@tutor)
  end

  test "should destroy tutor" do
    assert_difference('Tutor.count', -1) do
      delete tutor_url(@tutor)
    end

    assert_redirected_to tutors_url
  end
end
