ActiveAdmin.register Paciente do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :last_name, :curso, :photo, :birth_date, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :last_name, :curso, :photo, :birth_date, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :name, :last_name, :curso, :birth_date, :role


  index do
  column :id
  column :name
  column :last_name
  column :curso
  column :created_at
  actions
end





end
