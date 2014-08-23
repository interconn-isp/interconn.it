ActiveAdmin.register Inquiry do
  decorate_with InquiryDecorator

  permit_params :full_name, :address, :telephone, :email, :product, :notes

  filter :full_name
  filter :address
  filter :telephone
  filter :email
  filter :created_at
  filter :product, as: :select, collection: Inquiry.product.options

  scope :all

  index do
    selectable_column

    id_column

    column :full_name
    column :address
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
            row :product
            row :address
            row :notes
            row :created_at
          end
        end
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs 'Dati cliente' do
      f.input :full_name
      f.input :telephone, hint: I18n.t('formtastic.hints.inquiry.telephone')
      f.input :email, hint: I18n.t('formtastic.hints.inquiry.email')
    end

    f.inputs 'Dati sopralluogo' do
      f.input :address, input_html: { style: 'height: 100px' }
      f.input :product
      f.input :notes, input_html: { style: 'height: 100px' }
    end

    f.actions
  end
end
