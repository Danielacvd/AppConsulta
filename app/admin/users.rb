ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :last_name, :photo, :cargo_id, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :last_name, :photo, :cargo_id, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :email, :password, :name, :last_name, :cargo_id

  index do
  column :id
  column :email
  column :name
  column :last_name
  column :created_at
  actions
end


form do |f|
  inputs 'Agregar un nuevo user' do
    input :name
    input :cargo
    input :last_name
    input :email
    input :password
  end
  actions
end
controller do
 def update
 if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
 params[:user].delete("password")
 params[:user].delete("password_confirmation")
 end
 super
 end
end


end
