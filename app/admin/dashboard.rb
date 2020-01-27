ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Ultimos usuarios ingresados' do
          ul do
            User.last(5).map do |user|
              li link_to(user.name, admin_user_path(user))
            end
            br
            li "Usuarios totales #{User.count}"
          end
      end
    end
      column do
        panel 'Pacientes totales en el sistema' do
          ul do
            Paciente.last(5).map do |paciente|
              li link_to(paciente.name, admin_user_path(paciente))
            end
          end
          li "Paciente totales #{Paciente.count}"
        end
      end
    end
  end # content
end
