ActiveAdmin.register Inquiry do
  permit_params :full_name, :address, :telephone, :email, :product, :notes


  filter :code
  filter :full_name
  filter :address
  filter :telephone
  filter :email
  filter :created_at
  filter :product, as: :select, collection: Inquiry.product.options

  index do
    selectable_column

    id_column

    column :code
    column :full_name
    column :address
    column :telephone
    column :email
    column :product, :product_text
    column :created_at

    actions
  end

  show do
    columns do
      column do
        panel 'Dati cliente' do
          attributes_table_for inquiry do
            row :full_name
            row :telephone
            row :email
          end
        end
      end

      column do
        panel 'Dati sopralluogo' do
          attributes_table_for inquiry do
            row :address do
              simple_format inquiry.address
            end

            row :product do
              inquiry.product.text
            end

            row :notes do
              simple_format inquiry.notes unless inquiry.notes.blank?
            end
          end
        end
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs 'Dati sopralluogo' do
      f.input :address, input_html: { style: 'height: 150px' }
      f.input :telephone, hint: I18n.t('formtastic.hints.inquiry.telephone')
      f.input :email, hint: I18n.t('formtastic.hints.inquiry.email')
      f.input :full_name
      f.input :product
      f.input :notes, input_html: { style: 'height: 150px' }
    end

    f.actions
  end
end
