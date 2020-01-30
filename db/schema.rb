# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200130065058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cargos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contactos", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "correo"
    t.text "mensaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "curso"
    t.string "photo"
    t.date "birth_date"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes_tests", id: false, force: :cascade do |t|
    t.bigint "paciente_id", null: false
    t.bigint "test_id", null: false
  end

  create_table "pacientes_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "paciente_id", null: false
  end

  create_table "sesion_colegios", force: :cascade do |t|
    t.date "cita"
    t.text "descripcion"
    t.integer "numero_cita"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tratamiento_id"
    t.index ["tratamiento_id"], name: "index_sesion_colegios_on_tratamiento_id"
  end

  create_table "sesion_particulars", force: :cascade do |t|
    t.date "cita"
    t.text "descripcion_sesion"
    t.integer "numero_cita"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "paciente_id"
    t.index ["paciente_id"], name: "index_sesion_particulars_on_paciente_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.boolean "diag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests_tratamientos", id: false, force: :cascade do |t|
    t.bigint "test_id", null: false
    t.bigint "tratamiento_id", null: false
  end

  create_table "tratamientos", force: :cascade do |t|
    t.string "name"
    t.string "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "paciente_id"
    t.index ["paciente_id"], name: "index_tratamientos_on_paciente_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "photo"
    t.bigint "cargo_id"
    t.integer "role"
    t.index ["cargo_id"], name: "index_users_on_cargo_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "sesion_colegios", "tratamientos"
  add_foreign_key "sesion_particulars", "pacientes"
  add_foreign_key "tratamientos", "pacientes"
  add_foreign_key "users", "cargos"
end
