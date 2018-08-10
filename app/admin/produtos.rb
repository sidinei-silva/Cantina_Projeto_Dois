ActiveAdmin.register Produto do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  menu priority: 2
  permit_params :nome_produto, :descricao_produto, :valor_produto, :imagem_produto, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |form|
    form.semantic_errors *form.object.errors.keys
    form.inputs "Produto" do
      form.input :nome_produto
      form.input :valor_produto
      form.input :image, as: :file
      form.input :descricao_produto
    end
    form.actions
  end

  show :title => :nome_produto do
    attributes_table do
      default_main_content
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end

  end
  config.comments = false
end

