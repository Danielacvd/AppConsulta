require 'test_helper'

class SesionColegiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sesion_colegio = sesion_colegios(:one)
  end

  test "should get index" do
    get sesion_colegios_url
    assert_response :success
  end

  test "should get new" do
    get new_sesion_colegio_url
    assert_response :success
  end

  test "should create sesion_colegio" do
    assert_difference('SesionColegio.count') do
      post sesion_colegios_url, params: { sesion_colegio: { cita: @sesion_colegio.cita, descripcion: @sesion_colegio.descripcion, numero_cita: @sesion_colegio.numero_cita } }
    end

    assert_redirected_to sesion_colegio_url(SesionColegio.last)
  end

  test "should show sesion_colegio" do
    get sesion_colegio_url(@sesion_colegio)
    assert_response :success
  end

  test "should get edit" do
    get edit_sesion_colegio_url(@sesion_colegio)
    assert_response :success
  end

  test "should update sesion_colegio" do
    patch sesion_colegio_url(@sesion_colegio), params: { sesion_colegio: { cita: @sesion_colegio.cita, descripcion: @sesion_colegio.descripcion, numero_cita: @sesion_colegio.numero_cita } }
    assert_redirected_to sesion_colegio_url(@sesion_colegio)
  end

  test "should destroy sesion_colegio" do
    assert_difference('SesionColegio.count', -1) do
      delete sesion_colegio_url(@sesion_colegio)
    end

    assert_redirected_to sesion_colegios_url
  end
end
