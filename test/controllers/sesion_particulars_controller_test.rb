require 'test_helper'

class SesionParticularsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sesion_particular = sesion_particulars(:one)
  end

  test "should get index" do
    get sesion_particulars_url
    assert_response :success
  end

  test "should get new" do
    get new_sesion_particular_url
    assert_response :success
  end

  test "should create sesion_particular" do
    assert_difference('SesionParticular.count') do
      post sesion_particulars_url, params: { sesion_particular: { cita: @sesion_particular.cita, descripcion_sesion: @sesion_particular.descripcion_sesion, numero_cita: @sesion_particular.numero_cita } }
    end

    assert_redirected_to sesion_particular_url(SesionParticular.last)
  end

  test "should show sesion_particular" do
    get sesion_particular_url(@sesion_particular)
    assert_response :success
  end

  test "should get edit" do
    get edit_sesion_particular_url(@sesion_particular)
    assert_response :success
  end

  test "should update sesion_particular" do
    patch sesion_particular_url(@sesion_particular), params: { sesion_particular: { cita: @sesion_particular.cita, descripcion_sesion: @sesion_particular.descripcion_sesion, numero_cita: @sesion_particular.numero_cita } }
    assert_redirected_to sesion_particular_url(@sesion_particular)
  end

  test "should destroy sesion_particular" do
    assert_difference('SesionParticular.count', -1) do
      delete sesion_particular_url(@sesion_particular)
    end

    assert_redirected_to sesion_particulars_url
  end
end
